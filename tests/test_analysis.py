from pathlib import Path

import pytest

from app.analysis import EXPECTED_PARAMS
from tests.conftest import scl, ied, gcb, gse, fcda, extref, publisher, subscriber, PUB_DATASET


def edges_between(result, pub, sub):
    return [e for e in result["edges"] if e["publisher"] == pub and e["subscriber"] == sub and not e["is_orphan_stub"]]


# --- Subscription resolution --------------------------------------------------

def test_link_without_any_declared_expectation_is_green_but_unverified(ws):
    # Standard ExtRefs carry no expected confRev/APPID/MAC/...: nothing to compare, so the link must not claim VALID.
    pub_ied, pub_gse = publisher()
    ws.upload("site.scd", scl(pub_ied, subscriber(), gses=[pub_gse]))
    result = ws.analyze()
    [edge] = edges_between(result, "PUB", "SUB")
    assert (edge["color_state"], edge["status"]) == ("GREEN", "UNVERIFIED")
    details = edge["network_details"]
    assert details["match_method"] == "standard"
    assert details["fully_verified"] is False
    assert details["not_declared"] == EXPECTED_PARAMS
    assert result["errors"] == []  # unverified is a status, not a finding


def test_missing_src_ld_inst_defaults_to_ld_inst_then_falls_back_to_dataset(ws):
    # ExtRef ldInst=PRO, no srcLDInst: standard default points at PUB/PRO/LLN0.GCB1 which doesn't exist.
    pub_ied, pub_gse = publisher()
    ws.upload("site.scd", scl(pub_ied, subscriber(src_ld=None), gses=[pub_gse]))
    result = ws.analyze()
    [edge] = edges_between(result, "PUB", "SUB")
    assert edge["network_details"]["match_method"] == "dataset"
    assert edge["color_state"] == "GREEN"  # non-conformance is flagged, but the link stays green
    assert edge["status"] == "SRC_LDINST_DEFAULT_MISMATCH"
    [note] = result["errors"]
    assert (note["rule_type"], note["severity"]) == ("SRC_LDINST_DEFAULT_MISMATCH", "WARNING")
    assert note["xpath"] == f"e-{edge['id']}"
    assert "confirmed by the vendor" not in note["message"]


def test_missing_src_ld_inst_confirmed_by_vendor_record(ws):
    # Schneider-style Private next to the ExtRefs names the LD the control block really lives in.
    pub_ied, pub_gse = publisher()
    vendor = '<Private type="X" iedName="PUB" srcCBName="GCB1" ldName="CFG" ldInst="PRO"/>'
    sub = ied("SUB", {}, vendor_xml=vendor, extrefs=[extref("PUB", "PRO", "PTOC", "1", "Op", "general", src_cb="GCB1")])
    ws.upload("site.scd", scl(pub_ied, sub, gses=[pub_gse]))
    result = ws.analyze()
    [edge] = edges_between(result, "PUB", "SUB")
    [note] = result["errors"]
    assert edge["color_state"] == "GREEN"
    assert (note["rule_type"], note["severity"]) == ("SRC_LDINST_DEFAULT_MISMATCH", "WARNING")
    assert "confirmed by the vendor subscription record (ldName='CFG')" in note["message"]


def test_vendor_record_naming_another_ld_does_not_confirm(ws):
    pub_ied, pub_gse = publisher()
    vendor = '<Private type="X" iedName="PUB" srcCBName="GCB1" ldName="OTHER"/>'
    sub = ied("SUB", {}, vendor_xml=vendor, extrefs=[extref("PUB", "PRO", "PTOC", "1", "Op", "general", src_cb="GCB1")])
    ws.upload("site.scd", scl(pub_ied, sub, gses=[pub_gse]))
    [note] = ws.analyze()["errors"]
    assert note["rule_type"] == "SRC_LDINST_DEFAULT_MISMATCH"
    assert "confirmed by the vendor" not in note["message"]


