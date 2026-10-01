"""Compare captured GOOSE traffic (app.goose summaries) with the loaded SCL configuration.

Findings here are evidence from the network, kept apart from the configuration findings: they are
listed with their own WIRE_* flags and shown as a badge on each link, but do not recolour links.
"""
import json
from datetime import datetime, timezone

from app.analysis import _norm_mac as norm_mac, _same_hex as same_hex, _same_number as same_number

# SCL bType -> the allData kind it is encoded as (IEC 61850-8-1 Annex A, Table A.2).
BTYPE_KIND = {
    "BOOLEAN": "boolean", "INT8": "integer", "INT16": "integer", "INT24": "integer", "INT32": "integer", "INT64": "integer",
    "INT128": "integer", "Enum": "integer", "INT8U": "unsigned", "INT16U": "unsigned", "INT24U": "unsigned",
    "INT32U": "unsigned", "FLOAT32": "float", "FLOAT64": "float", "Quality": "bit-string", "Dbpos": "bit-string",
    "Tcmd": "bit-string", "Check": "bit-string", "Timestamp": "utc-time", "EntryTime": "binary-time",
    "Octet64": "octet-string", "VisString32": "visible-string", "VisString64": "visible-string",
    "VisString65": "visible-string", "VisString129": "visible-string", "VisString255": "visible-string",
    "Unicode255": "mms-string",
}
DBPOS = {"00": "intermediate", "01": "off", "10": "on", "11": "bad-state"}
QUALITY_VALIDITY = {"00": "good", "01": "invalid", "10": "reserved", "11": "questionable"}
MAXTIME_TOLERANCE = 1.10  # 10 % allowance for laptop capture timestamp jitter


def ld_name(cb):
    return cb["ld_name"] or f"{cb['ied_name']}{cb['ld_inst']}"


def expected_gocb_ref(cb):
    return f"{ld_name(cb)}/LLN0$GO${cb['cb_name']}"


def expected_dataset_ref(cb):
    return f"{ld_name(cb)}/LLN0${cb['dataset']}"


def iso(ts):
    return datetime.fromtimestamp(ts, tz=timezone.utc).isoformat(timespec="milliseconds").replace("+00:00", "Z") if ts else None


def _flatten(items):
    out = []
    for kind, value in items:
        out += _flatten(value) if kind in ("structure", "array") else [(kind, value)]
    return out


def _flat_kinds(signature):
    out = []
    for item in signature:
        out += _flat_kinds(item) if isinstance(item, list) else [item]
    return out


def _fmt(kind, value, btype=None):
    if kind == "boolean":
        return "TRUE" if value else "FALSE"
    if kind == "bit-string" and btype == "Dbpos" and value in DBPOS:
        return f"{DBPOS[value]} ({value})"
    if kind == "bit-string" and btype == "Quality" and len(value) >= 2:
        flags = "1" in value[2:]
        return QUALITY_VALIDITY[value[:2]] + (f" (detail bits {value[2:]})" if flags else "")
    return str(value)


def named_values(values, member_rows):
    """[(signal label, formatted value)] for the latest allData, using the data set FCDAs for names and types."""
    out = []
    for i, (kind, value) in enumerate(values or []):
        m = member_rows[i] if i < len(member_rows) else None
        label = (f"{m['fcda_ld'] or m['ld_inst']}/{m['prefix'] or ''}{m['ln_class']}{m['ln_inst'] or ''}.{m['do_name']}"
                 + (f".{m['da_name']}" if m["da_name"] else "")) if m else f"entry {i + 1}"
        leaves = json.loads(m["leaf_types"]) if m and m["leaf_types"] else None
        if kind in ("structure", "array"):
            flat = _flatten(value)
            if leaves and len(leaves) == len(flat):
                out += [(path, _fmt(k, v, b)) for (path, b), (k, v) in zip(leaves, flat)]
            else:
                out += [(f"{label}[{j}]", _fmt(k, v)) for j, (k, v) in enumerate(flat)]
        else:
            out.append((label, _fmt(kind, value, leaves[0][1] if leaves and len(leaves) == 1 else None)))
    return out


def _joined(values):
    vals = [v for v in values if v is not None]
    return ", ".join(str(v) for v in vals) if vals else None


