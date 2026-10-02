"""Phase 4 rules: DATASET_NOT_FOUND, CONFREV_NOT_INCREMENTED, signal type checks (FATAL_TYPE_MISMATCH),
SUBNETWORK_MISMATCH and SERVICE_TYPE_MISMATCH, plus DataTypeTemplates resolution."""
import pytest

from app.parser import parse_scl, resolve_leaf_types, _type_index, _ln_types, _normalize_to_scl_namespace
from lxml import etree
from tests.conftest import scl, ied, gse, fcda, extref, publisher, subscriber, templates, PUB_DATASET


def edge_of(result, pub="PUB", sub="SUB"):
    [edge] = [e for e in result["edges"] if e["publisher"] == pub and e["subscriber"] == sub and not e["is_orphan_stub"]]
    return edge


def findings(result, rule):
    return [e for e in result["errors"] if e["rule_type"] == rule]


# --- DataTypeTemplates resolution -------------------------------------------------------------

def resolve(do, da, fc="ST", ln_class="PTOC"):
    root = etree.fromstring(scl(publisher(typed=True)[0], templates=templates()).encode())
    root = _normalize_to_scl_namespace(root)
    ied_elem = root.find("IED")
    return resolve_leaf_types(_type_index(root), _ln_types(ied_elem), "PRO", "", ln_class, "1", do, da, fc)


def test_resolves_attribute_level_member():
    assert resolve("Op", "general") == [("Op.general", "BOOLEAN")]


def test_expands_object_level_member_by_functional_constraint_including_sdos():
    assert resolve("Op", None, fc="ST") == [("Op.general", "BOOLEAN"), ("Op.q", "Quality"), ("Op.t", "Timestamp"), ("Op.sub.stVal", "BOOLEAN")]


def test_expands_struct_attributes_and_walks_sdo_paths():
    assert resolve("Op", "cfg", fc="CF") == [("Op.cfg.lo", "INT32"), ("Op.cfg.hi", "FLOAT32")]
    assert resolve("Op", "cfg.hi", fc="CF") == [("Op.cfg.hi", "FLOAT32")]
    assert resolve("Op.sub", "stVal") == [("Op.sub.stVal", "BOOLEAN")]


@pytest.mark.parametrize("do, da, ln_class", [("Nope", "general", "PTOC"), ("Op", "nope", "PTOC"), ("Op", "general", "XCBR")])
def test_unresolvable_references_are_unknown_not_wrong(do, da, ln_class):
    assert resolve(do, da, ln_class=ln_class) is None


def test_member_types_are_stored_and_unknown_without_templates(tmp_path):
    path = tmp_path / "a.scd"
    path.write_text(scl(publisher(typed=True)[0], templates=templates()), encoding="utf-8")
    assert [m[10] for m in parse_scl(str(path)).dataset_members] == ['[["Op.general", "BOOLEAN"]]', '[["Op.q", "Quality"]]']
    path.write_text(scl(publisher()[0]), encoding="utf-8")
    assert [m[10] for m in parse_scl(str(path)).dataset_members] == [None, None]


# --- DATASET_NOT_FOUND ------------------------------------------------------------------------------

def test_dataset_reference_that_does_not_exist(ws):
    pub_ied, pub_gse = publisher(datset="MISSING")
    ws.upload("site.scd", scl(pub_ied, subscriber(), gses=[pub_gse]))
    result = ws.analyze()
    [finding] = findings(result, "DATASET_NOT_FOUND")
    assert finding["severity"] == "ERROR" and "'MISSING'" in finding["message"]
    assert edge_of(result)["color_state"] == "RED"


# --- CONFREV_NOT_INCREMENTED -------------------------------------------------------------------------

def test_data_set_changed_without_confrev_increment(ws):
    ws.upload("old.cid", scl(publisher(conf_rev="5")[0], gses=[publisher()[1]]))
    grown = PUB_DATASET + [fcda("PRO", "PTOC", "1", "Str", "general")]
    ws.upload("new.cid", scl(publisher(conf_rev="5", dataset_members=grown)[0], gses=[publisher()[1]]))
    [finding] = findings(ws.analyze(), "CONFREV_NOT_INCREMENTED")
    assert finding["severity"] == "ERROR"
    assert "confRev 5 in both 'old.cid' and 'new.cid'" in finding["message"] and "2 vs 3 entries" in finding["message"]


def test_type_change_without_confrev_increment(ws):
    ws.upload("old.cid", scl(publisher(conf_rev="5", typed=True)[0], gses=[publisher()[1]], templates=templates("BOOLEAN")))
    ws.upload("new.cid", scl(publisher(conf_rev="5", typed=True)[0], gses=[publisher()[1]], templates=templates("INT32")))
    [finding] = findings(ws.analyze(), "CONFREV_NOT_INCREMENTED")
    assert "attribute types changed: Op.general: BOOLEAN → INT32" in finding["message"]


@pytest.mark.parametrize("second_rev, second_members", [("6", PUB_DATASET + [fcda("PRO", "PTOC", "1", "Str", "general")]),  # bumped
                                                        ("5", PUB_DATASET)])                                               # unchanged
def test_no_finding_when_confrev_bumped_or_data_set_unchanged(ws, second_rev, second_members):
    ws.upload("old.cid", scl(publisher(conf_rev="5")[0], gses=[publisher()[1]]))
    ws.upload("new.cid", scl(publisher(conf_rev=second_rev, dataset_members=second_members)[0], gses=[publisher()[1]]))
    assert findings(ws.analyze(), "CONFREV_NOT_INCREMENTED") == []


