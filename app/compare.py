"""Compare two versions of an SCL project ("before" / "after"), independent of the workspace."""
import json

from app.analysis import _norm_mac, _same_number
from app.report import REPORT_CSS, esc
from app.rules import RULE_REFERENCES

# Column order of ParsedSCL tuples (see app.parser.parse_scl).
GCB_FIELDS = ["ied", "ld", "cb", "cb_type", "dataset", "conf_rev", "go_id", "has_address", "mac", "appid", "vlan_id",
              "vlan_priority", "min_time", "max_time", "dataset_found", "subnetwork", "ap_name", "ld_name"]
MEMBER_FIELDS = ["ied", "ld", "dataset", "fcda_ld", "prefix", "ln_class", "ln_inst", "do_name", "da_name", "fc", "leaf_types"]
EXTREF_FIELDS = ["sub", "pub", "ld", "prefix", "ln_class", "ln_inst", "do_name", "da_name", "service_type", "src_ld", "src_cb", "p_serv_t"]

COMPARED_FIELDS = [("dataset", "Data set"), ("conf_rev", "confRev"), ("go_id", "GoID"), ("appid", "APPID"), ("mac", "MAC"),
                   ("vlan_id", "VLAN ID"), ("vlan_priority", "VLAN priority"), ("min_time", "MinTime (ms)"),
                   ("max_time", "MaxTime (ms)"), ("cb_type", "Type"), ("subnetwork", "Subnetwork")]


def _signal(ld, prefix, ln_class, ln_inst, do_name, da_name, fc=None):
    ref = f"{ld or '?'}/{prefix or ''}{ln_class or ''}{ln_inst or ''}.{do_name or ''}" + (f".{da_name}" if da_name else "")
    return ref + (f" [{fc}]" if fc else "")


def _index(parsed):
    cbs = {}
    for row in parsed.gse_controls:
        cb = dict(zip(GCB_FIELDS, row))
        cb["mac"] = _norm_mac(cb["mac"])
        cbs[(cb["ied"], cb["ld"], cb["cb"])] = cb
    members = {}
    for row in parsed.dataset_members:
        m = dict(zip(MEMBER_FIELDS, row))
        members.setdefault((m["ied"], m["ld"], m["dataset"]), []).append(
            (_signal(m["fcda_ld"] or m["ld"], m["prefix"], m["ln_class"], m["ln_inst"], m["do_name"], m["da_name"], m["fc"]), m["leaf_types"]))
    dests = {}
    for ied, ld, cb, dest in parsed.gse_destinations:
        dests.setdefault((ied, ld, cb), set()).add(dest)
    subs = {}
    for row in parsed.extrefs:
        e = dict(zip(EXTREF_FIELDS, row))
        key = (e["sub"], e["pub"], e["src_cb"] or "", e["src_ld"] or "")
        subs.setdefault(key, set()).add(_signal(e["ld"], e["prefix"], e["ln_class"], e["ln_inst"], e["do_name"], e["da_name"]))
    return {"ieds": {i[0] for i in parsed.ieds}, "cbs": cbs, "members": members, "dests": dests, "subs": subs}


def _dataset_diff(old, new):
    """old/new: [(signal, leaf_types_json)] in FCDA order."""
    old_sigs, new_sigs = [s for s, _ in old], [s for s, _ in new]
    added = [s for s in new_sigs if s not in old_sigs]
    removed = [s for s in old_sigs if s not in new_sigs]
    reordered = not added and not removed and old_sigs != new_sigs
    old_types, type_changes = dict(old), []
    for sig, types in new:
        before = old_types.get(sig)
        if before and types and before != types:
            b, a = dict(json.loads(before)), dict(json.loads(types))
            for path in sorted(set(b) | set(a)):
                if b.get(path, "absent").upper() != a.get(path, "absent").upper():
                    type_changes.append(f"{path}: {b.get(path, 'absent')} → {a.get(path, 'absent')}")
    return {"added": added, "removed": removed, "reordered": reordered, "type_changes": type_changes}


def _finding(severity, rule, message):
    return {"severity": severity, "rule": rule, "message": message, "reference": RULE_REFERENCES.get(rule)}


