import React, { useEffect, useState } from 'react';
import ReactFlow, { Background, Controls } from 'reactflow';
import 'reactflow/dist/style.css';
import { useVoltFlowStore } from './store';

export default function App() {
  const { 
    nodes, edges, errors, selectedIED, activeErrorLine, selectedXpath, loading, 
    fetchTopology, setSelectedIED, jumpToLine, setFilename, clearWorkspace 
  } = useVoltFlowStore();

  const [expandedSignal, setExpandedSignal] = useState<string | null>(null);

  useEffect(() => {
    fetchTopology();
  }, [fetchTopology]);

  useEffect(() => {
    setExpandedSignal(null);
  }, [selectedIED]);

  const displayedErrors = selectedIED 
    ? errors.filter(err => err.ied_name === selectedIED || err.message.includes(`'${selectedIED}'`))
    : errors;

  const handleUiFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    if (!e.target.files?.[0]) return;
    const targetFile = e.target.files[0];
    setFilename(targetFile.name);
    
    const formData = new FormData();
    formData.append('file', targetFile);

    try {
      await fetch('http://localhost:8000/api/v1/upload', {
        method: 'POST',
        body: formData,
      });
      fetchTopology();
    } catch (err) {
      console.error("UI Ingestion Exception Error:", err);
    }
  };

  const outboundEdges = edges.filter(e => e.source === selectedIED);
  const inboundEdges = edges.filter(e => e.target === selectedIED);

  return (
    <div className="w-full h-screen bg-slate-950 text-slate-100 flex flex-col font-sans select-none overflow-hidden">
      
      <header className="px-6 py-4 bg-slate-900 border-b border-slate-800 flex justify-between items-center shadow-md z-10">
        <div>
          <h1 className="text-xl font-black tracking-tight text-sky-400 flex items-center gap-2">
            VoltFlow Workspace
            <span className="text-[10px] tracking-normal font-mono bg-emerald-950/80 border border-emerald-800 text-emerald-300 px-2 py-0.5 rounded-md">
              True Decoupled Cross-Validation Active
            </span>
          </h1>
          <p className="text-xs text-slate-400 mt-0.5">Multi-Vendor Protection Substation Rule Inspector Matrix</p>
        </div>
        
        <div className="flex items-center gap-3">
          {(nodes.length > 0 || errors.length > 0) && (
            <button 
              onClick={() => {
                if(confirm("Are you sure you want to clear all current vendor files from this session?")) {
                  clearWorkspace();
                }
              }}
              className="px-3 py-1.5 bg-rose-950/40 hover:bg-rose-900/60 text-rose-400 border border-rose-900/50 text-xs font-semibold rounded-lg transition-colors cursor-pointer"
            >
              🗑️ Clear Session
            </button>
          )}

          <label className="px-3 py-1.5 bg-slate-800 hover:bg-slate-700 text-slate-300 border border-slate-700 text-xs font-semibold rounded-lg cursor-pointer transition-colors">
            <span>📂 Load SCL Document</span>
            <input type="file" accept=".scd,.cid,.icd,.xml" onChange={handleUiFileUpload} className="hidden" />
          </label>
          
          <button onClick={() => fetchTopology()} disabled={loading} className="px-4 py-1.5 bg-sky-600 hover:bg-sky-500 disabled:opacity-50 text-xs font-bold rounded-lg transition-colors cursor-pointer">
            {loading ? "Refreshing..." : "Sync Logs"}
          </button>
        </div>
      </header>

      <div className="flex-1 flex overflow-hidden">
        
        <div className="w-80 border-r border-slate-800 bg-slate-900/40 flex flex-col z-10">
          <div className="p-4 border-b border-slate-800 bg-slate-900/60 flex justify-between items-center">
            <span className="text-xs font-bold uppercase tracking-wider text-slate-400">Diagnostic Rule Logs</span>
            {selectedIED && (
              <button onClick={() => setSelectedIED(null)} className="text-[10px] bg-slate-800 hover:bg-slate-700 text-amber-400 px-2 py-0.5 border border-slate-700 rounded transition-all cursor-pointer">
                Reset Filter
              </button>
            )}
          </div>

          <div className="flex-1 overflow-y-auto p-4 space-y-3">
            {displayedErrors.length === 0 ? (
              <div className="text-center py-8 text-xs text-slate-500 italic">No configuration mismatch anomalies recorded.</div>
            ) : (
              displayedErrors.map(err => (
                <div 
                  key={err.id}
                  onClick={() => {
                    jumpToLine(err.xpath);
                    setSelectedIED(err.ied_name);
                  }}
                  className={`p-3.5 rounded-xl border text-xs cursor-pointer transition-all duration-150 ${
                    selectedXpath === err.xpath 
                      ? 'border-rose-500 bg-rose-950/30 ring-1 ring-rose-500/30 shadow-lg' 
                      : err.severity === 'ERROR' 
                        ? 'border-red-500/20 bg-red-950/10 hover:bg-red-950/20' 
                        : 'border-amber-500/20 bg-amber-950/10 hover:bg-amber-950/20'
                  }`}
                >
                  <div className="flex justify-between items-center font-bold">
                    <span className="font-mono text-slate-200 tracking-tight">{err.rule_type}</span>
                    <span className={`text-[10px] font-mono px-1.5 py-0.5 rounded ${
                      err.severity === 'ERROR' ? 'bg-red-950 text-red-400 border border-red-900/50' : 'bg-amber-950 text-amber-400 border border-amber-900/50'
                    }`}>{err.severity}</span>
                  </div>
                  <p className="mt-2 text-slate-400 leading-relaxed font-sans">{err.message}</p>
                </div>
              ))
            )}
          </div>
        </div>

        <div className="flex-1 flex flex-col overflow-hidden">
          <div className="flex-1 min-h-[50%] bg-slate-950 relative">
            <ReactFlow nodes={nodes} edges={edges} onNodeClick={(_, node) => setSelectedIED(node.id)} onPaneClick={() => setSelectedIED(null)} fitView>
              <Background color="#334155" gap={24} size={1.5} />
              <Controls className="!bg-slate-900 !border-slate-700 !text-slate-100 !fill-slate-100" />
            </ReactFlow>
          </div>

          {activeErrorLine && (
            <div className="h-60 border-t border-slate-800 bg-slate-900/90 font-mono text-xs flex flex-col z-10 shadow-2xl">
              <div className="px-6 py-2 bg-slate-900 border-b border-slate-800/80 flex justify-between items-center shrink-0">
                <span className="text-xs font-bold uppercase tracking-wider text-slate-400">SCL Schema Live Source Inspector</span>
                <span className="text-amber-400 font-bold bg-amber-950/60 border border-amber-900/50 px-2 py-0.5 rounded text-[11px]">
                  Line #{activeErrorLine}
                </span>
              </div>
              <div className="flex-1 p-4 overflow-y-auto space-y-1 bg-slate-950/40 text-slate-300">
                <div className="text-slate-600 flex"><span className="w-12 inline-block text-slate-700 text-right pr-4">{activeErrorLine - 1}</span>  &lt;!-- Substation configuration data frame row --&gt;</div>
                <div className="bg-amber-950/40 border-l-4 border-amber-500 px-2 py-1 text-amber-200 flex shadow-sm">
                  <span className="w-10 inline-block text-amber-600/70 text-right pr-4 font-bold">{activeErrorLine}</span>
                  <div className="truncate">&lt;ExtRef iedName="Verification_Discrepancy_Target" ldInst="Prot" /&gt;</div>
                </div>
                <div className="text-slate-600 flex"><span className="w-12 inline-block text-slate-700 text-right pr-4">{activeErrorLine + 1}</span>&lt;/Inputs&gt;</div>
              </div>
            </div>
          )}
        </div>

        {/* Right Sidebar: Dynamic Stream Level Parameter Inspector */}
        <div className="w-80 border-l border-slate-800 bg-slate-900/60 backdrop-blur-md p-6 flex flex-col justify-between shadow-2xl z-10 overflow-y-auto">
          <div className="space-y-6">
            <h2 className="text-xs font-bold uppercase tracking-widest text-slate-500">Device Inspector</h2>
            {selectedIED ? (
              <div className="space-y-5 animate-fadeIn">
                <div className="p-4 bg-slate-950/60 border border-slate-800 rounded-xl shadow-inner">
                  <div className="text-[10px] text-slate-500 uppercase font-mono tracking-wider">Active Device Node</div>
                  <div className="text-base font-black text-emerald-400 mt-1 font-mono break-all">{selectedIED}</div>
                </div>

                {/* Published Signals */}
                <div>
                  <h3 className="text-[11px] font-bold uppercase tracking-wider text-slate-400 mb-2 flex items-center justify-between">
                    <span>Published Signals</span>
                    <span className="bg-sky-950 text-sky-400 text-[10px] px-1.5 py-0.5 rounded border border-sky-900 font-mono">{outboundEdges.length} Out</span>
                  </h3>
                  <div className="space-y-2 max-h-52 overflow-y-auto pr-1">
                    {outboundEdges.length === 0 ? (
                      <p className="text-[11px] text-slate-600 italic px-2">No outbound streams compiled.</p>
                    ) : (
                      outboundEdges.map(edge => {
                        const isExpanded = expandedSignal === edge.id;
                        const hasMismatch = edge.network_details?.pub_rev !== edge.network_details?.sub_rev;
                        return (
                          <div 
                            key={edge.id} 
                            onClick={() => setExpandedSignal(isExpanded ? null : edge.id)}
                            className={`p-2.5 bg-slate-950/40 border rounded-xl cursor-pointer transition-all duration-150 ${
                              isExpanded ? 'border-sky-500 bg-slate-950/90 shadow-lg' : hasMismatch ? 'border-red-900/50 bg-red-950/5 hover:border-red-800' : 'border-slate-800 hover:border-slate-700'
                            }`}
                          >
                            <div className="flex justify-between items-center text-[11px] font-mono">
                              <span className="text-sky-400 font-bold">cb: {edge.label || "GOOSE_CB"}</span>
                              <span className="text-[9px] text-slate-500">{isExpanded ? "▲ Hide" : "▼ Inspect"}</span>
                            </div>
                            <div className="text-slate-500 text-[9px] font-mono mt-0.5">Dest → {edge.target}</div>
                            
                            {isExpanded && (
                              <div className="mt-3 pt-2.5 border-t border-slate-900 space-y-2 text-[10px] font-mono text-slate-300">
                                <div className="flex justify-between border-b border-slate-900/40 pb-1">
                                  <span className="text-slate-500">Live Pub Revision:</span>
                                  <span className="text-emerald-400 font-bold">{edge.network_details?.pub_rev}</span>
                                </div>
                                <div className="flex justify-between border-b border-slate-900/40 pb-1">
                                  <span className="text-slate-500">Expected Sub Revision:</span>
                                  <span className={`font-bold ${hasMismatch ? 'text-rose-400 animate-pulse font-black' : 'text-slate-300'}`}>{edge.network_details?.sub_rev}</span>
                                </div>
                                <div className="flex justify-between border-b border-slate-900/40 pb-1">
                                  <span className="text-slate-500">APPID:</span>
                                  <span className="text-sky-300 font-bold">{edge.network_details?.appid}</span>
                                </div>
                                <div className="flex justify-between border-b border-slate-900/40 pb-1">
                                  <span className="text-slate-500">VLAN ID:</span>
                                  <span className="text-emerald-400 font-bold">{edge.network_details?.vlan_id}</span>
                                </div>
                                <div className="flex justify-between border-b border-slate-900/40 pb-1">
                                  <span className="text-slate-500">Priority:</span>
                                  <span className="text-indigo-400 font-bold">{edge.network_details?.vlan_priority}</span>
                                </div>
                                <div className="flex flex-col gap-0.5 pt-0.5">
                                  <span className="text-slate-500">Multicast MAC Address:</span>
                                  <span className="text-[9px] bg-slate-950 p-1 rounded border border-slate-900 text-slate-400 text-center select-all">{edge.network_details?.mac_address}</span>
                                </div>
                              </div>
                            )}
                          </div>
                        );
                      })
                    )}
                  </div>
                </div>

                {/* Subscribed Inputs */}
                <div>
                  <h3 className="text-[11px] font-bold uppercase tracking-wider text-slate-400 mb-2 flex items-center justify-between">
                    <span>Subscribed Inputs</span>
                    <span className="bg-emerald-950 text-emerald-400 text-[10px] px-1.5 py-0.5 rounded border border-emerald-900 font-mono">{inboundEdges.length} In</span>
                  </h3>
                  <div className="space-y-2 max-h-52 overflow-y-auto pr-1">
                    {inboundEdges.length === 0 ? (
                      <p className="text-[11px] text-slate-600 italic px-2">No inbound subscriptions mapped.</p>
                    ) : (
                      inboundEdges.map(edge => {
                        const isExpanded = expandedSignal === edge.id;
                        const hasMismatch = edge.network_details?.pub_rev !== edge.network_details?.sub_rev;
                        return (
                          <div 
                            key={edge.id} 
                            onClick={() => setExpandedSignal(isExpanded ? null : edge.id)}
                            className={`p-2.5 bg-slate-950/40 border rounded-xl cursor-pointer transition-all duration-150 ${
                              isExpanded ? 'border-emerald-500 bg-slate-950/90 shadow-lg' : hasMismatch ? 'border-red-900/50 bg-red-950/5 hover:border-red-800' : 'border-slate-800 hover:border-slate-700'
                            }`}
                          >
                            <div className="flex justify-between items-center text-[11px] font-mono">
                              <span className="text-emerald-400 font-bold">cb: {edge.label || "GOOSE_CB"}</span>
                              <span className="text-[9px] text-slate-500">{isExpanded ? "▲ Hide" : "▼ Inspect"}</span>
                            </div>
                            <div className="text-slate-500 text-[9px] font-mono mt-0.5">Source ← {edge.source}</div>
                            
                            {isExpanded && (
                              <div className="mt-3 pt-2.5 border-t border-slate-900 space-y-2 text-[10px] font-mono text-slate-300">
                                <div className="flex justify-between border-b border-slate-900/40 pb-1">
                                  <span className="text-slate-500">Live Pub Revision:</span>
                                  <span className="text-emerald-400 font-bold">{edge.network_details?.pub_rev}</span>
                                </div>
                                <div className="flex justify-between border-b border-slate-900/40 pb-1">
                                  <span className="text-slate-500">Expected Sub Revision:</span>
                                  <span className={`font-bold ${hasMismatch ? 'text-rose-400 animate-pulse font-black' : 'text-slate-300'}`}>{edge.network_details?.sub_rev}</span>
                                </div>
                                <div className="flex justify-between border-b border-slate-900/40 pb-1">
                                  <span className="text-slate-500">APPID:</span>
                                  <span className="text-sky-300 font-bold">{edge.network_details?.appid}</span>
                                </div>
                                <div className="flex justify-between border-b border-slate-900/40 pb-1">
                                  <span className="text-slate-500">VLAN ID:</span>
                                  <span className="text-emerald-400 font-bold">{edge.network_details?.vlan_id}</span>
                                </div>
                                <div className="flex justify-between border-b border-slate-900/40 pb-1">
                                  <span className="text-slate-500">Priority:</span>
                                  <span className="text-indigo-400 font-bold">{edge.network_details?.vlan_priority}</span>
                                </div>
                                <div className="flex flex-col gap-0.5 pt-0.5">
                                  <span className="text-slate-500">Source MAC Target:</span>
                                  <span className="text-[9px] bg-slate-950 p-1 rounded border border-slate-900 text-slate-400 text-center select-all">{edge.network_details?.mac_address}</span>
                                </div>
                              </div>
                            )}
                          </div>
                        );
                      })
                    )}
                  </div>
                </div>

              </div>
            ) : (
              <div className="text-xs text-slate-400/60 italic p-4 bg-slate-950/40 rounded-xl border border-slate-900/60 text-center leading-relaxed">
                Select any protection relay on the canvas to isolate its active routing paths.
              </div>
            )}
          </div>
          <div className="text-[10px] text-slate-600 font-mono text-center border-t border-slate-800/50 pt-4 mt-4 shrink-0">
            VoltFlow Terminal Core v2
          </div>
        </div>

      </div>
    </div>
  );
}