def test_explicit_wrong_src_ld_inst_stays_a_warning(ws):
    # srcLDInst written out but pointing at an LD without that block: a real error in the file, not an omission.
    pub_ied, pub_gse = publisher()
    ws.upload("site.scd", scl(pub_ied, subscriber(src_ld="PRO"), gses=[pub_gse]))
    result = ws.analyze()
    [edge] = edges_between(result, "PUB", "SUB")
    [note] = result["errors"]
    assert (note["rule_type"], note["severity"]) == ("SRC_LDINST_MISMATCH", "WARNING")
    assert edge["color_state"] == "YELLOW" and edge["status"] == "SRC_LDINST_MISMATCH"


def test_unknown_control_block_is_unresolved_and_drawn_as_dangling_stub(ws):
    pub_ied, pub_gse = publisher()
    ws.upload("site.scd", scl(pub_ied, subscriber(src_cb="NOPE"), gses=[pub_gse]))
    result = ws.analyze()
    assert edges_between(result, "PUB", "SUB") == []
    [stub] = [e for e in result["edges"] if e["is_unresolved_stub"]]
    assert (stub["publisher"], stub["subscriber"], stub["app_id"]) == ("SUB", "SUB", "NOPE")
    assert (stub["color_state"], stub["status"], stub["unresolved_publisher"]) == ("YELLOW", "UNRESOLVED_SOURCE", "PUB")
    unresolved = next(e for e in result["errors"] if e["rule_type"] == "UNRESOLVED_SOURCE")
    assert unresolved["severity"] == "WARNING"
    assert unresolved["target_ied"] == "SUB" and unresolved["xpath"] == f"e-{stub['id']}"
    # both ExtRefs (general + q) collapse into one stub and one finding
    assert ws.rules().count("UNRESOLVED_SOURCE") == 1


def test_edition1_extref_without_src_cb_name_resolves_by_dataset(ws):
    pub_ied, pub_gse = publisher()
    sub = ied("SUB", {}, extrefs=[extref("PUB", "PRO", "PTOC", "1", "Op", "general", service=None)])
    ws.upload("site.scd", scl(pub_ied, sub, gses=[pub_gse]))
    [edge] = edges_between(ws.analyze(), "PUB", "SUB")
    assert edge["network_details"]["match_method"] == "dataset"
    assert ws.rules() == []


def test_signal_not_in_publisher_dataset(ws):
    pub_ied, pub_gse = publisher()
    sub = ied("SUB", {}, extrefs=[extref("PUB", "PRO", "PTOC", "1", "Str", "general", src_cb="GCB1", src_ld="CFG")])
    ws.upload("site.scd", scl(pub_ied, sub, gses=[pub_gse]))
    assert ws.rules() == ["DATASET_MEMBER_MISSING"]
    [edge] = edges_between(ws.analyze(), "PUB", "SUB")
    assert edge["color_state"] == "RED"


def test_publisher_not_loaded(ws):
    ws.upload("sub.cid", scl(subscriber()))
    assert ws.rules() == ["PUBLISHER_NOT_LOADED"]


def test_subscribing_to_unused_block(ws):
    pub = ied("PUB", {"CFG": {"gcbs": [gcb("GCB1", datset=None)]}})
    ws.upload("site.scd", scl(pub, subscriber()))
    assert ws.rules() == ["SUBSCRIBED_TO_UNUSED_CB"]


# --- Unused blocks / orphans ----------------------------------------------------

def test_unused_blocks_are_hidden_and_listed_on_node(ws):
    pub = ied("PUB", {"CFG": {"gcbs": [gcb("gcb2", datset=None), gcb("gcb3", datset=None)]}})
    ws.upload("pub.cid", scl(pub))
    result = ws.analyze()
    assert result["edges"] == [] and result["errors"] == []
    assert [u["cb_name"] for u in result["nodes"][0]["unused_cbs"]] == ["gcb2", "gcb3"]
    assert {u["status"] for u in result["nodes"][0]["unused_cbs"]} == {"UNUSED_CB"}


def test_orphan_stubs_on_same_ied_get_distinct_indexes(ws):
    pub = ied("PUB", {"CFG": {"datasets": {"DS1": PUB_DATASET},
                              "gcbs": [gcb("A"), gcb("B")]}})
    ws.upload("pub.cid", scl(pub, gses=[gse("PUB", "CFG", "A", appid="0001", mac="01-0C-CD-01-00-01"),
                                         gse("PUB", "CFG", "B", appid="0002", mac="01-0C-CD-01-00-02")]))
    result = ws.analyze()
    assert [e["edge_index"] for e in result["edges"]] == [0, 1]
    assert ws.rules() == ["ORPHANED_STREAM", "ORPHANED_STREAM"]