def compare_scl(before, after, before_name, after_name):
    old, new = _index(before), _index(after)
    control_blocks, unchanged = [], 0

    for key in sorted(set(old["cbs"]) | set(new["cbs"])):
        a, b = old["cbs"].get(key), new["cbs"].get(key)
        entry = {"ied": key[0], "ld": key[1], "cb": key[2], "fields": [], "findings": [],
                 "dataset": {"added": [], "removed": [], "reordered": False, "type_changes": []},
                 "destinations": {"added": [], "removed": []}}
        if a is None or b is None:
            entry["change"] = "added" if a is None else "removed"
            cb = b or a
            entry["fields"] = [{"field": label, "before": cb[f] if a else None, "after": cb[f] if b else None}
                               for f, label in COMPARED_FIELDS if cb[f]]
            control_blocks.append(entry)
            continue

        entry["fields"] = [{"field": label, "before": a[f], "after": b[f]} for f, label in COMPARED_FIELDS
                           if (a[f] or "") != (b[f] or "") and not (f == "conf_rev" and _same_number(a[f], b[f]))]
        old_members = old["members"].get((key[0], key[1], a["dataset"]), [])
        new_members = new["members"].get((key[0], key[1], b["dataset"]), [])
        entry["dataset"] = _dataset_diff(old_members, new_members)
        old_dests, new_dests = old["dests"].get(key, set()), new["dests"].get(key, set())
        entry["destinations"] = {"added": sorted(new_dests - old_dests), "removed": sorted(old_dests - new_dests)}

        ds = entry["dataset"]
        dataset_changed = (a["dataset"] != b["dataset"]) or ds["added"] or ds["removed"] or ds["reordered"] or ds["type_changes"]
        if dataset_changed and b["dataset"] and _same_number(a["conf_rev"], b["conf_rev"]):
            entry["findings"].append(_finding(
                "ERROR", "CONFREV_NOT_INCREMENTED",
                f"The data set changed but confRev stayed {b['conf_rev']}; subscribers configured against '{before_name}' "
                f"cannot detect the change."))
        if (a["conf_rev"] or "").isdigit() and (b["conf_rev"] or "").isdigit() and int(b["conf_rev"]) < int(a["conf_rev"]):
            entry["findings"].append(_finding(
                "WARNING", "CONFREV_DECREASED",
                f"confRev went down from {a['conf_rev']} to {b['conf_rev']}; it is expected to increase with every change."))

        if entry["fields"] or dataset_changed or entry["destinations"]["added"] or entry["destinations"]["removed"]:
            entry["change"] = "changed"
            control_blocks.append(entry)
        else:
            unchanged += 1

    subscriptions = []
    for key in sorted(set(old["subs"]) | set(new["subs"])):
        a, b = old["subs"].get(key), new["subs"].get(key)
        entry = {"subscriber": key[0], "publisher": key[1], "cb": key[2] or None, "src_ld": key[3] or None}
        if a is None or b is None:
            subscriptions.append({**entry, "change": "added" if a is None else "removed",
                                  "signals_added": sorted(b or []) if a is None else [], "signals_removed": sorted(a or []) if b is None else []})
        elif a != b:
            subscriptions.append({**entry, "change": "changed", "signals_added": sorted(b - a), "signals_removed": sorted(a - b)})

    findings = [f for cb in control_blocks for f in cb["findings"]]
    return {
        "before": before_name, "after": after_name,
        "ieds": {"added": sorted(new["ieds"] - old["ieds"]), "removed": sorted(old["ieds"] - new["ieds"]),
                 "unchanged_names": len(old["ieds"] & new["ieds"])},
        "summary": {
            "control_blocks_added": sum(1 for c in control_blocks if c["change"] == "added"),
            "control_blocks_removed": sum(1 for c in control_blocks if c["change"] == "removed"),
            "control_blocks_changed": sum(1 for c in control_blocks if c["change"] == "changed"),
            "control_blocks_unchanged": unchanged,
            "subscriptions_added": sum(1 for s in subscriptions if s["change"] == "added"),
            "subscriptions_removed": sum(1 for s in subscriptions if s["change"] == "removed"),
            "subscriptions_changed": sum(1 for s in subscriptions if s["change"] == "changed"),
            "errors": sum(1 for f in findings if f["severity"] == "ERROR"),
            "warnings": sum(1 for f in findings if f["severity"] == "WARNING"),
        },
        "control_blocks": control_blocks,
        "subscriptions": subscriptions,
    }


