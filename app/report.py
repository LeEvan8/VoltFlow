"""Validation report export: one report structure, rendered as printable HTML or as CSV."""
import csv
import html
import io
from datetime import datetime

from app.analysis import analyze, EXPECTED_PARAMS, REQUIRED_FOR_VALID

PARAM_LABELS = {"conf_rev": "confRev", "appid": "APPID", "mac": "MAC", "go_id": "GoID", "dataset": "Data set",
                "vlan_id": "VLAN ID", "vlan_priority": "VLAN priority"}
# parameter -> (published value key, expected value key, mismatch flags) in an edge's network_details
PARAM_FIELDS = {
    "conf_rev": ("pub_rev", "sub_rev", ("rev_mismatch",)),
    "appid": ("appid", "sub_appid", ("appid_mismatch",)),
    "mac": ("mac_address", "sub_mac", ("mac_mismatch",)),
    "go_id": ("go_id", "sub_goid", ("goid_mismatch",)),
    "dataset": ("dataset", "sub_dataset", ("dataset_mismatch", "type_mismatch")),
    "vlan_id": ("vlan_id", "sub_vlan", ("vlan_mismatch",)),
    "vlan_priority": ("vlan_priority", "sub_pri", ("vlan_mismatch",)),
}


def build_report(conn):
    result = analyze(conn)
    ieds_by_file = {}
    for row in conn.execute("SELECT source_file, name FROM ieds ORDER BY name"):
        ieds_by_file.setdefault(row["source_file"], []).append(row["name"])
    files = [{"order": f["seq"], "name": f["name"], "ieds": ieds_by_file.get(f["name"], [])}
             for f in conn.execute("SELECT name, seq FROM files ORDER BY seq")]

    findings_by_edge = {}
    for f in result["errors"]:
        if f["xpath"]:
            findings_by_edge.setdefault(f["xpath"], []).append(f["id"])

    links, orphans, unresolved = [], [], []
    for e in result["edges"]:
        d = e["network_details"]
        base = {"edge": f"e-{e['id']}", "publisher": e["publisher"], "subscriber": e["subscriber"], "ld_inst": d["ld_inst"],
                "cb_name": d["cb_name"] or e["app_id"], "status": e["status"], "colour": e["color_state"],
                "findings": findings_by_edge.get(f"e-{e['id']}", [])}
        if e["is_orphan_stub"]:
            orphans.append({**base, "subscriber": None, "appid": d["appid"], "mac": d["mac_address"], "conf_rev": d["pub_rev"]})
        elif e["is_unresolved_stub"]:
            unresolved.append({**base, "publisher": e["unresolved_publisher"]})
        else:
            params = []
            for p in EXPECTED_PARAMS:
                pub_key, sub_key, flags = PARAM_FIELDS[p]
                expected = d[sub_key]
                outcome = "not declared" if expected is None else "mismatch" if any(d["flags"][f] for f in flags) else "match"
                params.append({"param": p, "label": PARAM_LABELS[p], "published": d[pub_key], "expected": expected,
                               "source": d["expected_sources"].get(p), "result": outcome, "required": p in REQUIRED_FOR_VALID})
            links.append({**base, "match_method": d["match_method"], "fully_verified": d["fully_verified"], "params": params})

    severities = [f["severity"] for f in result["errors"]]
    summary = {
        "files": len(files), "ieds": len(result["nodes"]), "links": len(links),
        "links_valid": sum(1 for l in links if l["status"] == "VALID"),
        "links_unverified": sum(1 for l in links if l["status"] == "UNVERIFIED"),
        "links_green_with_notes": sum(1 for l in links if l["colour"] == "GREEN" and l["status"] not in ("VALID", "UNVERIFIED")),
        "links_yellow": sum(1 for l in links if l["colour"] == "YELLOW"),
        "links_red": sum(1 for l in links if l["colour"] == "RED"),
        "orphaned_streams": len(orphans), "unresolved_sources": len(unresolved),
        "errors": severities.count("ERROR"), "warnings": severities.count("WARNING"), "infos": severities.count("INFO"),
    }
    return {"generated": datetime.now().astimezone().isoformat(timespec="seconds"), "files": files, "summary": summary,
            "ieds": result["nodes"], "links": links, "orphans": orphans, "unresolved": unresolved, "findings": result["errors"]}


