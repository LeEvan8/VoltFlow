"""Helpers for building minimal SCL files and running them through parser + analysis."""
import pytest

from app import database
from app.analysis import analyze
from app.parser import parse_scl, store_parsed

SCL_NS = "http://www.iec.ch/61850/2003/SCL"


def _attrs(d):
    return " ".join(f'{k}="{v}"' for k, v in d.items() if v is not None)


def fcda(ld, ln_class, ln_inst, do, da=None, prefix="", fc="ST"):
    return {"ldInst": ld, "prefix": prefix, "lnClass": ln_class, "lnInst": ln_inst, "doName": do, "daName": da, "fc": fc}


def gcb(name, datset="DS1", conf_rev="1", app_id=None, dests=(), **extra):
    return {"name": name, "datSet": datset, "confRev": conf_rev, "appID": app_id or f"GoID_{name}", "dests": list(dests), **extra}


def ied(name, lds, extrefs=(), vendor_xml="", extra_ld_xml=""):
    """lds: {ld_inst: {"datasets": {ds_name: [fcda...]}, "gcbs": [gcb...]}}; extrefs: list of ExtRef attr dicts."""
    ld_xml = []
    for ld_inst, ld in lds.items():
        datasets = "".join(
            f'<DataSet name="{ds}">' + "".join(f"<FCDA {_attrs(f)}/>" for f in members) + "</DataSet>"
            for ds, members in ld.get("datasets", {}).items()
        )
        gcbs = ""
        for g in ld.get("gcbs", []):
            dests = "".join(f"<IEDName>{d}</IEDName>" for d in g["dests"])
            inner = dests + g.get("inner", "")
            gcbs += f'<GSEControl {_attrs({k: v for k, v in g.items() if k not in ("dests", "inner")})}>{inner}</GSEControl>'
        ld_name = f' ldName="{ld["ld_name"]}"' if ld.get("ld_name") else ""
        ld_xml.append(f'<LDevice inst="{ld_inst}"{ld_name}><LN0 lnClass="LLN0" inst="" lnType="T">{datasets}{gcbs}</LN0></LDevice>')
    inputs = ""
    if extrefs:
        inputs = '<LN lnClass="GGIO" inst="1" lnType="T"><Inputs>' + "".join(f"<ExtRef {_attrs(e)}/>" for e in extrefs) + "</Inputs></LN>"
        ld_xml.append(f'<LDevice inst="SUB">{inputs}</LDevice>')
    return (f'<IED name="{name}" type="Relay" manufacturer="Test">{vendor_xml}<AccessPoint name="AP1"><Server>'
            f'<Authentication/>{"".join(ld_xml)}{extra_ld_xml}</Server></AccessPoint></IED>')


def gse(ied_name, ld, cb, appid="0001", mac="01-0C-CD-01-00-01", vlan="000", prio="4", min_time="4", max_time="1000"):
    params = [("MAC-Address", mac), ("APPID", appid), ("VLAN-ID", vlan), ("VLAN-PRIORITY", prio)]
    ps = "".join(f'<P type="{t}">{v}</P>' for t, v in params if v is not None)
    times = (f'<MinTime unit="s" multiplier="m">{min_time}</MinTime>' if min_time else "") + \
            (f'<MaxTime unit="s" multiplier="m">{max_time}</MaxTime>' if max_time else "")
    return (ied_name, f'<GSE ldInst="{ld}" cbName="{cb}"><Address>{ps}</Address>{times}</GSE>')


def scl(*ieds, gses=(), extra_ns="", templates="", aps=(), subnets=None):
    """gses: GSE addresses per IED; aps: IEDs that get a ConnectedAP without GSE; subnets: {ied: SubNetwork name} (default N1)."""
    by_ied = {}
    for ied_name, xml in gses:
        by_ied.setdefault(ied_name, []).append(xml)
    for ied_name in aps:
        by_ied.setdefault(ied_name, [])
    by_subnet = {}
    for n, x in by_ied.items():
        by_subnet.setdefault((subnets or {}).get(n, "N1"), []).append(f'<ConnectedAP iedName="{n}" apName="AP1">{"".join(x)}</ConnectedAP>')
    comm = ("<Communication>" + "".join(f'<SubNetwork name="{sn}">{"".join(c)}</SubNetwork>' for sn, c in by_subnet.items())
            + "</Communication>") if by_subnet else ""
    return (f'<?xml version="1.0" encoding="utf-8"?><SCL xmlns="{SCL_NS}" {extra_ns} version="2007" revision="B"><Header id="t"/>'
            f'{comm}{"".join(ieds)}{templates}</SCL>')


