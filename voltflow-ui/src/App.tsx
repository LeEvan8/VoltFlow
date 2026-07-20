import React, { useEffect, useState } from 'react';
import ReactFlow, { Background, Controls } from 'reactflow';
import type { EdgeProps } from 'reactflow'; 
import 'reactflow/dist/style.css';
import { useVoltFlowStore } from './store';

// Custom Arc Wire Component Module
function CustomDirectionalWire({
  id, sourceX, sourceY, targetX, targetY, data
}: EdgeProps) {
  const { selectedEdgeId } = useVoltFlowStore();
  const isSelected = selectedEdgeId === id;
  
  const idx = data?.edge_index || 0;
  const isSelfLoop = sourceX === targetX && sourceY === targetY;

  let pathString = "";
  let midX = (sourceX + targetX) / 2;
  let midY = (sourceY + targetY) / 2;
  let angle = Math.atan2(targetY - sourceY, targetX - sourceX) * (180 / Math.PI);

  if (isSelfLoop) {
    const radius = 30 + idx * 15;
    pathString = `M ${sourceX} ${sourceY} A ${radius} ${radius} 0 1 0 ${sourceX + 0.1} ${sourceY}`;
    midX = sourceX - radius;
    midY = sourceY;
    angle = -90;
  } else {
    const curveOffset = (idx % 2 === 0 ? 1 : -1) * Math.ceil(idx / 2) * 45;
    const dx = targetX - sourceX;
    const dy = targetY - sourceY;
    const len = Math.sqrt(dx * dx + dy * dy) || 1;
    const nx = -dy / len;
    const ny = dx / len;

    const controlX = midX + nx * curveOffset;
    const controlY = midY + ny * curveOffset;

    pathString = `M ${sourceX} ${sourceY} Q ${controlX} ${controlY} ${targetX} ${targetY}`;
    midX = midX + nx * (curveOffset * 0.5);
    midY = midY + ny * (curveOffset * 0.5);
  }

  let strokeColor = '#22c55e'; 
  let isBlinking = false;

  if (data?.color_state === 'YELLOW') strokeColor = '#eab308';
  if (data?.color_state === 'RED') { strokeColor = '#ef4444'; isBlinking = true; }

  return (
    <>
      <path style={{ stroke: 'transparent', strokeWidth: 15, fill: 'none', cursor: 'pointer' }} d={pathString} />
      <path
        id={id}
        className={`${isBlinking ? 'animate-pulse' : ''}`}
        style={{
          stroke: strokeColor,
          strokeWidth: isSelected ? 5 : 3,
          fill: 'none',
          strokeDasharray: isSelfLoop ? '5,5' : 'none',
          filter: isSelected ? `drop-shadow(0 0 6px ${strokeColor})` : 'none',
          cursor: 'pointer'
        }}
        d={pathString}
      />
      <g transform={`translate(${midX}, ${midY}) rotate(${angle})`} style={{ cursor: 'pointer' }}>
        <polygon points="-8,-6 8,0 -8,6" fill={strokeColor} className={isBlinking ? 'animate-ping' : ''} />
      </g>
    </>
  );
}

const customEdgeTypes = { directionalWire: CustomDirectionalWire };