# --- Cross-file expectations ------------------------------------------------------

def test_conf_rev_and_address_drift_between_files(ws):
    # The subscriber's CID carries its own (old) copy of the publisher; the publisher was later re-configured.
    old_pub, old_gse = publisher(conf_rev="1", appid="0001", mac="01-0C-CD-01-00-01", vlan="000")
    ws.upload("sub.cid", scl(old_pub, subscriber(), gses=[old_gse]))
    new_pub, new_gse = publisher(conf_rev="10001", appid="0002", mac="01-0C-CD-01-00-02", vlan="00A")
    ws.upload("pub.cid", scl(new_pub, gses=[new_gse]))

    result = ws.analyze()
    [edge] = edges_between(result, "PUB", "SUB")
    details = edge["network_details"]
    assert details["pub_rev"] == "10001" and details["sub_rev"] == "1"
    assert set(details["expected_sources"].values()) == {"sub.cid"}
    assert edge["color_state"] == "RED" and edge["status"] == "NETWORK_ROUTING_FAIL"
    assert ws.rules() == ["CONFREV_DESYNC", "NETWORK_ROUTING_FAIL"]
    [routing] = [e for e in result["errors"] if e["rule_type"] == "NETWORK_ROUTING_FAIL"]
    assert routing["severity"] == "ERROR"
    assert all(part in routing["message"] for part in ("APPID publisher '0002'", "MAC publisher", "VLAN publisher 00A"))


def test_conf_rev_desync_alone_is_yellow(ws):
    old_pub, old_gse = publisher(conf_rev="1")
    ws.upload("sub.cid", scl(old_pub, subscriber(), gses=[old_gse]))
    new_pub, new_gse = publisher(conf_rev="10001")
    ws.upload("pub.cid", scl(new_pub, gses=[new_gse]))
    result = ws.analyze()
    [edge] = edges_between(result, "PUB", "SUB")
    assert (edge["color_state"], edge["status"]) == ("YELLOW", "CONFREV_DESYNC")
    [finding] = result["errors"]
    assert (finding["rule_type"], finding["severity"]) == ("CONFREV_DESYNC", "WARNING")


@pytest.mark.parametrize("new_members, new_name, change", [
    (PUB_DATASET + [fcda("PRO", "PTOC", "1", "Str", "general")], "DS1", "1 member(s) added, 0 removed (2 → 3 entries)"),
    (PUB_DATASET[:1], "DS1", "0 member(s) added, 1 removed (2 → 1 entries)"),
    (list(reversed(PUB_DATASET)), "DS1", "the same members were reordered"),
    (PUB_DATASET, "DS2", "it expects data set 'DS1' but the publisher sends 'DS2'"),
])
def test_dataset_sequence_collapse_is_fatal(ws, new_members, new_name, change):
    old_pub, old_gse = publisher(conf_rev="1")
    ws.upload("sub.cid", scl(old_pub, subscriber(), gses=[old_gse]))
    new_pub, new_gse = publisher(conf_rev="10001", dataset_members=new_members, dataset_name=new_name)
    ws.upload("pub.cid", scl(new_pub, gses=[new_gse]))
    result = ws.analyze()
    [edge] = edges_between(result, "PUB", "SUB")
    assert (edge["color_state"], edge["status"]) == ("RED", "FATAL_TYPE_MISMATCH")  # red outranks the yellow confRev desync
    assert edge["network_details"]["flags"]["dataset_mismatch"] is True
    [fatal] = [e for e in result["errors"] if e["rule_type"] == "FATAL_TYPE_MISMATCH"]
    assert fatal["severity"] == "ERROR" and change in fatal["message"]
    assert "CONFREV_DESYNC" in ws.rules()


