"""Phase 6a: GOOSE capture decoding, stream analysis and wire-vs-configuration checks."""
import json
import os

import pytest

from app import database
from app.goose import CaptureError, decode_frame, read_capture, summarize_capture
from tests.conftest import scl, ied, gse, gcb, extref, publisher, subscriber, templates, PUB_DATASET
from tests.goose_builder import (boolean, bits, float32, goose_frame, integer, other_frame, quality, structure, unsigned,
                                 utc, visible, write_pcap, write_pcapng)
from tests.test_api import client, upload  # noqa: F401

T0 = 1_750_000_000.0
PUB_REF, PUB_DS, PUB_GOID = "PUBCFG/LLN0$GO$GCB1", "PUBCFG/LLN0$DS1", "GoID_GCB1"


def pub_frame(**kw):
    """A frame exactly as configured by publisher(typed=True): GCB1, DS1 = Op.general (BOOLEAN), Op.q (Quality)."""
    args = dict(gocb_ref=PUB_REF, dat_set=PUB_DS, go_id=PUB_GOID, all_data=[boolean(True), quality()], appid=0x0001,
                dst="01-0C-CD-01-00-01", conf_rev=1, tal=2000)
    args.update(kw)
    return goose_frame(**args)


def heartbeat(n=5, start=T0, interval=1.0, st=1, sq0=10, **kw):
    """Steady-state retransmissions (sqNum already past the fast repetitions after the last event)."""
    return [(start + i * interval, pub_frame(st=st, sq=sq0 + i, **kw)) for i in range(n)]


# --- decoding --------------------------------------------------------------------------------------

def test_decodes_header_pdu_and_all_data_types():
    frame = goose_frame(gocb_ref="IED1LD0/LLN0$GO$G1", dat_set="IED1LD0/LLN0$DS", go_id="G1", st=7, sq=3, conf_rev=10001,
                        tal=4000, appid=0x3001, dst="01-0C-CD-01-00-07", vlan=(0x00A, 4), header_simulation=True, nds_com=True,
                        all_data=[boolean(False), integer(-5), unsigned(300), float32(1.5), bits("10"), quality("11"),
                                  utc(T0), visible("txt"), structure(boolean(True), quality())])
    g = decode_frame(frame)
    assert (g["dst_mac"], g["vlan_id"], g["vlan_priority"], g["appid"], g["header_simulation"]) == ("01-0C-CD-01-00-07", 10, 4, "3001", True)
    assert (g["gocb_ref"], g["go_id"], g["st_num"], g["sq_num"], g["conf_rev"], g["tal"], g["nds_com"], g["num_entries"]) == \
           ("IED1LD0/LLN0$GO$G1", "G1", 7, 3, 10001, 4000, True, 9)
    assert g["t"] == "2023-11-14T22:13:20.000Z"  # builder's default PDU timestamp (1 700 000 000 s)
    assert g["all_data"] == [("boolean", False), ("integer", -5), ("unsigned", 300), ("float", 1.5), ("bit-string", "10"),
                             ("bit-string", "1100000000000"), ("utc-time", g["all_data"][6][1]), ("visible-string", "txt"),
                             ("structure", [("boolean", True), ("bit-string", "0000000000000")])]


def test_non_goose_and_malformed_frames():
    assert decode_frame(other_frame()) is None
    assert decode_frame(b"\x00" * 10) is None
    broken = pub_frame()[:40]  # cut inside the PDU
    assert "error" in decode_frame(broken)


@pytest.mark.parametrize("writer", [
    lambda p, pk: write_pcap(p, pk), lambda p, pk: write_pcap(p, pk, endian=">"), lambda p, pk: write_pcap(p, pk, nano=True),
    lambda p, pk: write_pcapng(p, pk), lambda p, pk: write_pcapng(p, pk, tsresol=9), lambda p, pk: write_pcapng(p, pk, endian=">"),
])
def test_reads_pcap_and_pcapng_variants_with_timestamps(tmp_path, writer):
    path = tmp_path / "c.cap"
    writer(str(path), [(T0, other_frame()), (T0 + 1.25, pub_frame())])
    packets = list(read_capture(str(path)))
    assert [round(ts, 3) for ts, _, _ in packets] == [T0, T0 + 1.25]
    assert decode_frame(packets[1][2])["gocb_ref"] == PUB_REF


def test_rejects_files_that_are_not_captures(tmp_path):
    path = tmp_path / "x.pcap"
    path.write_bytes(b"<?xml version='1.0'?><SCL/>")
    with pytest.raises(CaptureError, match="Not a pcap"):
        list(read_capture(str(path)))
    path.write_bytes(b"")
    with pytest.raises(CaptureError):
        list(read_capture(str(path)))


# --- stream summary -----------------------------------------------------------------------------------

