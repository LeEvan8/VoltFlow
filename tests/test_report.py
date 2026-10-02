"""Phase 5: standard references, validation report (HTML/CSV) and version comparison."""
import csv
import io
import re
from pathlib import Path

import pytest

from app.compare import compare_scl, render_compare_html
from app.parser import parse_scl
from app.report import build_report, render_html, links_csv, findings_csv
from app.rules import RULE_REFERENCES
from app import database
from tests.conftest import scl, ied, gse, gcb, fcda, extref, publisher, subscriber, templates, PUB_DATASET
from tests.test_api import client, upload  # noqa: F401  (pytest fixture + helper)

APP = Path(__file__).resolve().parent.parent / "app"


# --- references ---------------------------------------------------------------------------------

def test_every_rule_the_engine_can_emit_has_a_standard_reference():
    source = "".join((APP / f).read_text(encoding="utf-8") for f in ("analysis.py", "compare.py", "wire.py"))
    emitted = set(re.findall(r'"(?:ERROR|WARNING|INFO)",\s*"([A-Z][A-Z_]{4,})"', source))
    emitted |= set(re.findall(r'add_unresolved\(extref,\s*"([A-Z_]+)"', source))
    emitted |= set(re.findall(r'"(APPID_COLLISION|MULTICAST_MAC_DUPLICATE|GOID_DUPLICATE)"', source))
    assert len(emitted) >= 35
    assert sorted(emitted - set(RULE_REFERENCES)) == []


def test_findings_carry_their_reference(ws):
    ws.upload("pub.cid", scl(publisher()[0], gses=[publisher()[1]]))
    [finding] = ws.analyze()["errors"]
    assert finding["rule_type"] == "ORPHANED_STREAM"
    assert finding["reference"] == RULE_REFERENCES["ORPHANED_STREAM"]


# --- report -------------------------------------------------------------------------------------

def report_for(ws):
    conn = database.get_db_connection()
    try:
        return build_report(conn)
    finally:
        conn.close()


def schneider_record(**overrides):
    attrs = {"iedName": "PUB", "srcCBName": "GCB1", "ldName": "CFG", "confRev": "1", "appID": "0001",
             "MAC-Address": "01-0C-CD-01-00-01", "goID": "GoID_GCB1", "dsName": "DS1", **overrides}
    return "<Private " + " ".join(f'{k}="{v}"' for k, v in attrs.items()) + "/>"


def test_report_structure_counts_and_per_parameter_results(ws):
    pub_ied, pub_gse = publisher()
    sub = ied("SUB", {}, vendor_xml=schneider_record(confRev="2"),
              extrefs=[extref("PUB", "PRO", "PTOC", "1", "Op", "general", src_cb="GCB1", src_ld="CFG")])
    other, other_gse = publisher(name="LONE", cb="GCB9", appid="0005", mac="01-0C-CD-01-00-05")  # own GoID
    ws.upload("site.scd", scl(pub_ied, sub, other, gses=[pub_gse, other_gse]))
    report = report_for(ws)

    assert report["summary"]["links"] == 1 and report["summary"]["links_yellow"] == 1
    assert report["summary"]["orphaned_streams"] == 1 and report["summary"]["warnings"] == 2  # CONFREV_DESYNC + orphan
    [link] = report["links"]
    results = {p["param"]: (p["published"], p["expected"], p["result"]) for p in link["params"]}
    assert results["conf_rev"] == ("1", "2", "mismatch")
    assert results["appid"] == ("0001", "0001", "match")
    assert results["vlan_id"][2] == "not declared"
    assert link["findings"] and report["files"] == [{"order": 1, "name": "site.scd", "ieds": ["LONE", "PUB", "SUB"]}]


def test_report_html_escapes_names_from_the_files(ws):
    # IED names come from user files; they must never be injected into the report as markup.
    pub_ied, pub_gse = publisher(name="P&lt;script&gt;x")
    ws.upload("site.scd", scl(pub_ied, gses=[("P&lt;script&gt;x", pub_gse[1])]))
    page = render_html(report_for(ws))
    assert "<script>" not in page and "P&lt;script&gt;x" in page
    assert page.startswith("<!doctype html>") and "<title>VoltFlow Validation Report</title>" in page