def test_identical_dataset_across_files_is_not_flagged(ws):
    old_pub, old_gse = publisher()
    ws.upload("sub.cid", scl(old_pub, subscriber(), gses=[old_gse]))
    new_pub, new_gse = publisher()
    ws.upload("pub.cid", scl(new_pub, gses=[new_gse]))
    [edge] = edges_between(ws.analyze(), "PUB", "SUB")
    assert (edge["color_state"], edge["status"]) == ("GREEN", "VALID")
    assert edge["network_details"]["sub_dataset"] == "DS1"
    assert ws.rules() == []


def test_same_file_gives_no_independent_expectation(ws):
    pub_ied, pub_gse = publisher()
    ws.upload("site.scd", scl(pub_ied, subscriber(), gses=[pub_gse]))
    [edge] = edges_between(ws.analyze(), "PUB", "SUB")
    assert edge["network_details"]["sub_rev"] is None
    assert edge["network_details"]["expected_sources"] == {}


def test_vendor_subscription_expected_conf_rev(ws):
    pub_ied, pub_gse = publisher(conf_rev="3")
    vendor = '<Private type="X"><v:GooseSubscription iedName="PUB" cbName="GCB1" confRev="2"/></Private>'
    sub = ied("SUB", {}, vendor_xml=vendor, extrefs=[extref("PUB", "PRO", "PTOC", "1", "Op", "general", src_cb="GCB1", src_ld="CFG")])
    ws.upload("site.scd", scl(pub_ied, sub, gses=[pub_gse], extra_ns='xmlns:v="urn:vendor"'))
    assert ws.rules() == ["CONFREV_DESYNC"]


def schneider_record(**overrides):
    """Schneider-style ExtRef companion record declaring what SUB expects from PUB/CFG/LLN0.GCB1 (matches publisher())."""
    attrs = {"iedName": "PUB", "srcCBName": "GCB1", "ldName": "CFG", "ldInst": "PRO", "confRev": "1", "appID": "0001",
             "MAC-Address": "01-0C-CD-01-00-01", "goID": "GoID_GCB1", "dsName": "DS1", **overrides}
    return "<Private " + " ".join(f'{k}="{v}"' for k, v in attrs.items() if v is not None) + "/>"


def sel_record(**overrides):
    attrs = {"iedName": "PUB", "ldInst": "CFG", "cbName": "GCB1", "datSet": "DS1", "appId": "GoID_GCB1", "confRev": "1",
             "mAddr": "01-0C-CD-01-00-01", "APPID": "0001", "VLAN-ID": "000", "VLAN-PRIORITY": "4", **overrides}
    return '<Private type="X"><v:GooseSubscription ' + " ".join(f'{k}="{v}"' for k, v in attrs.items() if v is not None) + "/></Private>"


def upload_with_record(ws, record, **pub_kwargs):
    pub_ied, pub_gse = publisher(**pub_kwargs)
    sub = ied("SUB", {}, vendor_xml=record, extrefs=[extref("PUB", "PRO", "PTOC", "1", "Op", "general", src_cb="GCB1", src_ld="CFG")])
    ws.upload("site.scd", scl(pub_ied, sub, gses=[pub_gse], extra_ns='xmlns:v="urn:vendor"'))
    result = ws.analyze()
    [edge] = edges_between(result, "PUB", "SUB")
    return edge, result


def test_vendor_record_declaring_all_required_values_makes_link_valid(ws):
    edge, result = upload_with_record(ws, schneider_record())
    details = edge["network_details"]
    assert (edge["color_state"], edge["status"]) == ("GREEN", "VALID")
    assert details["fully_verified"] is True
    assert (details["sub_rev"], details["sub_appid"], details["sub_mac"], details["sub_goid"], details["sub_dataset"]) ==            ("1", "0001", "01-0C-CD-01-00-01", "GoID_GCB1", "DS1")
    assert details["not_declared"] == ["vlan_id", "vlan_priority"]  # Schneider records carry no VLAN; not required
    assert set(details["expected_sources"].values()) == {"Test subscription record"}  # subscriber manufacturer + record type
    assert result["errors"] == []


def test_sel_record_with_vlan_verifies_everything(ws):
    edge, result = upload_with_record(ws, sel_record(**{"VLAN-ID": "0"}))  # "0" == "000" numerically
    assert (edge["color_state"], edge["status"]) == ("GREEN", "VALID")
    assert edge["network_details"]["not_declared"] == []
    assert result["errors"] == []