def test_stream_summary_sequence_and_timing(tmp_path):
    packets = heartbeat(4)                                                             # st 1, sq 0..3 every 1 s
    packets += [(T0 + 4.0, pub_frame(st=2, sq=0, all_data=[boolean(False), quality()]))]  # event
    packets += [(T0 + 4.004, pub_frame(st=2, sq=1)), (T0 + 4.012, pub_frame(st=2, sq=2))]
    packets += [(T0 + 6.5, pub_frame(st=2, sq=5))]                                     # 2 lost, 2488 ms > TAL 2000
    packets += [(T0 + 7.0, pub_frame(st=1, sq=0))]                                     # stNum went back: restart
    path = tmp_path / "s.pcapng"
    write_pcapng(str(path), packets)
    summary = summarize_capture(str(path))
    assert summary["totals"]["goose_frames"] == 9
    [s] = summary["streams"]
    assert (s["frames"], s["sq_gaps"], s["st_resets"]) == (9, 2, 1)
    assert s["first_retransmission_ms"] == [4.0]
    assert [e["st_num"] for e in s["events"]] == [1, 2, 1]
    assert [v["gap_ms"] for v in s["tal_violations"]] == [2488.0]
    assert s["max_steady_gap_ms"] == 2488.0


# --- wire vs configuration ------------------------------------------------------------------------------

def load_capture(ws, name, packets):
    path = ws.tmp_path / name
    write_pcapng(str(path), packets)
    summary = summarize_capture(str(path))
    conn = database.get_db_connection()
    try:
        seq = conn.execute("SELECT COALESCE(MAX(seq), 0) + 1 FROM captures").fetchone()[0]
        conn.execute("INSERT INTO captures (name, seq, summary_json) VALUES (?, ?, ?)", (name, seq, json.dumps(summary)))
        conn.commit()
    finally:
        conn.close()


def wire_rules(result):
    return sorted(e["rule_type"] for e in result["errors"] if e["rule_type"].startswith("WIRE_"))


def typed_site(ws, sub_record=""):
    pub_ied, pub_gse = publisher(typed=True)
    sub = ied("SUB", {}, vendor_xml=sub_record,
              extrefs=[extref("PUB", "PRO", "PTOC", "1", "Op", "general", src_cb="GCB1", src_ld="CFG")])
    ws.upload("site.scd", scl(pub_ied, sub, gses=[pub_gse], templates=templates(), extra_ns='xmlns:v="urn:vendor"'))


def the_link(result):
    [edge] = [e for e in result["edges"] if e["publisher"] == "PUB" and e["subscriber"] == "SUB"]
    return edge


def test_capture_matching_the_configuration_has_no_findings_and_shows_named_values(ws):
    typed_site(ws)
    load_capture(ws, "bench.pcapng", heartbeat(4))
    result = ws.analyze()
    assert wire_rules(result) == []
    wire = the_link(result)["network_details"]["wire"]
    assert (wire["state"], wire["frames"], wire["matched_via"], wire["vlan_visible"]) == ("ok", 4, "gocbRef", False)
    assert all(f["ok"] for f in wire["fields"])
    assert wire["values"] == [["PRO/PTOC1.Op.general", "TRUE"], ["PRO/PTOC1.Op.q", "good"]] or \
           wire["values"] == [("PRO/PTOC1.Op.general", "TRUE"), ("PRO/PTOC1.Op.q", "good")]
    assert result["captures"][0]["streams"] == 1


def test_device_running_another_configuration(ws):
    record = ('<Private type="X"><v:GooseSubscription iedName="PUB" ldInst="CFG" cbName="GCB1" confRev="1" APPID="0001"/></Private>')
    typed_site(ws, record)
    load_capture(ws, "bench.pcapng", heartbeat(3, conf_rev=2, appid=0x0009))
    result = ws.analyze()
    assert wire_rules(result) == ["WIRE_CONFIG_MISMATCH", "WIRE_SUBSCRIBER_MISMATCH"]
    config = next(e for e in result["errors"] if e["rule_type"] == "WIRE_CONFIG_MISMATCH")
    assert "APPID on wire 0009 vs configured 0001" in config["message"] and "confRev on wire 2 vs configured 1" in config["message"]
    sub = next(e for e in result["errors"] if e["rule_type"] == "WIRE_SUBSCRIBER_MISMATCH")
    assert sub["xpath"] == f"e-{the_link(result)['id']}"
    edge = the_link(result)
    assert edge["network_details"]["wire"]["state"] == "mismatch"
    assert edge["color_state"] == "GREEN"  # wire evidence does not recolour configuration status