def render_compare_html(diff):
    s = diff["summary"]
    out = [f"<!doctype html><html lang='en'><head><meta charset='utf-8'><meta name='viewport' content='width=device-width, initial-scale=1'>"
           f"<title>VoltFlow Version Comparison</title><style>{REPORT_CSS}</style></head><body>",
           "<h1>VoltFlow Version Comparison</h1>",
           f"<div class='meta'>Before: <span class='mono'>{esc(diff['before'])}</span> · After: <span class='mono'>{esc(diff['after'])}</span></div>"]
    cards = [("Control blocks changed", s["control_blocks_changed"], "YELLOW"), ("Added", s["control_blocks_added"], "GREEN"),
             ("Removed", s["control_blocks_removed"], "RED"), ("Unchanged", s["control_blocks_unchanged"], "INFO"),
             ("Subscriptions added", s["subscriptions_added"], "GREEN"), ("Subscriptions removed", s["subscriptions_removed"], "RED"),
             ("Subscriptions changed", s["subscriptions_changed"], "YELLOW"), ("Errors", s["errors"], "ERROR")]
    out.append("<h2>Summary</h2><div class='summary'>" + "".join(
        f"<div class='card'><b class='{cls}'>{n}</b>{esc(label)}</div>" for label, n, cls in cards) + "</div>")
    if diff["ieds"]["added"] or diff["ieds"]["removed"]:
        out.append(f"<p>IEDs added: <span class='mono'>{esc(', '.join(diff['ieds']['added'])) or '—'}</span> · "
                   f"IEDs removed: <span class='mono'>{esc(', '.join(diff['ieds']['removed'])) or '—'}</span></p>")

    out.append("<h2>Control blocks</h2>")
    if not diff["control_blocks"]:
        out.append("<p class='nd'>No control block changes.</p>")
    for cb in diff["control_blocks"]:
        cls = {"added": "GREEN", "removed": "RED", "changed": "YELLOW"}[cb["change"]]
        out.append(f"<div class='link'><h3><span class='mono'>{esc(cb['ied'])}/{esc(cb['ld'])}/LLN0.{esc(cb['cb'])}</span> "
                   f"<span class='badge {cls}'>{esc(cb['change'].upper())}</span></h3>")
        for f in cb["findings"]:
            out.append(f"<p class='{esc(f['severity'])}'><b>{esc(f['severity'])} {esc(f['rule'])}</b>: {esc(f['message'])} "
                       f"<span class='nd'>({esc(f['reference']) or 'no standard clause'})</span></p>")
        if cb["fields"]:
            out.append("<table><tr><th>Field</th><th>Before</th><th>After</th></tr>" + "".join(
                f"<tr><td>{esc(f['field'])}</td><td class='mono'>{esc(f['before']) or '—'}</td><td class='mono'>{esc(f['after']) or '—'}</td></tr>"
                for f in cb["fields"]) + "</table>")
        ds = cb["dataset"]
        lines = [f"<li class='match'>+ {esc(x)}</li>" for x in ds["added"]] + [f"<li class='mismatch'>− {esc(x)}</li>" for x in ds["removed"]]
        if ds["reordered"]:
            lines.append("<li class='YELLOW'>Members reordered (payload layout changed)</li>")
        lines += [f"<li class='mismatch'>type {esc(x)}</li>" for x in ds["type_changes"]]
        if lines:
            out.append("<div>Data set members:</div><ul class='mono'>" + "".join(lines) + "</ul>")
        dests = cb["destinations"]
        if dests["added"] or dests["removed"]:
            out.append(f"<div>Subscribers listed (IEDName): + {esc(', '.join(dests['added'])) or '—'} · − {esc(', '.join(dests['removed'])) or '—'}</div>")
        out.append("</div>")

    out.append("<h2>Subscriptions</h2>")
    if not diff["subscriptions"]:
        out.append("<p class='nd'>No subscription changes.</p>")
    else:
        out.append("<table><tr><th>Change</th><th>Subscriber</th><th>Publisher / control block</th><th>Signals added</th><th>Signals removed</th></tr>")
        for sub in diff["subscriptions"]:
            cls = {"added": "GREEN", "removed": "RED", "changed": "YELLOW"}[sub["change"]]
            out.append(f"<tr><td class='{cls}'><b>{esc(sub['change'])}</b></td><td class='mono'>{esc(sub['subscriber'])}</td>"
                       f"<td class='mono'>{esc(sub['publisher'])} / {esc(sub['cb']) or '(no srcCBName)'}</td>"
                       f"<td class='mono'>{'<br>'.join(esc(x) for x in sub['signals_added']) or '—'}</td>"
                       f"<td class='mono'>{'<br>'.join(esc(x) for x in sub['signals_removed']) or '—'}</td></tr>")
        out.append("</table>")
    out.append("<p class='meta'>Produced by VoltFlow.</p></body></html>")
    return "".join(out)