def test_partial_vendor_record_leaves_link_unverified(ws):
    edge, result = upload_with_record(ws, schneider_record(**{"MAC-Address": None, "goID": None}))
    assert (edge["color_state"], edge["status"]) == ("GREEN", "UNVERIFIED")
    assert edge["network_details"]["not_declared"] == ["mac", "go_id", "vlan_id", "vlan_priority"]
    assert result["errors"] == []


@pytest.mark.parametrize("record, rule, color, text", [
    (schneider_record(confRev="2"), "CONFREV_DESYNC", "YELLOW", "expects '2'"),
    (schneider_record(appID="0002"), "NETWORK_ROUTING_FAIL", "RED", "APPID publisher '0001' vs expected '0002'"),
    (schneider_record(**{"MAC-Address": "01-0C-CD-01-00-09"}), "NETWORK_ROUTING_FAIL", "RED", "MAC publisher"),
    (schneider_record(goID="OTHER"), "NETWORK_ROUTING_FAIL", "RED", "GoID publisher 'GoID_GCB1' vs expected 'OTHER'"),
    (schneider_record(dsName="DS9"), "FATAL_TYPE_MISMATCH", "RED", "expects data set 'DS9' but the publisher sends 'DS1'"),
    (sel_record(**{"VLAN-ID": "005"}), "NETWORK_ROUTING_FAIL", "RED", "VLAN publisher 000/prio 4 vs expected 005/prio 4"),
    (sel_record(**{"VLAN-PRIORITY": "6"}), "NETWORK_ROUTING_FAIL", "RED", "vs expected 000/prio 6"),
])
def test_vendor_record_reveals_each_mismatch(ws, record, rule, color, text):
    edge, result = upload_with_record(ws, record)
    [finding] = result["errors"]
    assert finding["rule_type"] == rule and text in finding["message"]
    assert "Test " in finding["message"]  # names the record the expected value came from
    assert edge["color_state"] == color


def test_vendor_record_for_another_ld_is_not_used(ws):
    edge, result = upload_with_record(ws, schneider_record(ldName="OTHER", confRev="99"))
    assert edge["status"] == "UNVERIFIED" and result["errors"] == []


def test_latest_upload_is_authoritative_and_reupload_replaces(ws):
    pub_ied, pub_gse = publisher(appid="0001")
    ws.upload("a.cid", scl(pub_ied, gses=[pub_gse]))
    pub_ied2, pub_gse2 = publisher(appid="0002")
    ws.upload("b.cid", scl(pub_ied2, gses=[pub_gse2]))
    assert ws.analyze()["edges"][0]["network_details"]["appid"] == "0002"
    ws.upload("a.cid", scl(publisher(appid="0003")[0], gses=[publisher(appid="0003")[1]]))
    result = ws.analyze()
    assert len(result["edges"]) == 1
    assert result["edges"][0]["network_details"]["appid"] == "0003"


# --- Publisher-side rules ------------------------------------------------------------

def two_publishers(ws, a_kwargs, b_kwargs):
    a, ga = publisher("A", **a_kwargs)
    b, gb = publisher("B", **b_kwargs)
    ws.upload("site.scd", scl(a, b, gses=[ga, gb]))


def test_appid_collision_flags_only_the_colliding_streams(ws):
    a, ga = publisher("A", appid="0001", mac="01-0C-CD-01-00-01")
    b, gb = publisher("B", appid="0001", mac="01-0C-CD-01-00-02")
    c, gc = publisher("C", appid="0002", mac="01-0C-CD-01-00-03")
    ws.upload("site.scd", scl(a, b, c, gses=[ga, gb, gc]))
    result = ws.analyze()
    collided = {e["publisher"]: e["network_details"]["flags"]["appid_collision"] for e in result["edges"]}
    assert collided == {"A": True, "B": True, "C": False}
    assert sorted(e["ied_name"] for e in result["errors"] if e["rule_type"] == "APPID_COLLISION") == ["A", "B"]


def test_duplicate_mac(ws):
    two_publishers(ws, {"appid": "0001", "mac": "01-0C-CD-01-00-05"}, {"appid": "0002", "mac": "01:0c:cd:01:00:05"})
    assert ws.rules().count("MULTICAST_MAC_DUPLICATE") == 2