def test_payload_types_must_match_the_data_set(ws):
    typed_site(ws)
    load_capture(ws, "bench.pcapng", heartbeat(2, all_data=[integer(1), quality()]))
    [finding] = [e for e in ws.analyze()["errors"] if e["rule_type"] == "WIRE_TYPE_MISMATCH"]
    assert "entry 1 (Op.general): configured boolean, on wire integer" in finding["message"]


def test_timing_sequence_simulation_and_commissioning_flags(ws):
    typed_site(ws)
    packets = heartbeat(2, interval=1.5, tal=1000) + [(T0 + 3.0, pub_frame(sq=15, tal=1000, header_simulation=True, nds_com=True))]
    load_capture(ws, "bench.pcapng", packets)
    assert wire_rules(ws.analyze()) == ["WIRE_FRAMES_LOST", "WIRE_MAXTIME_EXCEEDED", "WIRE_NEEDS_COMMISSIONING",
                                        "WIRE_SIMULATION", "WIRE_STREAM_INTERRUPTED"]


def test_vlan_is_checked_only_when_the_tag_is_visible(ws):
    typed_site(ws)
    load_capture(ws, "tagged.pcapng", heartbeat(2, vlan=(0x005, 4)))
    result = ws.analyze()
    finding = next(e for e in result["errors"] if e["rule_type"] == "WIRE_CONFIG_MISMATCH")
    assert "VLAN ID on wire 005 vs configured 000" in finding["message"]
    assert the_link(result)["network_details"]["wire"]["vlan_visible"] is True


def test_unknown_streams_and_configured_blocks_not_seen(ws):
    pub = ied("PUB", {"CFG": {"datasets": {"DS1": PUB_DATASET}, "gcbs": [gcb("GCB1"), gcb("GCB2", app_id="GoID_GCB2")]}})
    other, other_gse = publisher(name="QUIET", cb="GQ", appid="0007", mac="01-0C-CD-01-00-07")
    ws.upload("site.scd", scl(pub, other, gses=[gse("PUB", "CFG", "GCB1"), gse("PUB", "CFG", "GCB2", appid="0002", mac="01-0C-CD-01-00-02"),
                                                 other_gse]))
    load_capture(ws, "bench.pcapng", heartbeat(2, all_data=[boolean(True), quality()]) +
                 [(T0, goose_frame(gocb_ref="PUBCFG/LLN0$GO$ROGUE", dat_set="PUBCFG/LLN0$X", go_id="X", all_data=[boolean(True)], appid=0x0042))])
    result = ws.analyze()
    assert wire_rules(result) == ["WIRE_IED_SILENT", "WIRE_NOT_SEEN", "WIRE_UNKNOWN_STREAM"]
    unknown = next(e for e in result["errors"] if e["rule_type"] == "WIRE_UNKNOWN_STREAM")
    assert unknown["target_ied"] == "PUB" and "PUBCFG/LLN0$GO$ROGUE" in unknown["message"]
    silent = next(e for e in result["errors"] if e["rule_type"] == "WIRE_IED_SILENT")
    assert silent["severity"] == "INFO" and silent["ied_name"] == "QUIET"


def test_ldname_and_goid_fallback_matching(ws):
    pub = ied("PUB", {"CFG": {"ld_name": "BAY1_CTRL", "datasets": {"DS1": PUB_DATASET}, "gcbs": [gcb("GCB1")]}})
    ws.upload("site.scd", scl(pub, gses=[gse("PUB", "CFG", "GCB1")]))
    load_capture(ws, "a.pcapng", [(T0, goose_frame(gocb_ref="BAY1_CTRL/LLN0$GO$GCB1", dat_set="BAY1_CTRL/LLN0$DS1",
                                                   go_id=PUB_GOID, all_data=[boolean(True), quality()], t=T0))])
    assert wire_rules(ws.analyze()) == []
    load_capture(ws, "b.pcapng", [(T0, goose_frame(gocb_ref="OTHERNAME/LLN0$GO$GCB1", dat_set="BAY1_CTRL/LLN0$DS1",
                                                   go_id=PUB_GOID, all_data=[boolean(True), quality()], t=T0))])
    result = ws.analyze()
    [finding] = [e for e in result["errors"] if e["rule_type"].startswith("WIRE_")]
    assert finding["rule_type"] == "WIRE_CONFIG_MISMATCH" and "gocbRef on wire OTHERNAME/LLN0$GO$GCB1" in finding["message"]
    [stub] = [e for e in result["edges"] if e["is_orphan_stub"]]
    assert stub["network_details"]["wire"]["matched_via"] == "GoID"


# --- API ------------------------------------------------------------------------------------------------

def capture_bytes(tmp_path, packets, name="c.pcapng"):
    path = tmp_path / name
    write_pcapng(str(path), packets)
    return path.read_bytes()