def test_links_and_findings_csv(ws):
    pub_ied, pub_gse = publisher()
    ws.upload("site.scd", scl(pub_ied, subscriber(), gses=[pub_gse]))
    report = report_for(ws)

    text = links_csv(report)
    assert text.startswith("﻿")  # BOM for Excel
    rows = list(csv.DictReader(io.StringIO(text.lstrip("﻿"))))
    assert [(r["type"], r["publisher"], r["subscriber"], r["status"]) for r in rows] == [("link", "PUB", "SUB", "UNVERIFIED")]
    assert rows[0]["conf_rev_published"] == "1" and rows[0]["conf_rev_result"] == "not declared"

    lone_ied, lone_gse = publisher(name="LONE", cb="GCB9", appid="0005", mac="01-0C-CD-01-00-05")  # own GoID
    ws.upload("lone.cid", scl(lone_ied, gses=[lone_gse]))
    findings = list(csv.DictReader(io.StringIO(findings_csv(report_for(ws)).lstrip("﻿"))))
    assert [(f["rule"], f["standard_reference"]) for f in findings] == [("ORPHANED_STREAM", RULE_REFERENCES["ORPHANED_STREAM"])]


def test_report_endpoints(client):
    upload(client, "site.scd", scl(publisher()[0], subscriber(), gses=[publisher()[1]]))
    page = client.get("/api/v1/report.html")
    assert page.status_code == 200 and page.headers["content-type"].startswith("text/html")
    assert "PUB → SUB" in page.text
    for name in ("links", "findings"):
        res = client.get(f"/api/v1/report/{name}.csv")
        assert res.status_code == 200 and res.headers["content-type"].startswith("text/csv")
        assert re.match(rf'attachment; filename="voltflow-{name}-\d{{4}}-\d{{2}}-\d{{2}}\.csv"', res.headers["content-disposition"])


# --- version comparison -------------------------------------------------------------------------

def parsed(tmp_path, name, xml):
    path = tmp_path / name
    path.write_text(xml, encoding="utf-8")
    return parse_scl(str(path))


def site(conf_rev="1", members=PUB_DATASET, dests=(), sub_signals=("general", "q"), typed=False, general_btype="BOOLEAN", extra_ieds=()):
    pub_ied, pub_gse = publisher(conf_rev=conf_rev, dataset_members=members, dests=dests, typed=typed)
    sub = ied("SUB", {}, extrefs=[extref("PUB", "PRO", "PTOC", "1", "Op", da, src_cb="GCB1", src_ld="CFG", int_addr=da) for da in sub_signals])
    return scl(pub_ied, sub, *extra_ieds, gses=[pub_gse], templates=templates(general_btype) if typed else "")


def only_cb(diff):
    [cb] = diff["control_blocks"]
    return cb


def test_identical_versions_have_no_changes(tmp_path):
    diff = compare_scl(parsed(tmp_path, "a.scd", site()), parsed(tmp_path, "b.scd", site()), "a.scd", "b.scd")
    assert diff["control_blocks"] == [] and diff["subscriptions"] == []
    assert diff["summary"]["control_blocks_unchanged"] == 1


def test_confrev_bump_without_data_set_change_is_just_a_field_change(tmp_path):
    cb = only_cb(compare_scl(parsed(tmp_path, "a.scd", site("20001")), parsed(tmp_path, "b.scd", site("30001")), "a", "b"))
    assert cb["change"] == "changed" and cb["fields"] == [{"field": "confRev", "before": "20001", "after": "30001"}]
    assert cb["findings"] == []


def test_data_set_change_without_confrev_bump_is_an_error(tmp_path):
    grown = PUB_DATASET + [fcda("PRO", "PTOC", "1", "Str", "general")]
    cb = only_cb(compare_scl(parsed(tmp_path, "a.scd", site("5")), parsed(tmp_path, "b.scd", site("5", grown)), "a.scd", "b.scd"))
    assert cb["dataset"]["added"] == ["PRO/PTOC1.Str.general [ST]"]
    [finding] = cb["findings"]
    assert (finding["severity"], finding["rule"]) == ("ERROR", "CONFREV_NOT_INCREMENTED")
    assert finding["reference"] == RULE_REFERENCES["CONFREV_NOT_INCREMENTED"]


def test_reordering_and_type_changes_count_as_data_set_changes(tmp_path):
    cb = only_cb(compare_scl(parsed(tmp_path, "a.scd", site("5")), parsed(tmp_path, "b.scd", site("6", list(reversed(PUB_DATASET)))), "a", "b"))
    assert cb["dataset"]["reordered"] is True and cb["findings"] == []  # confRev was bumped

    cb = only_cb(compare_scl(parsed(tmp_path, "a.scd", site("5", typed=True)), parsed(tmp_path, "b.scd", site("5", typed=True, general_btype="INT32")), "a", "b"))
    assert cb["dataset"]["type_changes"] == ["Op.general: BOOLEAN → INT32"]
    assert [f["rule"] for f in cb["findings"]] == ["CONFREV_NOT_INCREMENTED"]