# --- Signal types (FATAL_TYPE_MISMATCH) ------------------------------------------------------------

def test_type_change_against_subscribers_copy_is_fatal(ws):
    ws.upload("sub.cid", scl(publisher(conf_rev="1", typed=True)[0], subscriber(), gses=[publisher()[1]], templates=templates("BOOLEAN")))
    ws.upload("pub.cid", scl(publisher(conf_rev="2", typed=True)[0], gses=[publisher()[1]], templates=templates("INT32")))
    result = ws.analyze()
    edge = edge_of(result)
    assert (edge["color_state"], edge["status"]) == ("RED", "FATAL_TYPE_MISMATCH")
    assert edge["network_details"]["flags"]["type_mismatch"] is True
    [fatal] = findings(result, "FATAL_TYPE_MISMATCH")
    assert "Op.general: BOOLEAN → INT32 (vs sub.cid)" in fatal["message"]


def test_unknown_types_on_one_side_are_not_compared(ws):
    ws.upload("sub.cid", scl(publisher(conf_rev="1")[0], subscriber(), gses=[publisher()[1]]))  # copy without templates
    ws.upload("pub.cid", scl(publisher(conf_rev="1", typed=True)[0], gses=[publisher()[1]], templates=templates()))
    result = ws.analyze()
    assert findings(result, "FATAL_TYPE_MISMATCH") == [] and findings(result, "CONFREV_NOT_INCREMENTED") == []


def schneider_typed_record(b_type):
    return ('<Private type="X" iedName="PUB" srcCBName="GCB1" ldName="CFG" ldInst="PRO" lnClass="PTOC" lnInst="1" '
            f'doName="Op" daName="general" bType="{b_type}"/>')


@pytest.mark.parametrize("declared, fatal", [("BOOLEAN", False), ("boolean", False), ("INT32", True)])
def test_vendor_declared_signal_type(ws, declared, fatal):
    pub_ied, pub_gse = publisher(typed=True)
    sub = ied("SUB", {}, vendor_xml=schneider_typed_record(declared),
              extrefs=[extref("PUB", "PRO", "PTOC", "1", "Op", "general", src_cb="GCB1", src_ld="CFG")])
    ws.upload("site.scd", scl(pub_ied, sub, gses=[pub_gse], templates=templates("BOOLEAN")))
    result = ws.analyze()
    found = findings(result, "FATAL_TYPE_MISMATCH")
    assert bool(found) is fatal
    if fatal:
        assert "Op.general: publisher sends BOOLEAN, 'SUB' expects INT32 (from Test subscription record)" in found[0]["message"]
        assert edge_of(result)["color_state"] == "RED"


# --- SUBNETWORK_MISMATCH ---------------------------------------------------------------------------

def test_subscriber_on_another_subnetwork_in_the_same_file(ws):
    pub_ied, pub_gse = publisher()
    ws.upload("site.scd", scl(pub_ied, subscriber(), gses=[pub_gse], aps=["SUB"], subnets={"PUB": "StationBus", "SUB": "ProcessBus"}))
    result = ws.analyze()
    [finding] = findings(result, "SUBNETWORK_MISMATCH")
    assert finding["severity"] == "ERROR" and "'StationBus'" in finding["message"] and "'ProcessBus'" in finding["message"]
    assert edge_of(result)["color_state"] == "RED"


def test_same_subnetwork_is_fine(ws):
    pub_ied, pub_gse = publisher()
    ws.upload("site.scd", scl(pub_ied, subscriber(), gses=[pub_gse], aps=["SUB"]))
    assert findings(ws.analyze(), "SUBNETWORK_MISMATCH") == []


def test_subnetwork_names_are_not_compared_across_files(ws):
    # Each tool names its subnetwork differently (e.g. 'W01' vs 'Default_subnet'); that is not a mismatch.
    ws.upload("pub.cid", scl(publisher()[0], gses=[publisher()[1]], subnets={"PUB": "Default_subnet"}))
    ws.upload("sub.cid", scl(subscriber(), aps=["SUB"], subnets={"SUB": "W01"}))
    assert findings(ws.analyze(), "SUBNETWORK_MISMATCH") == []


def test_subscriber_without_communication_section_is_not_judged(ws):
    pub_ied, pub_gse = publisher()
    ws.upload("site.scd", scl(pub_ied, subscriber(), gses=[pub_gse]))  # SUB has no ConnectedAP
    assert findings(ws.analyze(), "SUBNETWORK_MISMATCH") == []


# --- SERVICE_TYPE_MISMATCH --------------------------------------------------------------------------

@pytest.mark.parametrize("p_serv_t, expected", [("Report", True), ("GOOSE", False)])
def test_input_template_service_type(ws, p_serv_t, expected):
    pub_ied, pub_gse = publisher()
    sub = ied("SUB", {}, extrefs=[extref("PUB", "PRO", "PTOC", "1", "Op", "general", src_cb="GCB1", src_ld="CFG", pServT=p_serv_t)])
    ws.upload("site.scd", scl(pub_ied, sub, gses=[pub_gse]))
    found = findings(ws.analyze(), "SERVICE_TYPE_MISMATCH")
    assert bool(found) is expected
    if expected:
        assert "requires service type 'Report' (pServT)" in found[0]["message"]