def test_capture_endpoints(client, tmp_path):
    upload(client, "site.scd", scl(publisher()[0], subscriber(), gses=[publisher()[1]]))
    res = client.post("/api/v1/captures", files={"file": ("bench.pcapng", capture_bytes(tmp_path, heartbeat(3)))})
    assert res.status_code == 200 and res.json()["streams"] == 1
    [cap] = client.get("/api/v1/captures").json()
    assert (cap["name"], cap["goose_frames"], cap["duration_s"]) == ("bench.pcapng", 3, 2.0)
    edge = next(e for e in client.get("/api/v1/graph-data").json()["edges"] if e["subscriber"] == "SUB")
    assert edge["network_details"]["wire"]["frames"] == 3
    assert client.delete("/api/v1/captures/bench.pcapng").status_code == 200
    assert client.get("/api/v1/captures").json() == []


def test_capture_upload_rejections(client, tmp_path):
    assert client.post("/api/v1/captures", files={"file": ("x.scd", b"<SCL/>")}).status_code == 400
    res = client.post("/api/v1/captures", files={"file": ("arp.pcap", capture_bytes(tmp_path, [(T0, other_frame())]))})
    assert res.status_code == 422 and "no GOOSE frames" in res.json()["detail"]
    res = client.post("/api/v1/captures", files={"file": ("junk.pcap", b"not a capture at all")})
    assert res.status_code == 422 and "Not a pcap" in res.json()["detail"]


def test_reset_clears_captures(client, tmp_path):
    client.post("/api/v1/captures", files={"file": ("bench.pcapng", capture_bytes(tmp_path, heartbeat(2)))})
    client.delete("/api/v1/reset")
    assert client.get("/api/v1/captures").json() == []


def test_data_set_shared_by_two_control_blocks_is_stored_once(tmp_path):
    pub = ied("PUB", {"CFG": {"datasets": {"DS1": PUB_DATASET}, "gcbs": [gcb("GCB1"), gcb("GCB2", app_id="GoID_GCB2")]}})
    path = tmp_path / "shared.scd"
    path.write_text(scl(pub), encoding="utf-8")
    from app.parser import parse_scl
    assert len(parse_scl(str(path)).dataset_members) == len(PUB_DATASET)


def test_clock_offset_between_ied_and_capture_is_reported_once_per_ied(ws):
    typed_site(ws)
    # Relay clock 7.8 h ahead: T in the message (time of the change) vs the time the frame was captured.
    offset = 7.8 * 3600
    packets = heartbeat(2) + [(T0 + 3.0, pub_frame(st=2, sq=0, t=T0 + 3.0 + offset)),
                              (T0 + 3.002, pub_frame(st=2, sq=1, t=T0 + 3.0 + offset))]
    load_capture(ws, "bench.pcapng", packets)
    result = ws.analyze()
    [finding] = [e for e in result["errors"] if e["rule_type"] == "WIRE_CLOCK_OFFSET"]
    assert finding["ied_name"] == "PUB" and "+7.80 h from the capture clock" in finding["message"]
    assert the_link(result)["network_details"]["wire"]["timing"]["clock_offset_s"] == pytest.approx(offset, abs=0.01)


def test_synchronised_clock_is_not_reported(ws):
    typed_site(ws)
    load_capture(ws, "bench.pcapng", heartbeat(2) + [(T0 + 3.0, pub_frame(st=2, sq=0, t=T0 + 3.0004))])
    assert "WIRE_CLOCK_OFFSET" not in wire_rules(ws.analyze())


def test_unknown_stream_in_several_captures_is_one_finding(ws):
    typed_site(ws)
    rogue = lambda t: (t, goose_frame(gocb_ref="X/LLN0$GO$R", dat_set="X/LLN0$D", go_id="R", all_data=[boolean(True)], appid=0x0042))
    load_capture(ws, "a.pcapng", heartbeat(2) + [rogue(T0)])
    load_capture(ws, "b.pcapng", heartbeat(2) + [rogue(T0 + 1)])
    [finding] = [e for e in ws.analyze()["errors"] if e["rule_type"] == "WIRE_UNKNOWN_STREAM"]
    assert "Seen in 'a.pcapng' (1 frames), 'b.pcapng' (1 frames)" in finding["message"]


BENCH_DIR = os.environ.get("VOLTFLOW_BENCH_CAPTURES")


@pytest.mark.skipif(not BENCH_DIR, reason="set VOLTFLOW_BENCH_CAPTURES to a folder of real bench captures")
def test_real_bench_captures_decode_without_errors():
    import glob
    files = glob.glob(os.path.join(BENCH_DIR, "*.pcap*"))
    assert files
    for path in files:
        summary = summarize_capture(path)
        assert summary["totals"]["goose_frames"] > 0 and summary["totals"]["decode_errors"] == 0, path