def test_confrev_going_down_is_flagged(tmp_path):
    cb = only_cb(compare_scl(parsed(tmp_path, "a.scd", site("30001")), parsed(tmp_path, "b.scd", site("20001")), "a", "b"))
    assert [(f["severity"], f["rule"]) for f in cb["findings"]] == [("WARNING", "CONFREV_DECREASED")]


def test_added_blocks_iedname_lists_and_subscriptions(tmp_path):
    lone = publisher(name="NEW", appid="0009", mac="01-0C-CD-01-00-09")[0]
    before = parsed(tmp_path, "a.scd", site())
    after = parsed(tmp_path, "b.scd", site(dests=["SUB"], sub_signals=("general",), extra_ieds=[lone]))
    diff = compare_scl(before, after, "a", "b")
    assert diff["ieds"]["added"] == ["NEW"]
    by_key = {(c["ied"], c["cb"]): c for c in diff["control_blocks"]}
    assert by_key[("NEW", "GCB1")]["change"] == "added"
    assert by_key[("PUB", "GCB1")]["destinations"] == {"added": ["SUB"], "removed": []}
    [sub] = diff["subscriptions"]
    assert (sub["change"], sub["signals_removed"], sub["signals_added"]) == ("changed", ["PRO/PTOC1.Op.q"], [])


def test_compare_html_escapes_and_lists_changes(tmp_path):
    diff = compare_scl(parsed(tmp_path, "a.scd", site("5")), parsed(tmp_path, "b.scd", site("5", PUB_DATASET[:1])), "<a>.scd", "b.scd")
    page = render_compare_html(diff)
    assert "&lt;a&gt;.scd" in page and "<a>.scd" not in page
    assert "CONFREV_NOT_INCREMENTED" in page and "PRO/PTOC1.Op.q [ST]" in page


def test_compare_endpoint_does_not_touch_the_workspace(client):
    files = {"before": ("a.scd", site("5").encode()), "after": ("b.scd", site("5", PUB_DATASET[:1]).encode())}
    res = client.post("/api/v1/compare", files=files)
    assert res.status_code == 200
    assert res.json()["summary"]["errors"] == 1
    html_res = client.post("/api/v1/compare?format=html", files=files)
    assert html_res.headers["content-type"].startswith("text/html") and "Version Comparison" in html_res.text
    assert client.get("/api/v1/files").json() == []  # nothing stored


@pytest.mark.parametrize("before, status", [(("bad.scd", b"not xml"), 422), (("notes.txt", b"x"), 400)])
def test_compare_endpoint_rejects_bad_files_naming_which_one(client, before, status):
    res = client.post("/api/v1/compare", files={"before": before, "after": ("b.scd", site().encode())})
    assert res.status_code == status and res.json()["detail"].startswith("before file")


def test_link_status_prefers_the_links_own_finding_over_a_control_block_finding_of_equal_colour(ws):
    # CONFREV_DESYNC (on the link, yellow) vs MULTICAST_MAC_DUPLICATE (on the whole block, yellow).
    pub_ied, pub_gse = publisher(conf_rev="2", mac="01-0C-CD-01-00-07")
    sub = ied("SUB", {}, vendor_xml=schneider_record(confRev="1", **{"MAC-Address": "01-0C-CD-01-00-07"}),
              extrefs=[extref("PUB", "PRO", "PTOC", "1", "Op", "general", src_cb="GCB1", src_ld="CFG")])
    twin, twin_gse = publisher(name="TWIN", cb="GCB9", appid="0009", mac="01-0C-CD-01-00-07")
    ws.upload("site.scd", scl(pub_ied, sub, twin, gses=[pub_gse, twin_gse]))
    result = ws.analyze()
    [edge] = [e for e in result["edges"] if e["publisher"] == "PUB" and e["subscriber"] == "SUB"]
    assert {"CONFREV_DESYNC", "MULTICAST_MAC_DUPLICATE"} <= {f["rule_type"] for f in result["errors"]}
    assert (edge["color_state"], edge["status"]) == ("YELLOW", "CONFREV_DESYNC")