def wire_analysis(conn, ctx, report):
    """ctx: auth_cbs, active_keys, members, subs_by_cb, edge_of_sub, edges, edges_by_cb, ied_info, auth_file, cb_label."""
    captures = [dict(r) for r in conn.execute("SELECT name, seq, summary_json FROM captures ORDER BY seq")]
    if not captures:
        return []
    auth_cbs, cb_label = ctx["auth_cbs"], ctx["cb_label"]

    by_ref = {expected_gocb_ref(cb): key for key, cb in auth_cbs.items()}
    by_goid = {}
    for key, cb in auth_cbs.items():
        if cb["go_id"]:
            by_goid.setdefault(cb["go_id"], []).append(key)

    matched, unknown, summaries = {}, [], []
    for cap in captures:
        summary = json.loads(cap["summary_json"])
        totals = summary["totals"]
        duration = (totals["end"] - totals["start"]) if totals["start"] is not None and totals["end"] is not None else None
        summaries.append({"name": cap["name"], "order": cap["seq"], "frames": totals["frames"], "goose_frames": totals["goose_frames"],
                          "decode_errors": totals["decode_errors"], "streams": len(summary["streams"]),
                          "start": iso(totals["start"]), "end": iso(totals["end"]),
                          "duration_s": round(duration, 1) if duration is not None else None})
        for s in summary["streams"]:
            s["capture"], s["capture_seq"], s["duration_s"] = cap["name"], cap["seq"], duration
            key, via = by_ref.get(s["gocb_ref"]), "gocbRef"
            if key is None and len(s["go_ids"]) == 1 and len(by_goid.get(s["go_ids"][0], [])) == 1:
                key, via = by_goid[s["go_ids"][0]][0], "GoID"
            if key is None:
                unknown.append(s)
            else:
                s["matched_via"] = via
                matched.setdefault(key, []).append(s)

    seen_ieds = {key[0] for key in matched}
    capture_names = ", ".join(c["name"] for c in captures)

    for key, streams in sorted(matched.items()):
        cb = auth_cbs[key]
        latest_seq = max(s["capture_seq"] for s in streams)
        current = sorted((s for s in streams if s["capture_seq"] == latest_seq), key=lambda s: -s["frames"])
        s = current[0]
        if len(current) > 1:
            report(key[0], "WARNING", "WIRE_DUPLICATE_STREAM",
                   f"{cb_label(key)} is published by {len(current)} sources in '{s['capture']}' "
                   f"({', '.join(x['src_mac'] for x in current)}); a gocbRef should identify one control block.", key, mark_edge=False)

        member_rows = ctx["members"][(key[0], key[1], cb["dataset"])] if cb["dataset"] else []
        vlan_visible = any(v is not None for v in s["vlan_ids"])
        fields = [("gocbRef", s["gocb_ref"], expected_gocb_ref(cb), s["gocb_ref"] == expected_gocb_ref(cb))]
        if cb["has_address"]:
            fields += [("MAC", s["dst_mac"], norm_mac(cb["mac_address"]), s["dst_mac"] == norm_mac(cb["mac_address"])),
                       ("APPID", s["appid"], cb["appid"], same_hex(s["appid"], cb["appid"]))]
        fields += [("GoID", _joined(s["go_ids"]), cb["go_id"], s["go_ids"] == [cb["go_id"]]),
                   ("Data set", _joined(s["dat_sets"]), expected_dataset_ref(cb) if cb["dataset"] else None,
                    s["dat_sets"] == [expected_dataset_ref(cb)] if cb["dataset"] else False),
                   ("confRev", _joined(s["conf_revs"]), cb["conf_rev"],
                    len(s["conf_revs"]) == 1 and same_number(str(s["conf_revs"][0]), cb["conf_rev"]))]
        if cb["dataset_found"]:
            fields.append(("Entries", _joined(s["num_entries"]), str(len(member_rows)), s["num_entries"] == [len(member_rows)]))
        if vlan_visible and cb["has_address"]:
            fields += [("VLAN ID", _joined(f"{v:03X}" for v in s["vlan_ids"] if v is not None), cb["vlan_id"] or "000",
                        all(v is not None and same_hex(f"{v:X}", cb["vlan_id"] or "0") for v in s["vlan_ids"])),
                       ("VLAN priority", _joined(s["vlan_priorities"]), cb["vlan_priority"],
                        all(str(p) == (cb["vlan_priority"] or "") for p in s["vlan_priorities"] if p is not None))]
        mismatched = [f for f in fields if not f[3]]
        if mismatched:
            report(key[0], "ERROR", "WIRE_CONFIG_MISMATCH",
                   f"{cb_label(key)} as captured in '{s['capture']}' differs from '{ctx['auth_file'][key[0]]}': "
                   + "; ".join(f"{name} on wire {wire or '—'} vs configured {scl or '—'}" for name, wire, scl, _ in mismatched)
                   + ". The device is probably not running this configuration (not downloaded, or a different version).", key, mark_edge=False)

        type_problems = []
        if member_rows and s["signatures"]:
            signature = s["signatures"][0]
            for i, m in enumerate(member_rows):
                if i >= len(signature) or not m["leaf_types"]:
                    continue
                expected = [BTYPE_KIND.get(b) for _, b in json.loads(m["leaf_types"])]
                actual = _flat_kinds(signature[i]) if isinstance(signature[i], list) else [signature[i]]
                if len(expected) != len(actual) or any(e and e != a for e, a in zip(expected, actual)):
                    type_problems.append(f"entry {i + 1} ({m['do_name']}{'.' + m['da_name'] if m['da_name'] else ''}): "
                                         f"configured {'/'.join(e or '?' for e in expected)}, on wire {'/'.join(actual)}")
            if len(s["signatures"]) > 1:
                type_problems.append(f"the payload structure changed during the capture ({len(s['signatures'])} variants)")
        if type_problems:
            report(key[0], "ERROR", "WIRE_TYPE_MISMATCH",
                   f"Payload of {cb_label(key)} does not match the data set types: {'; '.join(type_problems[:4])}"
                   f"{' …' if len(type_problems) > 4 else ''}.", key, mark_edge=False)

        timing = {"max_steady_gap_ms": s["max_steady_gap_ms"], "max_gap_ms": s["max_gap_ms"],
                  "max_time_ms": cb["max_time"], "min_time_ms": cb["min_time"], "tals_ms": s["tals_ms"],
                  "first_retransmission_ms": s["first_retransmission_ms"][:5], "interruptions": len(s["tal_violations"]),
                  "frames_lost": s["sq_gaps"], "st_resets": s["st_resets"], "events": len(s["events"])}
        if s["tal_violations"]:
            worst = max(s["tal_violations"], key=lambda v: v["gap_ms"] - v["tal_ms"])
            report(key[0], "WARNING", "WIRE_STREAM_INTERRUPTED",
                   f"{cb_label(key)} went silent {len(s['tal_violations'])} time(s) for longer than its timeAllowedToLive "
                   f"(worst {worst['gap_ms']} ms after a message with TAL {worst['tal_ms']} ms, at {iso(worst['ts'])}). "
                   f"Subscribers declare the stream lost in such gaps.", key, mark_edge=False)
        try:
            max_time = float(cb["max_time"]) if cb["max_time"] else None
        except ValueError:
            max_time = None
        if max_time and s["max_steady_gap_ms"] and s["max_steady_gap_ms"] > max_time * MAXTIME_TOLERANCE:
            report(key[0], "WARNING", "WIRE_MAXTIME_EXCEEDED",
                   f"{cb_label(key)} was retransmitted at intervals up to {s['max_steady_gap_ms']} ms, above its configured "
                   f"MaxTime of {cb['max_time']} ms.", key, mark_edge=False)
        if s["sq_gaps"]:
            report(key[0], "WARNING", "WIRE_FRAMES_LOST",
                   f"{s['sq_gaps']} frame(s) of {cb_label(key)} are missing from the capture (gaps in sqNum). They were lost "
                   f"on the network or by the capture point.", key, mark_edge=False)
        if s["st_resets"]:
            report(key[0], "WARNING", "WIRE_STNUM_RESET",
                   f"stNum of {cb_label(key)} went backwards {s['st_resets']} time(s): the publisher restarted during the capture, "
                   f"or more than one device publishes this control block.", key, mark_edge=False)
        if s["simulation"]:
            report(key[0], "WARNING", "WIRE_SIMULATION",
                   f"{cb_label(key)} is sent with the simulation/test flag set. Subscribers that are not in simulation mode "
                   f"(LPHD.Sim = false) ignore these messages.", key, mark_edge=False)
        if s["nds_com"]:
            report(key[0], "WARNING", "WIRE_NEEDS_COMMISSIONING",
                   f"{cb_label(key)} is sent with ndsCom = TRUE: the control block needs commissioning (e.g. its data set is "
                   f"not fully configured).", key, mark_edge=False)

        base_state = "mismatch" if mismatched or type_problems else "ok"
        wire_base = {"capture": s["capture"], "matched_via": s["matched_via"], "frames": s["frames"],
                     "first_seen": iso(s["first_ts"]), "last_seen": iso(s["last_ts"]), "src_mac": s["src_mac"],
                     "vlan_visible": vlan_visible, "simulation": s["simulation"],
                     "fields": [{"field": n, "wire": w, "configured": c, "ok": ok} for n, w, c, ok in fields],
                     "type_problems": type_problems, "timing": timing,
                     "values": named_values(s["last_values"], member_rows), "value_time": iso(s["last_ts"])}

        # What each subscriber would make of these frames.
        sub_checks = {}
        for record in ctx["subs_by_cb"].get(key, []):
            exp, rows = record["expected"], []
            if "conf_rev" in exp:
                rows.append(("confRev", _joined(s["conf_revs"]), exp["conf_rev"], len(s["conf_revs"]) == 1 and same_number(str(s["conf_revs"][0]), exp["conf_rev"])))
            if "appid" in exp:
                rows.append(("APPID", s["appid"], exp["appid"], same_hex(s["appid"], exp["appid"])))
            if "mac" in exp:
                rows.append(("MAC", s["dst_mac"], exp["mac"], s["dst_mac"] == exp["mac"]))
            if "go_id" in exp:
                rows.append(("GoID", _joined(s["go_ids"]), exp["go_id"], s["go_ids"] == [exp["go_id"]]))
            if "dataset" in exp:
                names = [d.rsplit("$", 1)[-1] for d in s["dat_sets"]]
                rows.append(("Data set", _joined(names), exp["dataset"], names == [exp["dataset"]]))
            if vlan_visible and "vlan_id" in exp:
                rows.append(("VLAN ID", _joined(f"{v:03X}" for v in s["vlan_ids"] if v is not None), exp["vlan_id"],
                             all(v is not None and same_hex(f"{v:X}", exp["vlan_id"]) for v in s["vlan_ids"])))
            bad = [r for r in rows if not r[3]]
            edge_id = ctx["edge_of_sub"].get((record["sub"], key))
            if bad:
                report(record["sub"], "ERROR", "WIRE_SUBSCRIBER_MISMATCH",
                       f"'{record['sub']}' will not accept {cb_label(key)} as it is actually sent: "
                       + "; ".join(f"{n} on wire {w or '—'}, expected {e}" for n, w, e, _ in bad) + ".",
                       edge_id=edge_id, mark_edge=False)
            sub_checks[edge_id] = rows

        for edge_id in ctx["edges_by_cb"].get(key, []):
            edge = ctx["edges"][edge_id - 1]
            rows = sub_checks.get(edge_id, [])
            state = "mismatch" if base_state == "mismatch" or any(not r[3] for r in rows) else "ok"
            edge["network_details"]["wire"] = {**wire_base, "state": state,
                                               "subscriber_checks": [{"field": n, "wire": w, "expected": e, "ok": ok} for n, w, e, ok in rows]}

    # Configured but not observed.
    silent = {}
    for key in ctx["active_keys"]:
        if key in matched:
            continue
        for edge_id in ctx["edges_by_cb"].get(key, []):
            ctx["edges"][edge_id - 1]["network_details"]["wire"] = {"state": "not-seen" if key[0] in seen_ieds else "ied-silent"}
        if key[0] in seen_ieds:
            report(key[0], "WARNING", "WIRE_NOT_SEEN",
                   f"{cb_label(key)} is configured but was not observed in the captures ({capture_names}), although other GOOSE "
                   f"from {key[0]} was. It may be disabled in the device or not downloaded.", key, mark_edge=False)
        else:
            silent.setdefault(key[0], []).append(key[2])
    for ied, cbs in sorted(silent.items()):
        report(ied, "INFO", "WIRE_IED_SILENT",
               f"No GOOSE from {ied} ({', '.join(cbs)}) appears in the captures ({capture_names}): the IED was not connected "
               f"to the capture point, not publishing, or the capture was too short.", mark_edge=False)

    for s in unknown:
        owner = next((ied for ied in sorted(ctx["ied_info"], key=len, reverse=True) if s["gocb_ref"].startswith(ied)), None)
        report(owner or "(unknown)", "WARNING", "WIRE_UNKNOWN_STREAM",
               f"Captured GOOSE stream '{s['gocb_ref']}' (GoID {_joined(s['go_ids'])}, APPID {s['appid']}, MAC {s['dst_mac']}, "
               f"from {s['src_mac']}, {s['frames']} frames in '{s['capture']}') matches no control block in the loaded files.",
               target_ied=owner, mark_edge=False)

    return summaries
