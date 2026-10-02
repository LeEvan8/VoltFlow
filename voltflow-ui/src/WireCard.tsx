import type { WireInfo } from './store';

const STATE_STYLE: Record<WireInfo['state'], { label: string; cls: string }> = {
  ok: { label: 'SEEN · MATCHES CONFIGURATION', cls: 'bg-green-950 text-green-400 border-green-900' },
  mismatch: { label: 'SEEN · DIFFERS', cls: 'bg-rose-950 text-rose-400 border-rose-900' },
  'not-seen': { label: 'NOT SEEN ON THE WIRE', cls: 'bg-slate-900 text-slate-400 border-slate-700' },
  'ied-silent': { label: 'IED NOT IN CAPTURE', cls: 'bg-slate-900 text-slate-500 border-slate-800' },
};

function formatOffset(seconds: number) {
  const sign = seconds >= 0 ? '+' : '−';
  const abs = Math.abs(seconds);
  return abs >= 3600 ? `${sign}${(abs / 3600).toFixed(2)} h` : abs >= 60 ? `${sign}${(abs / 60).toFixed(1)} min` : `${sign}${abs.toFixed(3)} s`;
}

function shortTime(iso: string | null | undefined) {
  return iso ? iso.replace('T', ' ').replace('Z', ' UTC') : '—';
}

/** "On the wire" section of the link inspector: what the loaded capture shows for this control block. */
export default function WireCard({ wire }: { wire: WireInfo }) {
  const style = STATE_STYLE[wire.state];
  const t = wire.timing;
  return (
    <div className="p-4 bg-slate-950/40 border border-slate-800 rounded-xl space-y-3 font-mono text-xs">
      <div className="text-xs font-bold text-slate-400 border-b border-slate-800 pb-1.5 flex justify-between items-center gap-2">
        <span>On the wire</span>
        <span className={`text-[10px] px-1.5 py-0.5 rounded font-bold border ${style.cls}`}>{style.label}</span>
      </div>

      {wire.state === 'not-seen' && (
        <p className="text-[11px] text-slate-400 font-sans">Other GOOSE from this IED is in the capture, but not this control block. It may be disabled or not downloaded.</p>
      )}
      {wire.state === 'ied-silent' && (
        <p className="text-[11px] text-slate-500 font-sans">No GOOSE from this IED in the loaded captures (not connected to the capture point, or not publishing).</p>
      )}

      {wire.frames !== undefined && (
        <>
          <div className="text-[10px] text-slate-500 space-y-0.5">
            <div>{wire.frames} frames in {wire.capture} · from {wire.src_mac}</div>
            <div>{shortTime(wire.first_seen)} → {shortTime(wire.last_seen)}</div>
            {wire.matched_via === 'GoID' && <div className="text-amber-400">Matched by GoID: the gocbRef on the wire differs from the configuration.</div>}
            {!wire.vlan_visible && <div>VLAN tag not visible in the capture (often stripped by the network adapter driver); VLAN not checked.</div>}
          </div>

          <div className="space-y-1">
            <div className="grid grid-cols-3 gap-1 text-[10px] text-slate-500 border-b border-slate-900/60 pb-1">
              <span>Field</span><span className="text-center">On the wire</span><span className="text-right">Configured</span>
            </div>
            {(wire.fields ?? []).map(f => (
              <div key={f.field} className="grid grid-cols-3 gap-1 text-[11px] border-b border-slate-900/40 pb-1">
                <span className="text-slate-500">{f.field}</span>
                <span className={`text-center break-all ${f.ok ? 'text-slate-300' : 'text-rose-500 font-black'}`}>{f.wire ?? '—'}</span>
                <span className={`text-right break-all ${f.ok ? 'text-slate-400' : 'text-rose-500 font-black'}`}>{f.configured ?? '—'}</span>
              </div>
            ))}
          </div>

          {(wire.subscriber_checks ?? []).length > 0 && (
            <div className="space-y-1">
              <div className="text-[10px] text-slate-500">What the subscriber expects vs what is sent:</div>
              {(wire.subscriber_checks ?? []).map(c => (
                <div key={c.field} className="grid grid-cols-3 gap-1 text-[11px]">
                  <span className="text-slate-500">{c.field}</span>
                  <span className="text-center text-slate-300 break-all">{c.wire ?? '—'}</span>
                  <span className={`text-right break-all ${c.ok ? 'text-green-500' : 'text-rose-500 font-black'}`}>{c.expected} {c.ok ? '✓' : '✗'}</span>
                </div>
              ))}
            </div>
          )}

          {(wire.type_problems ?? []).length > 0 && (
            <div className="text-[11px] text-rose-400 space-y-0.5">{wire.type_problems!.map(p => <div key={p}>{p}</div>)}</div>
          )}

          {t && (
            <div className="text-[11px] space-y-0.5 border-t border-slate-900 pt-2">
              <div className="flex justify-between"><span className="text-slate-500">Longest steady interval</span>
                <span className={t.max_time_ms && t.max_steady_gap_ms && t.max_steady_gap_ms > Number(t.max_time_ms) * 1.1 ? 'text-amber-400' : 'text-slate-300'}>
                  {t.max_steady_gap_ms ?? '—'} ms (MaxTime {t.max_time_ms ?? '—'} ms)</span></div>
              <div className="flex justify-between"><span className="text-slate-500">First repetition after event</span>
                <span className="text-slate-300">{t.first_retransmission_ms.length ? `${t.first_retransmission_ms.join(', ')} ms` : '—'} (MinTime {t.min_time_ms ?? '—'} ms)</span></div>
              <div className="flex justify-between"><span className="text-slate-500">timeAllowedToLive</span><span className="text-slate-300">{t.tals_ms.join(', ') || '—'} ms</span></div>
              <div className="flex justify-between"><span className="text-slate-500">State changes (stNum)</span><span className="text-slate-300">{t.events}</span></div>
              {t.clock_offset_s !== null && (
                <div className="flex justify-between"><span className="text-slate-500">IED clock vs capture clock</span>
                  <span className={Math.abs(t.clock_offset_s) > 1 ? 'text-amber-400' : 'text-slate-300'}>{formatOffset(t.clock_offset_s)}</span></div>
              )}
              <div className="flex justify-between"><span className="text-slate-500">Interruptions / frames lost</span>
                <span className={t.interruptions || t.frames_lost ? 'text-amber-400' : 'text-slate-300'}>{t.interruptions} / {t.frames_lost}</span></div>
              {wire.simulation && <div className="text-amber-400">Simulation/test flag set</div>}
            </div>
          )}

          {(wire.values ?? []).length > 0 && (
            <div className="border-t border-slate-900 pt-2 space-y-0.5">
              <div className="text-[10px] text-slate-500">Last values ({shortTime(wire.value_time)}):</div>
              {wire.values!.map(([signal, value]) => (
                <div key={signal} className="flex justify-between gap-2 text-[11px]">
                  <span className="text-slate-400 break-all">{signal}</span><span className="text-sky-300 shrink-0">{value}</span>
                </div>
              ))}
            </div>
          )}
        </>
      )}
    </div>
  );
}