export default function App() {
  const { nodes, edges, errors, selectedIED, selectedEdgeId, fetchTopology, setSelectedIED, setSelectedEdgeId, clearWorkspace } = useVoltFlowStore();
  const [expandedSignal, setExpandedSignal] = useState<string | null>(null);

  useEffect(() => { fetchTopology(); }, [fetchTopology]);

  const handleUiFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    if (!e.target.files?.[0]) return;
    const formData = new FormData();
    formData.append('file', e.target.files[0]);
    try {
      await fetch('http://localhost:8000/api/v1/upload', { method: 'POST', body: formData });
      fetchTopology();
    } catch (err) { console.error(err); }
  };

  const visibleEdges = edges.filter(e => e.source !== e.target);
  const outboundSignals = edges.filter(e => e.source === selectedIED);
  const inboundSignals = edges.filter(e => e.target === selectedIED && e.source !== e.target);

  const selectedEdgeDetails = edges.find(e => e.id === selectedEdgeId);

  return (
    <div className="w-full h-screen bg-slate-950 text-slate-100 flex flex-col font-sans overflow-hidden select-none">
      
      <header className="px-6 py-4 bg-slate-900 border-b border-slate-800 flex justify-between items-center shadow-md z-10">
        <div>
          <h1 className="text-xl font-black tracking-tight text-sky-400">VoltFlow SCT Workbench</h1>
          <p className="text-xs text-slate-400 mt-0.5">Strict Isolated Substation Field Verification Space</p>
        </div>
        <div className="flex items-center gap-3">
          <button onClick={clearWorkspace} className="px-3 py-1.5 bg-rose-950/40 text-rose-400 border border-rose-900/50 text-xs font-semibold rounded-lg cursor-pointer">🗑 Wipe Screen</button>
          <label className="px-3 py-1.5 bg-slate-800 text-slate-300 border border-slate-700 text-xs font-semibold rounded-lg cursor-pointer">
            <span>📂 Upload Profile (.SCD / .CID / .IID)</span>
            <input type="file" accept=".scd,.cid,.iid,.icd,.xml" onChange={handleUiFileUpload} className="hidden" />
          </label>
        </div>
      </header>

      <div className="flex-1 flex overflow-hidden">
        
        {/* Left Side Errors Panel */}
        <div className="w-72 border-r border-slate-800 bg-slate-900/30 flex flex-col">
          <div className="p-4 border-b border-slate-800 bg-slate-900/60"><span className="text-xs font-bold uppercase tracking-wider text-slate-400">Compliance Errors</span></div>
          <div className="flex-1 overflow-y-auto p-4 space-y-3">
            {errors.length === 0 ? <div className="text-center py-8 text-xs text-slate-600 italic">No configuration mismatch anomalies captured.</div> : errors.map(err => (
              <div key={err.id} className="p-3 bg-red-950/10 border border-red-500/20 rounded-xl text-xs">
                <div className="font-bold text-red-400 font-mono flex justify-between"><span>{err.rule_type}</span></div>
                <p className="mt-1 text-slate-400 leading-relaxed font-sans">{err.message}</p>
              </div>
            ))}
          </div>
        </div>

        {/* Central Display Layer Canvas */}
        <div className="flex-1 bg-slate-950 relative">
          <ReactFlow 
            nodes={nodes} edges={edges} edgeTypes={customEdgeTypes}
            onNodeClick={(_, node) => setSelectedIED(node.id)}
            onEdgeClick={(_, edge) => setSelectedEdgeId(edge.id)}
            onPaneClick={() => { setSelectedIED(null); setSelectedEdgeId(null); }}
            fitView
          >
            <Background color="#1e293b" gap={24} size={1.2} />
            <Controls />
          </ReactFlow>
        </div>

        {/* Right Dynamic Sidebar Inspector Container */}
        <div className="w-96 border-l border-slate-800 bg-slate-900/60 backdrop-blur-md p-6 flex flex-col shadow-2xl overflow-y-auto space-y-6">
          <h2 className="text-xs font-bold uppercase tracking-widest text-slate-500">Device Inspector</h2>
          
          {/* CASE 1: STREAM LEVEL ATTRIBUTE EVALUATION MATRIX COMPARATOR */}
          {selectedEdgeDetails ? (() => {
            const details = selectedEdgeDetails.data.network_details;
            const revMismatch = details.pub_rev !== details.sub_rev;
            const appidMismatch = details.appid !== details.sub_appid && details.sub_appid !== '—';
            const vlanMismatch = details.vlan_id !== details.sub_vlan && details.sub_vlan !== '—';
            const priMismatch = details.vlan_priority !== details.sub_pri && details.sub_pri !== '—';
            const macMismatch = details.mac_address !== details.sub_mac && details.sub_mac !== '—';
            
            return (
              <div className="space-y-5 animate-fadeIn">
                <div className="p-4 bg-slate-950/80 border border-slate-800 rounded-xl">
                  <div className="text-[10px] text-sky-400 font-mono uppercase tracking-wider">GOOSE Stream Comparator</div>
                  <div className="text-sm font-mono font-black text-slate-200 mt-1 break-all">cb: {details.cb_name}</div>
                  <div className="text-[10px] text-slate-500 font-mono mt-1">{selectedEdgeDetails.source} → {selectedEdgeDetails.target}</div>
                </div>

                <div className="p-4 bg-slate-950/40 border border-slate-800 rounded-xl space-y-4 font-mono text-xs">
                  <div className="text-xs font-bold text-slate-400 border-b border-slate-800 pb-1.5 flex justify-between">
                    <span>Parameter Grid</span>
                    <span className={`text-[10px] px-1.5 rounded ${selectedEdgeDetails.data.color_state === 'GREEN' ? 'bg-green-950 text-green-400' : 'bg-amber-950 text-amber-400'}`}>
                      {selectedEdgeDetails.data.color_state === 'GREEN' ? 'OPERATIONAL' : 'DRIFT DETECTED'}
                    </span>
                  </div>

                  <div className="space-y-3">
                    <div className="grid grid-cols-3 text-[11px] border-b border-slate-900/60 pb-1.5">
                      <span className="text-slate-500">Attribute</span>
                      <span className="text-sky-400 font-bold text-center">Publisher</span>
                      <span className="text-emerald-400 font-bold text-right">Subscriber</span>
                    </div>
                    <div className="grid grid-cols-3 text-[11px] border-b border-slate-900/40 pb-1">
                      <span className="text-slate-500">confRev</span>
                      <span className="text-slate-300 font-bold text-center">{details.pub_rev || '—'}</span>
                      <span className={`font-bold text-right ${revMismatch ? 'text-red-400 font-black animate-pulse' : 'text-slate-300'}`}>{details.sub_rev || '—'}</span>
                    </div>
                    <div className="grid grid-cols-3 text-[11px] border-b border-slate-900/40 pb-1">
                      <span className="text-slate-500">APPID</span>
                      <span className="text-slate-300 text-center font-semibold">{details.appid || '—'}</span>
                      <span className={`font-bold text-right ${appidMismatch ? 'text-amber-400' : 'text-slate-300'}`}>{details.sub_appid || '—'}</span>
                    </div>
                    <div className="grid grid-cols-3 text-[11px] border-b border-slate-900/40 pb-1">
                      <span className="text-slate-500">VLAN ID</span>
                      <span className="text-slate-300 text-center">{details.vlan_id || '—'}</span>
                      <span className={`font-bold text-right ${vlanMismatch ? 'text-amber-400' : 'text-slate-300'}`}>{details.sub_vlan || '—'}</span>
                    </div>
                    <div className="grid grid-cols-3 text-[11px] border-b border-slate-900/40 pb-1">
                      <span className="text-slate-500">Priority</span>
                      <span className="text-slate-300 text-center">{details.vlan_priority || '—'}</span>
                      <span className={`font-bold text-right ${priMismatch ? 'text-amber-400' : 'text-slate-300'}`}>{details.sub_pri || '—'}</span>
                    </div>
                    
                    {/* Performance Profile Metrics Section Block */}
                    <div className="grid grid-cols-3 text-[11px] border-b border-slate-900/40 pb-1 pt-1.5 text-slate-400">
                      <span>MinTime</span>
                      <span className="text-center font-bold text-slate-300">{details.min_time || '—'}</span>
                      <span className="text-right text-slate-500">n/a</span>
                    </div>
                    <div className="grid grid-cols-3 text-[11px] border-b border-slate-900/40 pb-1 text-slate-400">
                      <span>MaxTime</span>
                      <span className="text-center font-bold text-slate-300">{details.max_time || '—'}</span>
                      <span className="text-right text-slate-500">n/a</span>
                    </div>

                    <div className="flex flex-col gap-1 pt-1">
                      <span className="text-slate-500 text-[10px]">Multicast MAC Domain Address:</span>
                      <div className="grid grid-cols-2 text-[10px] font-mono bg-slate-950 p-2 rounded border border-slate-900 text-slate-300 text-center tracking-wider">
                        <span className="text-sky-400 border-r border-slate-900 pr-1">{details.mac_address || '—'}</span>
                        <span className={`pl-1 ${macMismatch ? 'text-amber-400 font-bold' : 'text-emerald-400'}`}>{details.sub_mac || '—'}</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            );
          })() : selectedIED ? (
            
            /* CASE 2: BASE LAYER INDIDUAL RELAY SELECTION FLOW LISTS */
            <div className="space-y-6 animate-fadeIn">
              <div className="p-4 bg-slate-950/80 border border-slate-800 rounded-xl">
                <div className="text-[10px] text-slate-500 uppercase tracking-wider">Active Device Node</div>
                <div className="text-base font-mono font-black text-emerald-400 mt-1 break-all">{selectedIED}</div>
              </div>

              {/* Published Streams Dropdowns Container */}
              <div>
                <div className="flex justify-between items-center mb-3">
                  <h3 className="text-xs font-bold uppercase tracking-wider text-slate-400">Published Signals</h3>
                  <span className="bg-sky-950/80 text-sky-400 text-[10px] px-2 py-0.5 rounded border border-sky-900/50 font-mono font-bold">{outboundSignals.length} OUT</span>
                </div>
                <div className="space-y-2">
                  {outboundSignals.length === 0 ? <p className="text-xs text-slate-600 italic pl-1">No outbound streams compiled.</p> : outboundSignals.map(sig => {
                    const isExpanded = expandedSignal === `pub_${sig.id}`;
                    const details = sig.data.network_details;
                    return (
                      <div key={`pub_${sig.id}`} className="bg-slate-950/40 border border-slate-800/80 rounded-xl overflow-hidden">
                        <div onClick={() => setExpandedSignal(isExpanded ? null : `pub_${sig.id}`)} className="p-3 hover:bg-slate-900/40 cursor-pointer flex flex-col text-xs font-mono">
                          <div className="text-sky-400 font-bold">cb: {details.cb_name}</div>
                          <div className="text-slate-500 text-[10px] mt-0.5">{sig.source === sig.target ? 'Target: Standalone Local' : `Destination → ${sig.target}`}</div>
                        </div>
                        {isExpanded && (
                          <div className="px-4 pb-4 pt-1 bg-slate-950/70 space-y-2 font-mono text-[11px] border-t border-slate-900 animate-fadeIn">
                            <div className="flex justify-between border-b border-slate-900/40 pb-1 pt-1"><span className="text-slate-500">Dataset Name:</span><span className="text-slate-300 font-bold truncate max-w-[160px] text-right" title={details.dataset}>{details.dataset || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">Live Pub Revision:</span><span className="text-amber-400 font-bold font-black">{details.pub_rev || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">APPID:</span><span className="text-sky-300 font-bold truncate max-w-[160px] text-right">{details.appid || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">VLAN ID:</span><span className="text-emerald-400 font-bold">{details.vlan_id || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">VLAN Priority:</span><span className="text-indigo-400 font-bold">{details.vlan_priority || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">MinTime / MaxTime:</span><span className="text-slate-300 font-bold">{details.min_time}ms / {details.max_time}ms</span></div>
                            <div className="flex flex-col gap-1 pt-1">
                              <span className="text-slate-500">Multicast MAC Address:</span>
                              <span className="text-[10px] bg-slate-950 p-1.5 rounded border border-slate-900 text-slate-300 text-center select-all">{details.mac_address || '—'}</span>
                            </div>
                          </div>
                        )}
                      </div>
                    );
                  })}
                </div>
              </div>

              {/* Subscribed Flow Dropdowns Container */}
              <div>
                <div className="flex justify-between items-center mb-3">
                  <h3 className="text-xs font-bold uppercase tracking-wider text-slate-400">Subscribed Inputs</h3>
                  <span className="bg-emerald-950/80 text-emerald-400 text-[10px] px-2 py-0.5 rounded border border-emerald-900/50 font-mono font-bold">{inboundSignals.length} IN</span>
                </div>
                <div className="space-y-2">
                  {inboundSignals.length === 0 ? <p className="text-xs text-slate-600 italic pl-1">No inbound subscriptions mapped.</p> : inboundSignals.map(sig => {
                    const isExpanded = expandedSignal === `sub_${sig.id}`;
                    const details = sig.data.network_details;
                    return (
                      <div key={`sub_${sig.id}`} className="bg-slate-950/40 border border-slate-800/80 rounded-xl overflow-hidden">
                        <div onClick={() => setExpandedSignal(isExpanded ? null : `sub_${sig.id}`)} className="p-3 hover:bg-slate-900/40 cursor-pointer flex flex-col text-xs font-mono">
                          <div className="text-emerald-400 font-bold">cb: {details.cb_name}</div>
                          <div className="text-slate-500 text-[10px] mt-0.5">Source ← {sig.source}</div>
                        </div>
                        {isExpanded && (
                          <div className="px-4 pb-4 pt-1 bg-slate-950/70 space-y-2 font-mono text-[11px] border-t border-slate-900 animate-fadeIn">
                            <div className="flex justify-between border-b border-slate-900/40 pb-1 pt-1"><span className="text-slate-500">Dataset Name:</span><span className="text-slate-300 font-bold truncate max-w-[160px] text-right" title={details.dataset}>{details.dataset || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">Live Pub Revision:</span><span className="text-amber-400 font-bold font-black">{details.pub_rev || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">Expected Sub Revision:</span><span className={`font-bold ${details.pub_rev !== details.sub_rev ? 'text-rose-400 animate-pulse font-black' : 'text-slate-300'}`}>{details.sub_rev || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">Expected APPID:</span><span className="text-sky-300 font-bold truncate max-w-[160px] text-right">{details.sub_appid || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">Expected VLAN ID:</span><span className="text-emerald-400 font-bold">{details.sub_vlan || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">Expected Priority:</span><span className="text-indigo-400 font-bold">{details.sub_pri || '—'}</span></div>
                            <div className="flex flex-col gap-1 pt-1">
                              <span className="text-slate-500">Expected MAC Address:</span>
                              <span className="text-[10px] bg-slate-950 p-1.5 rounded border border-slate-900 text-slate-300 text-center select-all">{details.sub_mac || '—'}</span>
                            </div>
                          </div>
                        )}
                      </div>
                    );
                  })}
                </div>
              </div>
            </div>
          ) : (
            <div className="text-xs text-slate-500 italic p-4 bg-slate-950/40 rounded-xl border border-slate-900/40 text-center leading-relaxed">
              Select an IED box or click any curved wire connection path directly on the canvas screen to view parameters.
            </div>
          )}
        </div>

      </div>
    </div>
  );
}