@pytest.mark.parametrize("kwargs, rule", [
    ({"appid": "12"}, "APPID_FORMAT"),
    ({"appid": "4000"}, "APPID_RANGE"),
    ({"appid": "0000"}, "APPID_UNCONFIGURED"),
    ({"mac": "01-0C-CD-01-00"}, "MAC_FORMAT"),
    ({"mac": "00-0C-CD-01-00-01"}, "MAC_NOT_MULTICAST"),
    ({"mac": "00-00-00-00-00-00"}, "MAC_UNCONFIGURED"),
    ({"mac": "01-0C-CD-04-00-01"}, "MAC_OUTSIDE_RECOMMENDED_RANGE"),
    ({"vlan": "10"}, "VLAN_ID_FORMAT"),
    ({"prio": "8"}, "VLAN_PRIORITY_FORMAT"),
    ({"conf_rev": "0"}, "CONF_REV_ZERO"),
])
def test_address_and_revision_rules(ws, kwargs, rule):
    pub_ied, pub_gse = publisher(**kwargs)
    ws.upload("site.scd", scl(pub_ied, subscriber(), gses=[pub_gse]))
    assert rule in ws.rules()


@pytest.mark.parametrize("kwargs", [{"appid": "8001"}, {"vlan": "00A"}, {"appid": "3FFF"}])
def test_valid_edge_values_are_accepted(ws, kwargs):
    pub_ied, pub_gse = publisher(**kwargs)
    ws.upload("site.scd", scl(pub_ied, subscriber(), gses=[pub_gse]))
    assert ws.rules() == []


def test_missing_gse_address_and_timing(ws):
    pub = ied("PUB", {"CFG": {"datasets": {"DS1": PUB_DATASET}, "gcbs": [gcb("GCB1"), gcb("GCB2")]}})
    ws.upload("site.scd", scl(pub, subscriber(), gses=[gse("PUB", "CFG", "GCB2", appid="0002", mac="01-0C-CD-01-00-02", min_time="1000", max_time="4")]))
    rules = ws.rules()
    assert "MISSING_GSE_ADDRESS" in rules and "GOOSE_TIMING" in rules


def test_iedname_destination_rules(ws):
    pub_ied, pub_gse = publisher(dests=["OTHER"])
    ws.upload("site.scd", scl(pub_ied, subscriber(), ied("OTHER", {}), gses=[pub_gse]))
    assert ws.rules() == ["DESTINATION_WITHOUT_INPUTS", "IEDNAME_NOT_LISTED"]


def test_analysis_is_deterministic(ws):
    pub_ied, pub_gse = publisher()
    ws.upload("site.scd", scl(pub_ied, subscriber(src_ld=None), gses=[pub_gse]))
    assert ws.analyze() == ws.analyze()


# --- Real sample files (local only; uploaded_files/ is gitignored) ---------------------

SAMPLES = Path(__file__).resolve().parent.parent / "uploaded_files"


@pytest.mark.skipif(not (SAMPLES / "SELpublishOC.scd").exists() or not (SAMPLES / "P5F30OCdevice.cid").exists(),
                    reason="sample SCL files not present")
def test_sel_and_schneider_samples(ws):
    for name in ["SELpublishOC.scd", "P5F30OCdevice.cid"]:
        ws.upload(name, (SAMPLES / name).read_text(encoding="utf-8-sig"))
    result = ws.analyze()
    [edge] = edges_between(result, "SEL_751OC", "P5F30OCdevice")
    assert edge["app_id"] == "FaultOC" and edge["network_details"]["appid"] == "0003"
    assert (edge["color_state"], edge["status"]) == ("GREEN", "SRC_LDINST_DEFAULT_MISMATCH")
    assert ws.rules() == ["APPID_UNCONFIGURED", "ORPHANED_STREAM", "ORPHANED_STREAM", "SRC_LDINST_DEFAULT_MISMATCH"]
    schneider = next(n for n in result["nodes"] if n["name"] == "P5F30OCdevice")
    assert [u["cb_name"] for u in schneider["unused_cbs"]] == ["gcb2", "gcb3", "gcb4"]
