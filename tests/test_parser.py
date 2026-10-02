import pytest

from app.parser import parse_scl, SCLParseError
from tests.conftest import scl, ied, gcb, gse, extref, fcda


def write(tmp_path, xml, name="f.scd"):
    path = tmp_path / name
    path.write_text(xml, encoding="utf-8")
    return str(path)


def test_appid_comes_from_gse_address_not_gsecontrol_appid(tmp_path):
    xml = scl(ied("P", {"LD": {"datasets": {"DS1": [fcda("LD", "GGIO", "1", "Ind1")]},
                               "gcbs": [gcb("G1", app_id="P/LLN0.G1")]}}),
              gses=[gse("P", "LD", "G1", appid="3001")])
    parsed = parse_scl(write(tmp_path, xml))
    row = parsed.gse_controls[0]
    assert row[6] == "P/LLN0.G1"   # go_id
    assert row[9] == "3001"        # appid from Communication/GSE


def test_block_without_gse_address_has_no_appid(tmp_path):
    xml = scl(ied("P", {"LD": {"gcbs": [gcb("G1", datset=None, app_id="P/LLN0.G1")]}}))
    row = parse_scl(write(tmp_path, xml)).gse_controls[0]
    assert row[7] == 0 and row[9] is None
    assert row[4] is None  # no dataset -> unused block


def test_vendor_namespaced_address_copy_is_ignored(tmp_path):
    vendor_copy = ('<Private type="SEL_GOOSETXAddress"><esel:Address><esel:P type="APPID">9999</esel:P>'
                   '</esel:Address></Private>')
    xml = scl(ied("P", {"LD": {"datasets": {"DS1": [fcda("LD", "GGIO", "1", "Ind1")]},
                               "gcbs": [gcb("G1", inner=vendor_copy)]}}),
              gses=[gse("P", "LD", "G1", appid="0003")],
              extra_ns='xmlns:esel="http://www.selinc.com/2006/61850"')
    parsed = parse_scl(write(tmp_path, xml))
    assert parsed.gse_controls[0][9] == "0003"


def test_unbound_templates_and_report_inputs_are_skipped(tmp_path):
    refs = [
        {"intAddr": "NI2", "serviceType": "GOOSE"},                                     # template, no iedName
        extref("P", "LD", "GGIO", "1", "Ind1", service="Report"),                       # report input
        extref("P", "LD", "GGIO", "1", "Ind1", src_cb="G1"),                            # real GOOSE input
    ]
    xml = scl(ied("S", {}, extrefs=refs))
    parsed = parse_scl(write(tmp_path, xml))
    assert len(parsed.extrefs) == 1
    assert parsed.extrefs[0][0:2] == ("S", "P")


def test_sel_style_goose_subscription_is_collected_with_all_fields(tmp_path):
    vendor = ('<Private type="X"><v:GooseSubscription iedName="P" ldInst="LD" cbName="G1" datSet="DS1" appId="P/LD/LLN0/G1" '
              'confRev="7" mAddr="01-0C-CD-01-00-05" APPID="0005" VLAN-ID="003" VLAN-PRIORITY="4"/></Private>')
    xml = scl(ied("S", {}, vendor_xml=vendor), extra_ns='xmlns:v="urn:vendor"')
    parsed = parse_scl(write(tmp_path, xml))
    # APPID is the Ethernet APPID, appId is the GoID
    assert parsed.vendor_subscriptions == [("S", "P", "LD", "G1", "7", "0005", "01-0C-CD-01-00-05", "003", "4", "DS1",
                                            "P/LD/LLN0/G1", "GooseSubscription")]


def test_schneider_style_extref_record_is_collected_with_all_fields(tmp_path):
    # Mirrors Schneider's Private next to each ExtRef: appID is the Ethernet APPID, goID the GoID,
    # ldName the control block's LD (ldInst is the signal's LD). Identical per-signal copies collapse to one row.
    record = ('<Private type="X" iedName="SEL_751OC" srcCBName="FaultOC" ldName="CFG" ldInst="PRO" confRev="1" appID="0003" '
              'MAC-Address="01-0C-CD-01-00-03" goID="SEL_751OC" dsName="OCselectivity" doName="{do}"/>')
    vendor = record.format(do="Str") + record.format(do="Str")
    xml = scl(ied("S", {}, vendor_xml=vendor, extrefs=[extref("SEL_751OC", "PRO", "PIOC", "1", "Str", src_cb="FaultOC")]))
    parsed = parse_scl(write(tmp_path, xml))
    assert parsed.vendor_subscriptions == [("S", "SEL_751OC", "CFG", "FaultOC", "1", "0003", "01-0C-CD-01-00-03", None, None,
                                            "OCselectivity", "SEL_751OC", "subscription record")]


@pytest.mark.parametrize("content, message", [
    ("this is not xml", "Not a readable XML file"),
    ('<?xml version="1.0"?><Foo/>', "expected <SCL>"),
    (scl(), "No <IED> elements"),
    (scl(ied("A", {}), ied("A", {})), "duplicated: A"),
])
def test_invalid_files_raise_clear_errors(tmp_path, content, message):
    with pytest.raises(SCLParseError, match=message):
        parse_scl(write(tmp_path, content))
