import { useState } from 'react';
import { API_BASE } from './store';

interface FieldChange { field: string; before: string | null; after: string | null }
interface Finding { severity: 'ERROR' | 'WARNING'; rule: string; message: string; reference: string | null }
interface ControlBlockChange {
  ied: string; ld: string; cb: string; change: 'added' | 'removed' | 'changed';
  fields: FieldChange[];
  dataset: { added: string[]; removed: string[]; reordered: boolean; type_changes: string[] };
  destinations: { added: string[]; removed: string[] };
  findings: Finding[];
}
interface SubscriptionChange {
  subscriber: string; publisher: string; cb: string | null; change: 'added' | 'removed' | 'changed';
  signals_added: string[]; signals_removed: string[];
}
interface CompareResult {
  before: string; after: string;
  ieds: { added: string[]; removed: string[] };
  summary: Record<string, number>;
  control_blocks: ControlBlockChange[];
  subscriptions: SubscriptionChange[];
}

const CHANGE_STYLE = {
  added: 'bg-green-950 text-green-400 border-green-900',
  removed: 'bg-rose-950 text-rose-400 border-rose-900',
  changed: 'bg-amber-950 text-amber-400 border-amber-900',
};

/** Compare two versions of a project file; independent of the workspace (nothing is stored). */
export default function CompareModal({ onClose }: { onClose: () => void }) {
  const [before, setBefore] = useState<File | null>(null);
  const [after, setAfter] = useState<File | null>(null);
  const [result, setResult] = useState<CompareResult | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [busy, setBusy] = useState(false);

  const post = async (format: 'json' | 'html') => {
    if (!before || !after) return null;
    const form = new FormData();
    form.append('before', before);
    form.append('after', after);
    const res = await fetch(`${API_BASE}/api/v1/compare?format=${format}`, { method: 'POST', body: form });
    if (!res.ok) {
      const body = await res.json().catch(() => null);
      throw new Error(body?.detail ?? res.statusText);
    }
    return res;
  };

  const runCompare = async () => {
    setBusy(true);
    setError(null);
    try {
      const res = await post('json');
      if (res) setResult(await res.json());
    } catch (err) {
      setResult(null);
      setError(err instanceof Error ? err.message : String(err));
    } finally {
      setBusy(false);
    }
  };

  const openPrintable = async () => {
    try {
      const res = await post('html');
      if (!res) return;
      const url = URL.createObjectURL(new Blob([await res.text()], { type: 'text/html' }));
      window.open(url, '_blank');
      setTimeout(() => URL.revokeObjectURL(url), 60_000);
    } catch (err) {
      setError(err instanceof Error ? err.message : String(err));
    }
  };

  const fileInput = (label: string, file: File | null, set: (f: File | null) => void) => (
    <label className="flex-1 min-w-0 cursor-pointer">
      <span className="text-[10px] text-slate-400 uppercase tracking-wider">{label}</span>
      <div className="mt-1 px-3 py-2 bg-slate-950 border border-slate-700 rounded-lg text-[11px] font-mono text-slate-300 truncate hover:border-sky-700">
        {file ? file.name : 'Choose file…'}
      </div>
      <input type="file" accept=".scd,.cid,.iid,.icd,.ssd,.sed,.xml" className="hidden"
             onChange={e => { set(e.target.files?.[0] ?? null); setResult(null); e.target.value = ''; }} />
    </label>
  );

  const s = result?.summary;

  return (
    <div className="fixed inset-0 z-50 bg-black/60 flex items-center justify-center p-6" onClick={onClose}>
      <div className="w-full max-w-3xl max-h-full overflow-hidden flex flex-col bg-slate-900 border border-slate-700 rounded-2xl shadow-2xl"
           onClick={e => e.stopPropagation()}>
        <div className="px-5 py-4 border-b border-slate-800 flex justify-between items-center">
          <div>
            <h2 className="text-sm font-bold text-sky-400">Compare project versions</h2>
            <p className="text-[11px] text-slate-500">What changed per control block and subscription. The workspace is not changed.</p>
          </div>
          <button onClick={onClose} className="text-slate-500 hover:text-slate-200 cursor-pointer text-lg px-2">✕</button>
        </div>

        <div className="p-5 space-y-4 overflow-y-auto">
          <div className="flex gap-3 items-end">
            {fileInput('Before', before, setBefore)}
            <span className="text-slate-600 pb-2">→</span>
            {fileInput('After', after, setAfter)}
            <button onClick={runCompare} disabled={!before || !after || busy}
                    className="px-3 py-2 bg-sky-900/60 text-sky-300 border border-sky-800 text-xs font-semibold rounded-lg cursor-pointer disabled:opacity-40 disabled:cursor-not-allowed">
              {busy ? 'Comparing…' : 'Compare'}
            </button>
          </div>

          {error && <div className="p-3 rounded-lg bg-rose-950/50 border border-rose-900 text-rose-300 text-xs">{error}</div>}

          {result && s && (
            <div className="space-y-4">
              <div className="flex flex-wrap gap-2 text-[11px] font-mono">
                <span className="px-2 py-1 rounded border border-amber-900 text-amber-400">{s.control_blocks_changed} changed</span>
                <span className="px-2 py-1 rounded border border-green-900 text-green-400">{s.control_blocks_added} added</span>
                <span className="px-2 py-1 rounded border border-rose-900 text-rose-400">{s.control_blocks_removed} removed</span>
                <span className="px-2 py-1 rounded border border-slate-700 text-slate-400">{s.control_blocks_unchanged} unchanged</span>
                <span className="px-2 py-1 rounded border border-slate-700 text-slate-400">
                  subscriptions +{s.subscriptions_added} −{s.subscriptions_removed} ~{s.subscriptions_changed}
                </span>
                {s.errors + s.warnings > 0 && (
                  <span className="px-2 py-1 rounded border border-rose-900 text-rose-400">{s.errors} error(s), {s.warnings} warning(s)</span>
                )}
                <button onClick={openPrintable} className="ml-auto px-2 py-1 rounded border border-slate-700 text-slate-300 hover:bg-slate-800 cursor-pointer">
                  Open printable comparison ↗
                </button>
              </div>

              {(result.ieds.added.length > 0 || result.ieds.removed.length > 0) && (
                <div className="text-[11px] font-mono text-slate-400">
                  IEDs added: {result.ieds.added.join(', ') || '—'} · removed: {result.ieds.removed.join(', ') || '—'}
                </div>
              )}

              {result.control_blocks.length === 0 && result.subscriptions.length === 0 && (
                <div className="text-center py-8 text-xs text-slate-500 italic">No GOOSE configuration changes between these versions.</div>
              )}

              {result.control_blocks.map(cb => (
                <div key={`${cb.ied}/${cb.ld}/${cb.cb}`} className="p-3 bg-slate-950/50 border border-slate-800 rounded-xl space-y-2 text-[11px]">
                  <div className="flex items-center gap-2 font-mono">
                    <span className="text-slate-200 font-bold break-all">{cb.ied}/{cb.ld}/LLN0.{cb.cb}</span>
                    <span className={`text-[10px] px-1.5 py-0.5 rounded border font-bold ${CHANGE_STYLE[cb.change]}`}>{cb.change.toUpperCase()}</span>
                  </div>
                  {cb.findings.map(f => (
                    <div key={f.rule} className={f.severity === 'ERROR' ? 'text-rose-400' : 'text-amber-400'}>
                      <b className="font-mono">{f.rule}</b>: {f.message}
                      {f.reference && <div className="text-[10px] text-slate-500">{f.reference}</div>}
                    </div>
                  ))}
                  {cb.fields.length > 0 && (
                    <div className="grid grid-cols-3 gap-x-2 gap-y-0.5 font-mono">
                      {cb.fields.map(f => (
                        <div key={f.field} className="contents">
                          <span className="text-slate-500">{f.field}</span>
                          <span className="text-slate-400 break-all">{f.before ?? '—'}</span>
                          <span className="text-slate-200 break-all">{f.after ?? '—'}</span>
                        </div>
                      ))}
                    </div>
                  )}
                  {(cb.dataset.added.length + cb.dataset.removed.length + cb.dataset.type_changes.length > 0 || cb.dataset.reordered) && (
                    <div className="font-mono space-y-0.5">
                      <div className="text-slate-500 font-sans">Data set members:</div>
                      {cb.dataset.added.map(x => <div key={`+${x}`} className="text-green-400">+ {x}</div>)}
                      {cb.dataset.removed.map(x => <div key={`-${x}`} className="text-rose-400">− {x}</div>)}
                      {cb.dataset.reordered && <div className="text-amber-400">members reordered (payload layout changed)</div>}
                      {cb.dataset.type_changes.map(x => <div key={`t${x}`} className="text-rose-400">type {x}</div>)}
                    </div>
                  )}
                  {(cb.destinations.added.length > 0 || cb.destinations.removed.length > 0) && (
                    <div className="font-mono text-slate-400">
                      Subscribers listed (IEDName): +{cb.destinations.added.join(', ') || '—'} −{cb.destinations.removed.join(', ') || '—'}
                    </div>
                  )}
                </div>
              ))}

              {result.subscriptions.length > 0 && (
                <div className="space-y-1.5">
                  <div className="text-[10px] text-slate-400 uppercase tracking-wider">Subscriptions</div>
                  {result.subscriptions.map(sub => (
                    <div key={`${sub.subscriber}/${sub.publisher}/${sub.cb}`} className="p-2 bg-slate-950/50 border border-slate-800 rounded-lg text-[11px] font-mono space-y-0.5">
                      <div className="flex items-center gap-2">
                        <span className={`text-[10px] px-1.5 py-0.5 rounded border font-bold ${CHANGE_STYLE[sub.change]}`}>{sub.change.toUpperCase()}</span>
                        <span className="text-slate-200 break-all">{sub.subscriber} ← {sub.publisher} / {sub.cb ?? '(no srcCBName)'}</span>
                      </div>
                      {sub.signals_added.map(x => <div key={`+${x}`} className="text-green-400">+ {x}</div>)}
                      {sub.signals_removed.map(x => <div key={`-${x}`} className="text-rose-400">− {x}</div>)}
                    </div>
                  ))}
                </div>
              )}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}