# ---------------------------------------------------------------------------
# CSV
# ---------------------------------------------------------------------------

def _csv(header, rows):
    out = io.StringIO()
    writer = csv.writer(out, lineterminator="\r\n")
    writer.writerow(header)
    writer.writerows(rows)
    return "﻿" + out.getvalue()  # BOM so Excel opens UTF-8 (→, …) correctly


def links_csv(report):
    header = ["type", "publisher", "subscriber", "ld_inst", "control_block", "status", "colour", "match_method", "fully_verified"]
    for p in EXPECTED_PARAMS:
        header += [f"{p}_published", f"{p}_expected", f"{p}_source", f"{p}_result"]
    header.append("finding_ids")
    rows = []
    for l in report["links"]:
        row = ["link", l["publisher"], l["subscriber"], l["ld_inst"], l["cb_name"], l["status"], l["colour"],
               l["match_method"], "yes" if l["fully_verified"] else "no"]
        for p in l["params"]:
            row += [p["published"] or "", p["expected"] or "", p["source"] or "", p["result"]]
        rows.append(row + [" ".join(map(str, l["findings"]))])
    blank = [""] * (4 * len(EXPECTED_PARAMS))
    for o in report["orphans"]:
        rows.append(["orphaned_stream", o["publisher"], "", o["ld_inst"], o["cb_name"], o["status"], o["colour"], "", "", *blank,
                     " ".join(map(str, o["findings"]))])
    for u in report["unresolved"]:
        rows.append(["unresolved_source", u["publisher"], u["subscriber"], "", u["cb_name"], u["status"], u["colour"], "", "", *blank,
                     " ".join(map(str, u["findings"]))])
    return _csv(header, rows)


def findings_csv(report):
    rows = [[f["id"], f["severity"], f["rule_type"], f["ied_name"], f["xpath"], f["message"], f["reference"] or ""]
            for f in report["findings"]]
    return _csv(["id", "severity", "rule", "ied", "link", "message", "standard_reference"], rows)


# ---------------------------------------------------------------------------
# HTML (self-contained, light, printable to PDF from the browser)
# ---------------------------------------------------------------------------

def refs(ids):
    return ", ".join(f"#{i}" for i in ids) or "—"


def esc(value):
    return html.escape("" if value is None else str(value))


REPORT_CSS = """
:root { --ink:#0f172a; --muted:#475569; --line:#cbd5e1; --soft:#f1f5f9; --green:#15803d; --yellow:#a16207; --red:#b91c1c; --amber:#c2410c; --blue:#0369a1; }
* { box-sizing: border-box; }
body { margin: 0; padding: 32px 40px; font: 13px/1.45 system-ui, -apple-system, "Segoe UI", Roboto, sans-serif; color: var(--ink); background: #fff; }
h1 { font-size: 22px; margin: 0 0 4px; } h2 { font-size: 16px; margin: 28px 0 8px; padding-bottom: 4px; border-bottom: 2px solid var(--ink); }
.meta { color: var(--muted); margin-bottom: 16px; }
table { width: 100%; border-collapse: collapse; margin: 6px 0 12px; font-size: 12px; }
th, td { border: 1px solid var(--line); padding: 4px 6px; text-align: left; vertical-align: top; }
th { background: var(--soft); font-weight: 600; }
td.mono, span.mono { font-family: ui-monospace, Consolas, monospace; font-size: 11.5px; word-break: break-all; }
.badge { display: inline-block; padding: 1px 6px; border-radius: 4px; font-size: 11px; font-weight: 700; border: 1px solid currentColor; white-space: nowrap; }
.GREEN { color: var(--green); } .YELLOW { color: var(--yellow); } .RED { color: var(--red); } .AMBER { color: var(--amber); }
.ERROR { color: var(--red); } .WARNING { color: var(--yellow); } .INFO { color: var(--blue); } .UNVERIFIED { color: var(--blue); }
.match { color: var(--green); } .mismatch { color: var(--red); font-weight: 700; } .nd { color: var(--muted); font-style: italic; }
.summary { display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 8px; }
.card { border: 1px solid var(--line); border-radius: 6px; padding: 8px 10px; } .card b { display: block; font-size: 18px; }
.note { background: var(--soft); border-left: 3px solid var(--blue); padding: 8px 12px; color: var(--muted); }
.link { break-inside: avoid; border: 1px solid var(--line); border-radius: 6px; padding: 8px 10px; margin: 8px 0; }
.link h3 { margin: 0 0 4px; font-size: 13px; }
@media print { body { padding: 0; } h2 { break-after: avoid; } .link, tr { break-inside: avoid; } }
@media (max-width: 700px) { body { padding: 16px; } }
"""


