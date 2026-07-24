import React, { useEffect, useState } from 'react';
import ReactFlow, { Background, Controls } from 'reactflow';
import type { EdgeProps } from 'reactflow'; 
import 'reactflow/dist/style.css';
import { useVoltFlowStore } from './store';

function CustomDirectionalWire({
  id, sourceX, sourceY, targetX, targetY, data
}: EdgeProps) {
  const { selectedEdgeId } = useVoltFlowStore();
  const isSelected = selectedEdgeId === id;
  
  const idx = data?.edge_index || 0;
  const isOrphanStub = data?.is_orphan_stub;
  const isSelfLoop = data?.is_self_loop || (sourceX === targetX && sourceY === targetY);

  let pathString = "";
  let midX = (sourceX + targetX) / 2;
  let midY = (sourceY + targetY) / 2;
  let angle = 0;

  if (isOrphanStub) {
    // ---------------------------------------------------------
    // OUTWARD UP-RIGHT STUB (Matching the red arrow trajectory)
    // ---------------------------------------------------------
    const startX = sourceX;
    const startY = sourceY; 
    
    const curveHeight = 100 + idx * 25;
    const curveWidth = 15 + idx * 15;

    // Directs the curve upward and to the right into open canvas space
    const endX = sourceX + curveWidth;
    const endY = startY - curveHeight;

    const cpX = sourceX + (curveWidth * 0.001);
    const cpY = startY - curveHeight;

    pathString = `M ${startX} ${startY} Q ${cpX} ${cpY} ${endX} ${endY}`;
    
    midX = endX;
    midY = endY;
    angle = -42; // Points cleanly up-right along the vector trajectory
  } else if (isSelfLoop) {
    const loopHeight = 110 + idx * 30;
    const loopWidth = 80 + idx * 20;
    const cp1X = sourceX - loopWidth;
    const cp1Y = sourceY - loopHeight;
    const cp2X = sourceX + loopWidth;
    const cp2Y = sourceY - loopHeight;

    pathString = `M ${sourceX} ${sourceY} C ${cp1X} ${cp1Y}, ${cp2X} ${cp2Y}, ${sourceX} ${sourceY}`;
    midX = sourceX;
    midY = sourceY - (loopHeight * 0.75);
    angle = 0; 
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
    angle = Math.atan2(targetY - sourceY, targetX - sourceX) * (180 / Math.PI);
  }

  let strokeColor = '#22c55e'; // Operational Green
  if (data?.color_state === 'YELLOW') strokeColor = '#eab308';
  if (data?.color_state === 'RED') strokeColor = '#ef4444';
  if (isOrphanStub) strokeColor = '#f59e0b'; // Ambient Orange for Deadlink Stub

  return (
    <>
      <path style={{ stroke: 'transparent', strokeWidth: 20, fill: 'none', cursor: 'pointer' }} d={pathString} />
      
      <path
        id={id}
        style={{
          stroke: strokeColor,
          strokeWidth: isSelected ? 5 : 3,
          fill: 'none',
          strokeDasharray: 'none',
          filter: isSelected ? `drop-shadow(0 0 10px ${strokeColor})` : `drop-shadow(0 0 4px ${strokeColor})`,
          cursor: 'pointer'
        }}
        d={pathString}
      />

      <g transform={`translate(${midX}, ${midY}) rotate(${angle})`} style={{ cursor: 'pointer' }}>
        <polygon points="-8,-5 8,0 -8,5" fill={strokeColor} />
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

  const outboundSignals = edges.filter(e => e.source === selectedIED);
  const inboundSignals = edges.filter(e => e.target === selectedIED && e.source !== e.target);
  const selectedEdgeDetails = edges.find(e => e.id === selectedEdgeId);
  const hasAppidCollision = errors.some(err => err.rule_type === 'APPID_COLLISION');

  return (
    <div className="w-full h-screen bg-slate-950 text-slate-100 flex flex-col font-sans overflow-hidden select-none">
      
      <header className="px-6 py-4 bg-slate-900 border-b border-slate-800 flex justify-between items-center shadow-md z-10">
        <div>
          <h1 className="text-xl font-black tracking-tight text-sky-400">VoltFlow SCT Workbench</h1>
          <p className="text-xs text-slate-400 mt-0.5">Brand-Agnostic Substation Grid Interoperability Space</p>
        </div>
        <div className="flex items-center gap-3">
          <button onClick={clearWorkspace} className="px-3 py-1.5 bg-rose-950/40 text-rose-400 border border-rose-900/50 text-xs font-semibold rounded-lg cursor-pointer hover:bg-rose-900/60 transition">🗑 Wipe Screen</button>
          <label className="px-3 py-1.5 bg-slate-800 text-slate-300 border border-slate-700 text-xs font-semibold rounded-lg cursor-pointer hover:bg-slate-700 transition">
            <span>📂 Upload Profile (.SCD / .CID / .IID)</span>
            <input type="file" accept=".scd,.cid,.iid,.icd,.xml" onChange={handleUiFileUpload} className="hidden" />
          </label>
        </div>
      </header>

      <div className="flex-1 flex overflow-hidden">
        
        {/* Left Interactive Compliance Errors Panel */}
        <div className="w-80 border-r border-slate-800 bg-slate-900/30 flex flex-col">
          <div className="p-4 border-b border-slate-800 bg-slate-900/60 flex justify-between items-center">
            <span className="text-xs font-bold uppercase tracking-wider text-slate-400">Compliance Errors</span>
            <span className="bg-red-950 text-red-400 border border-red-900 text-[10px] font-mono px-2 py-0.5 rounded-full font-bold">{errors.length}</span>
          </div>
          <div className="flex-1 overflow-y-auto p-4 space-y-3">
            {errors.length === 0 ? (
              <div className="text-center py-12 text-xs text-slate-600 italic">No configuration mismatch anomalies captured.</div>
            ) : (
              errors.map(err => {
                const isSelected = selectedEdgeId === err.xpath;
                return (
                  <div 
                    key={err.id} 
                    onClick={() => setSelectedEdgeId(err.xpath)}
                    className={`p-3.5 rounded-xl border text-xs cursor-pointer transition-all ${
                      isSelected 
                        ? 'bg-amber-950/60 border-amber-500 shadow-lg shadow-amber-950/50 ring-1 ring-amber-500' 
                        : 'bg-slate-950/40 border-slate-800 hover:border-amber-500/50'
                    }`}
                  >
                    <div className="font-bold text-amber-400 font-mono flex justify-between items-center">
                      <span>{err.rule_type}</span>
                      <span className="text-[10px] text-slate-500 font-sans uppercase">Tap to inspect ➔</span>
                    </div>
                    <p className="mt-1.5 text-slate-300 leading-relaxed font-sans">{err.message}</p>
                  </div>
                );
              })
            )}
          </div>
        </div>

        {/* Central Canvas Screen */}
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

        {/* Right Dynamic Device Inspector */}
        <div className="w-96 border-l border-slate-800 bg-slate-900/60 backdrop-blur-md p-6 flex flex-col shadow-2xl overflow-y-auto space-y-6">
          <h2 className="text-xs font-bold uppercase tracking-widest text-slate-500">Device Inspector</h2>
          
          {selectedEdgeDetails ? (() => {
            const details = selectedEdgeDetails.data.network_details;
            const isOrphan = selectedEdgeDetails.data.is_orphan_stub;
            const revMismatch = details.pub_rev !== details.sub_rev;
            const appidMismatch = details.appid !== details.sub_appid;
            
            return (
              <div className="space-y-5 animate-fadeIn">
                <div className="p-4 bg-slate-950/80 border border-slate-800 rounded-xl">
                  <div className="text-[10px] text-sky-400 font-mono uppercase tracking-wider">GOOSE Stream Comparator</div>
                  <div className="text-sm font-mono font-black text-slate-200 mt-1 break-all">cb: {details.cb_name}</div>
                  <div className="text-[10px] text-slate-500 font-mono mt-1">{isOrphan ? `${selectedEdgeDetails.source} (Orphaned Outbound Stub)` : `${selectedEdgeDetails.source} → ${selectedEdgeDetails.target}`}</div>
                </div>

                <div className="p-4 bg-slate-950/40 border border-slate-800 rounded-xl space-y-4 font-mono text-xs">
                  <div className="text-xs font-bold text-slate-400 border-b border-slate-800 pb-1.5 flex justify-between">
                    <span>Parameter Grid</span>
                    <span className={`text-[10px] px-1.5 py-0.5 rounded font-bold ${
                      isOrphan 
                        ? 'bg-amber-950 text-amber-400 border border-amber-900' 
                        : selectedEdgeDetails.data.color_state === 'GREEN' 
                        ? 'bg-green-950 text-green-400 border border-green-900' 
                        : 'bg-amber-950 text-amber-400 border border-amber-900'
                    }`}>
                      {isOrphan ? '0 LISTENERS (ORPHANED)' : selectedEdgeDetails.data.color_state === 'GREEN' ? 'OPERATIONAL' : 'DRIFT DETECTED'}
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
                      <span className={`text-center font-bold ${revMismatch ? 'text-amber-400 font-black' : 'text-slate-300'}`}>{details.pub_rev || '—'}</span>
                      <span className={`text-right font-bold ${revMismatch ? 'text-amber-400 font-black' : 'text-slate-300'}`}>{details.sub_rev || '—'}</span>
                    </div>
                    
                    <div className="grid grid-cols-3 text-[11px] border-b border-slate-900/40 pb-1">
                      <span className="text-slate-500">APPID</span>
                      <span className={`text-center font-bold ${hasAppidCollision ? 'text-rose-500 font-black' : appidMismatch ? 'text-amber-400 font-black' : 'text-slate-300'}`}>{details.appid || '—'}</span>
                      <span className={`text-right font-bold ${hasAppidCollision ? 'text-rose-500 font-black' : appidMismatch ? 'text-amber-400 font-black' : 'text-slate-300'}`}>{details.sub_appid || '—'}</span>
                    </div>
                    
                    <div className="grid grid-cols-3 text-[11px] border-b border-slate-900/40 pb-1">
                      <span className="text-slate-500">VLAN ID</span>
                      <span className="text-slate-300 text-center">{details.vlan_id || '—'}</span>
                      <span className="text-slate-300 text-right">{details.sub_vlan || '—'}</span>
                    </div>
                    
                    <div className="grid grid-cols-3 text-[11px] border-b border-slate-900/40 pb-1">
                      <span className="text-slate-500">Priority</span>
                      <span className="text-slate-300 text-center">{details.vlan_priority || '—'}</span>
                      <span className="text-slate-300 text-right">{details.sub_pri || '—'}</span>
                    </div>
                    
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
                        <span className="text-emerald-400 pl-1">{details.sub_mac || '—'}</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            );
          })() : selectedIED ? (
            <div className="space-y-6 animate-fadeIn">
              <div className="p-4 bg-slate-950/80 border border-slate-800 rounded-xl">
                <div className="text-[10px] text-slate-500 uppercase tracking-wider">Active Device Node</div>
                <div className="text-base font-mono font-black text-emerald-400 mt-1 break-all">{selectedIED}</div>
              </div>

              <div>
                <div className="flex justify-between items-center mb-3">
                  <h3 className="text-xs font-bold uppercase tracking-wider text-slate-400">Published Signals</h3>
                  <span className="bg-sky-950/80 text-sky-400 text-[10px] px-2 py-0.5 rounded border border-sky-900/50 font-mono font-bold">{outboundSignals.length} OUT</span>
                </div>
                <div className="space-y-2">
                  {outboundSignals.length === 0 ? <p className="text-xs text-slate-600 italic pl-1">No outbound streams compiled.</p> : outboundSignals.map(sig => {
                    const isExpanded = expandedSignal === `pub_${sig.id}`;
                    const details = sig.data.network_details;
                    const isStub = sig.data.is_orphan_stub;
                    return (
                      <div key={`pub_${sig.id}`} className="bg-slate-950/40 border border-slate-800/80 rounded-xl overflow-hidden">
                        <div onClick={() => setExpandedSignal(isExpanded ? null : `pub_${sig.id}`)} className="p-3 hover:bg-slate-900/40 cursor-pointer flex flex-col text-xs font-mono">
                          <div className="text-sky-400 font-bold">cb: {details.cb_name}</div>
                          <div className="text-amber-500 text-[10px] mt-0.5">{isStub ? '📡 Outbound Stub (0 Listeners)' : `Destination → ${sig.target}`}</div>
                        </div>
                        {isExpanded && (
                          <div className="px-4 pb-4 pt-1 bg-slate-950/70 space-y-2 font-mono text-[11px] border-t border-slate-900 animate-fadeIn">
                            <div className="flex justify-between border-b border-slate-900/40 pb-1 pt-1"><span className="text-slate-500">Dataset Name:</span><span className="text-slate-300 font-bold truncate max-w-[160px] text-right">{details.dataset || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">Live Pub Revision:</span><span className="text-amber-400 font-bold">{details.pub_rev || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">APPID:</span><span className="text-sky-300 font-bold">{details.appid || '—'}</span></div>
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
                            <div className="flex justify-between border-b border-slate-900/40 pb-1 pt-1"><span className="text-slate-500">Live Pub Revision:</span><span className="text-slate-300 font-bold">{details.pub_rev || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">Expected Revision:</span><span className="text-amber-400 font-bold">{details.sub_rev || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">Expected APPID:</span><span className="text-sky-300 font-bold">{details.sub_appid || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">Expected VLAN:</span><span className="text-emerald-400 font-bold">{details.sub_vlan || '—'}</span></div>
                            <div className="flex justify-between border-b border-slate-900/40 pb-1"><span className="text-slate-500">Expected Priority:</span><span className="text-indigo-400 font-bold">{details.sub_pri || '—'}</span></div>
                            <div className="flex flex-col gap-1 pt-1">
                              <span className="text-slate-500">Expected Target MAC Address:</span>
                              <span className="text-[10px] bg-slate-950 p-1.5 rounded border border-slate-900 text-emerald-400 text-center select-all">{details.sub_mac || '—'}</span>
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