def extref(pub, ld, ln_class, ln_inst, do, da=None, prefix="", src_cb=None, src_ld=None, service="GOOSE", int_addr="in1", **extra):
    return {"iedName": pub, "ldInst": ld, "prefix": prefix, "lnClass": ln_class, "lnInst": ln_inst, "doName": do,
            "daName": da, "serviceType": service, "srcLDInst": src_ld, "srcCBName": src_cb, "intAddr": int_addr, **extra}


class Workspace:
    def __init__(self, tmp_path):
        self.tmp_path = tmp_path

    def upload(self, name, xml):
        path = self.tmp_path / name
        path.write_text(xml, encoding="utf-8")
        parsed = parse_scl(str(path))
        conn = database.get_db_connection()
        try:
            store_parsed(conn, name, parsed)
            conn.commit()
        finally:
            conn.close()
        return parsed

    def analyze(self):
        conn = database.get_db_connection()
        try:
            return analyze(conn)
        finally:
            conn.close()

    def rules(self):
        return sorted(e["rule_type"] for e in self.analyze()["errors"])


@pytest.fixture
def ws(tmp_path, monkeypatch):
    monkeypatch.setattr(database, "DB_PATH", str(tmp_path / "test.db"))
    database.init_db()
    return Workspace(tmp_path)


# A publisher PUB with one GOOSE block GCB1 in LD "CFG" publishing PRO/PTOC1.Op.general + q.
PUB_DATASET = [fcda("PRO", "PTOC", "1", "Op", "general"), fcda("PRO", "PTOC", "1", "Op", "q")]


def publisher(name="PUB", cb="GCB1", conf_rev="1", appid="0001", mac="01-0C-CD-01-00-01", dests=(), vlan="000", prio="4",
              dataset_members=PUB_DATASET, dataset_name="DS1", typed=False, datset=None):
    """typed=True adds LD PRO with a PTOC1 LN (lnType PTOC_T), so members resolve against templates()."""
    lds = {"CFG": {"datasets": {dataset_name: dataset_members},
                   "gcbs": [gcb(cb, datset=datset or dataset_name, conf_rev=conf_rev, dests=dests)]}}
    extra = '<LDevice inst="PRO"><LN0 lnClass="LLN0" inst="" lnType="LLN0_T"/><LN lnClass="PTOC" inst="1" prefix="" lnType="PTOC_T"/></LDevice>'
    return ied(name, lds, extra_ld_xml=extra if typed else ""), gse(name, "CFG", cb, appid=appid, mac=mac, vlan=vlan, prio=prio)


def templates(general_btype="BOOLEAN"):
    """PTOC_T.Op (ACT): general (ST), q (ST), t (ST), plus a struct DA and an SDO for resolution tests."""
    return ('<DataTypeTemplates>'
            '<LNodeType id="LLN0_T" lnClass="LLN0"/>'
            '<LNodeType id="PTOC_T" lnClass="PTOC"><DO name="Op" type="ACT_T"/><DO name="Str" type="ACD_T"/></LNodeType>'
            f'<DOType id="ACT_T" cdc="ACT"><DA name="general" fc="ST" bType="{general_btype}"/>'
            '<DA name="q" fc="ST" bType="Quality"/><DA name="t" fc="ST" bType="Timestamp"/>'
            '<DA name="cfg" fc="CF" bType="Struct" type="Cfg_T"/><SDO name="sub" type="SUB_T"/></DOType>'
            '<DOType id="SUB_T" cdc="SPS"><DA name="stVal" fc="ST" bType="BOOLEAN"/></DOType>'
            '<DOType id="ACD_T" cdc="ACD"><DA name="general" fc="ST" bType="BOOLEAN"/></DOType>'
            '<DAType id="Cfg_T"><BDA name="lo" bType="INT32"/><BDA name="hi" bType="FLOAT32"/></DAType>'
            '</DataTypeTemplates>')


def subscriber(name="SUB", pub="PUB", **extref_kwargs):
    kwargs = {"src_cb": "GCB1", "src_ld": "CFG", **extref_kwargs}
    return ied(name, {}, extrefs=[
        extref(pub, "PRO", "PTOC", "1", "Op", "general", **kwargs),
        extref(pub, "PRO", "PTOC", "1", "Op", "q", int_addr="in2", **kwargs),
    ])