def render_html(report):
    s = report["summary"]
    out = [f"<!doctype html><html lang='en'><head><meta charset='utf-8'><meta name='viewport' content='width=device-width, initial-scale=1'>"
           f"<title>VoltFlow Validation Report</title><style>{REPORT_CSS}</style></head><body>",
           "<h1>VoltFlow GOOSE Validation Report</h1>",
           f"<div class='meta'>Generated {esc(report['generated'])} · {s['files']} file(s) · {s['ieds']} IED(s) · {s['links']} GOOSE link(s)</div>"]

    cards = [("VALID links", s["links_valid"], "GREEN"), ("UNVERIFIED links", s["links_unverified"], "UNVERIFIED"),
             ("Green links with notes", s["links_green_with_notes"], "GREEN"),
             ("Yellow links", s["links_yellow"], "YELLOW"), ("Red links", s["links_red"], "RED"),
             ("Errors", s["errors"], "ERROR"), ("Warnings", s["warnings"], "WARNING"),
             ("Orphaned streams", s["orphaned_streams"], "AMBER"), ("Unresolved sources", s["unresolved_sources"], "YELLOW")]
    out.append("<h2>Summary</h2><div class='summary'>" + "".join(
        f"<div class='card'><b class='{cls}'>{n}</b>{esc(label)}</div>" for label, n, cls in cards) + "</div>")
    out.append("<p class='note'>A link is <b>VALID</b> only when the subscriber declares, and VoltFlow compared, every required "
               f"parameter ({esc(', '.join(PARAM_LABELS[p] for p in REQUIRED_FOR_VALID))}) and found no problem. "
               "<b>UNVERIFIED</b> means nothing wrong was found but at least one required parameter is not declared by the subscriber "
               "(standard ExtRefs carry none of them; expectations come from vendor records or the subscriber's own copy of the "
               "publisher). <b>Green links with notes</b> stay green but carry a non-blocking finding such as "
               "SRC_LDINST_DEFAULT_MISMATCH; their parameter table shows what was verified. "
               "VLAN ID/priority are compared when declared but not required (IEC 61850-8-1 C.2.2).</p>")

    out.append("<h2>Workspace files</h2><table><tr><th>#</th><th>File</th><th>IEDs</th></tr>" + "".join(
        f"<tr><td>{f['order']}</td><td class='mono'>{esc(f['name'])}</td><td class='mono'>{esc(', '.join(f['ieds']))}</td></tr>"
        for f in report["files"]) + "</table>")

    out.append("<h2>IEDs</h2><table><tr><th>IED</th><th>Manufacturer</th><th>Authoritative file</th><th>Other copies</th>"
               "<th>Unused control blocks</th></tr>")
    for n in report["ieds"]:
        others = [c for c in n["copies"] if c != n["source_file"]]
        how = "chosen by user" if n["source_pinned"] else "latest upload"
        unused = ", ".join(f"{u['ld_inst']}/{u['cb_name']}" for u in n["unused_cbs"])
        out.append(f"<tr><td class='mono'>{esc(n['name'])}</td><td>{esc(n['manufacturer'])}</td>"
                   f"<td class='mono'>{esc(n['source_file'])} <span class='nd'>({how})</span></td>"
                   f"<td class='mono'>{esc(', '.join(others)) or '—'}</td><td class='mono'>{esc(unused) or '—'}</td></tr>")
    out.append("</table>")

    out.append("<h2>GOOSE links</h2>")
    if not report["links"]:
        out.append("<p class='nd'>No resolved GOOSE subscriptions.</p>")
    for l in report["links"]:
        status_cls = "UNVERIFIED" if l["status"] == "UNVERIFIED" else l["colour"]
        method = "srcCBName reference" if l["match_method"] == "standard" else "data set content"
        out.append(f"<div class='link'><h3><span class='mono'>{esc(l['publisher'])} → {esc(l['subscriber'])}</span> · "
                   f"<span class='mono'>{esc(l['ld_inst'])}/LLN0.{esc(l['cb_name'])}</span> "
                   f"<span class='badge {status_cls}'>{esc(l['status'])}</span></h3>"
                   f"<div class='meta'>Matched by {method}" +
                   (f" · findings {refs(l['findings'])}" if l["findings"] else "") + "</div>"
                   "<table><tr><th>Parameter</th><th>Publisher</th><th>Subscriber expects</th><th>Source</th><th>Result</th></tr>")
        for p in l["params"]:
            result_cls = {"match": "match", "mismatch": "mismatch", "not declared": "nd"}[p["result"]]
            label = esc(p["label"]) + ("" if p["required"] else " <span class='nd'>(optional)</span>")
            out.append(f"<tr><td>{label}</td><td class='mono'>{esc(p['published']) or '—'}</td>"
                       f"<td class='mono'>{esc(p['expected']) if p['expected'] is not None else '<span class=nd>not declared</span>'}</td>"
                       f"<td>{esc(p['source']) or '—'}</td><td class='{result_cls}'>{esc(p['result'])}</td></tr>")
        out.append("</table></div>")

    if report["orphans"] or report["unresolved"]:
        out.append("<h2>Streams without a counterpart</h2><table><tr><th>Type</th><th>Publisher</th><th>Subscriber</th>"
                   "<th>Control block</th><th>Findings</th></tr>")
        for o in report["orphans"]:
            out.append(f"<tr><td class='AMBER'>Orphaned stream (0 listeners)</td><td class='mono'>{esc(o['publisher'])}</td><td>—</td>"
                       f"<td class='mono'>{esc(o['ld_inst'])}/LLN0.{esc(o['cb_name'])}</td><td>{refs(o['findings'])}</td></tr>")
        for u in report["unresolved"]:
            out.append(f"<tr><td class='YELLOW'>Unresolved source (missing)</td><td class='mono'>{esc(u['publisher'])}</td>"
                       f"<td class='mono'>{esc(u['subscriber'])}</td><td class='mono'>{esc(u['cb_name'])}</td>"
                       f"<td>{refs(u['findings'])}</td></tr>")
        out.append("</table>")

    out.append("<h2>Findings</h2>")
    if not report["findings"]:
        out.append("<p class='nd'>No findings.</p>")
    else:
        out.append("<table><tr><th>#</th><th>Severity</th><th>Rule</th><th>IED</th><th>Finding</th><th>Standard reference</th></tr>")
        for f in report["findings"]:
            out.append(f"<tr><td>{f['id']}</td><td class='{esc(f['severity'])}'><b>{esc(f['severity'])}</b></td>"
                       f"<td class='mono'>{esc(f['rule_type'])}</td><td class='mono'>{esc(f['ied_name'])}</td>"
                       f"<td>{esc(f['message'])}</td><td>{esc(f['reference']) or '—'}</td></tr>")
        out.append("</table>")

    out.append("<p class='meta'>Produced by VoltFlow. Rules follow IEC 61850-6 Ed2.1, IEC 61850-7-1 Ed2.1 Annex H and "
               "IEC 61850-8-1 Ed2 AMD1; see each finding's reference.</p></body></html>")
    return "".join(out)
