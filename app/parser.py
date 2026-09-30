import json
import re
from dataclasses import dataclass, field
from lxml import etree

from app.database import DATA_TABLES


class SCLParseError(Exception):
    pass


@dataclass
class ParsedSCL:
    ieds: list = field(default_factory=list)
    gse_controls: list = field(default_factory=list)
    gse_destinations: list = field(default_factory=list)
    dataset_members: list = field(default_factory=list)
    extrefs: list = field(default_factory=list)
    vendor_subscriptions: list = field(default_factory=list)
    vendor_signal_types: list = field(default_factory=list)
    connected_aps: list = field(default_factory=list)


def _localname(elem):
    return etree.QName(elem).localname


def _owning_ied(elem, single_ied):
    """Name of the IED an element sits in; falls back to the file's only IED."""
    for ancestor in elem.iterancestors():
        if _localname(ancestor) == "IED":
            return ancestor.get("name")
    return single_ied


def _single_ied_name(root):
    ieds = [e for e in root.iter() if isinstance(e.tag, str) and _localname(e) == "IED"]
    return ieds[0].get("name") if len(ieds) == 1 else None


def _attr(elem, *names):
    """First non-empty attribute among names (exact, case-sensitive match), stripped."""
    for name in names:
        value = elem.get(name)
        if value and value.strip():
            return value.strip()
    return None


def _collect_vendor_subscriptions(root):
    """Subscriber-side expectations written by vendor tools. Standard ExtRefs carry none of these values,
    so these records are the only place a subscriber declares what it filters on.

    Row: (sub_ied, pub_ied, ld_inst, cb_name, conf_rev, appid, mac, vlan_id, vlan_priority, dataset, go_id, record_type)

    - GooseSubscription (e.g. SEL <esel:GooseSubscription>): one per subscribed control block.
      APPID = Ethernet APPID, appId = GoID, mAddr = destination MAC, ldInst = LD of the control block.
    - ExtRef companion records (e.g. Schneider <Private iedName srcCBName .../> next to each ExtRef):
      appID = Ethernet APPID, goID = GoID, MAC-Address, dsName, ldName = LD of the control block
      (their ldInst is the LD of the signal, not of the control block).
    """
    single_ied = _single_ied_name(root)
    found = set()
    for elem in root.iter():
        if not isinstance(elem.tag, str) or _localname(elem) in ("ExtRef", "IED", "GSEControl"):
            continue
        pub_ied = _attr(elem, "iedName")
        if not pub_ied:
            continue
        if _localname(elem) == "GooseSubscription":
            cb_name = _attr(elem, "cbName")
            row = (_attr(elem, "ldInst"), cb_name, _attr(elem, "confRev"), _attr(elem, "APPID"),
                   _attr(elem, "mAddr", "MAC-Address"), _attr(elem, "VLAN-ID"), _attr(elem, "VLAN-PRIORITY"),
                   _attr(elem, "datSet"), _attr(elem, "appId", "goID"), "GooseSubscription")
        elif _attr(elem, "srcCBName"):
            cb_name = _attr(elem, "srcCBName")
            row = (_attr(elem, "ldName"), cb_name, _attr(elem, "confRev"), _attr(elem, "appID"),
                   _attr(elem, "MAC-Address"), _attr(elem, "VLAN-ID"), _attr(elem, "VLAN-PRIORITY"),
                   _attr(elem, "dsName"), _attr(elem, "goID"), "subscription record")
        else:
            continue
        sub_ied = _owning_ied(elem, single_ied)
        if sub_ied and cb_name:
            found.add((sub_ied, pub_ied, *row))
    return sorted(found, key=lambda r: tuple(v or "" for v in r))


def _collect_vendor_signal_types(root):
    """Per-signal expected types from ExtRef companion records (e.g. Schneider's Private with bType).

    Row: (sub_ied, pub_ied, cb_name, cb_ld, sig_ld, prefix, ln_class, ln_inst, do_name, da_name, b_type)
    cb_ld is the control block's LD (ldName); sig_ld is the LD of the signal itself (ldInst)."""
    single_ied = _single_ied_name(root)
    found = set()
    for elem in root.iter():
        if not isinstance(elem.tag, str) or _localname(elem) in ("ExtRef", "IED", "GSEControl", "GooseSubscription"):
            continue
        pub_ied, cb_name, b_type, do_name = _attr(elem, "iedName"), _attr(elem, "srcCBName"), _attr(elem, "bType"), _attr(elem, "doName")
        if not (pub_ied and cb_name and b_type and do_name):
            continue
        sub_ied = _owning_ied(elem, single_ied)
        if sub_ied:
            found.add((sub_ied, pub_ied, cb_name, _attr(elem, "ldName"), _attr(elem, "ldInst"), _attr(elem, "prefix") or "",
                       _attr(elem, "lnClass"), _attr(elem, "lnInst") or "", do_name, _attr(elem, "daName"), b_type))
    return sorted(found, key=lambda r: tuple(v or "" for v in r))


def _normalize_to_scl_namespace(root):
    """Drop vendor-namespaced elements/attributes (e.g. SEL's esel:Address copies inside Private),
    then strip the SCL namespace so plain tag names can be used."""
    scl_ns = etree.QName(root).namespace
    for elem in list(root.iter()):
        if not isinstance(elem.tag, str):
            parent = elem.getparent()
            if parent is not None:
                parent.remove(elem)
            continue
        if etree.QName(elem).namespace != scl_ns:
            parent = elem.getparent()
            if parent is not None:
                parent.remove(elem)
    for elem in root.iter():
        elem.tag = _localname(elem)
        for attr_name in list(elem.attrib):
            if etree.QName(attr_name).namespace is not None:
                del elem.attrib[attr_name]
    return root


def _text(elem):
    return elem.text.strip() if elem is not None and elem.text and elem.text.strip() else None


def _index_gse_addresses(root):
    """(iedName, ldInst, cbName) -> (GSE element, SubNetwork name, ConnectedAP apName)."""
    index = {}
    for cap in root.iter("ConnectedAP"):
        ied_name = cap.get("iedName")
        subnet = cap.getparent().get("name") if cap.getparent() is not None else None
        for gse in cap.findall("GSE"):
            index.setdefault((ied_name, gse.get("ldInst", ""), gse.get("cbName", "")), (gse, subnet, cap.get("apName")))
    return index


# ---------------------------------------------------------------------------
# DataTypeTemplates: resolve data set members to their leaf attribute types
# ---------------------------------------------------------------------------
_ARRAY_INDEX = re.compile(r"\(\d+\)$")
_MAX_TYPE_DEPTH = 12  # guards against malformed, self-referencing templates


def _type_index(root):
    """LNodeType/DOType/DAType lookups, children kept in document order (the order defines the payload)."""
    templates = root.find("DataTypeTemplates")
    lnodetypes, dotypes, datypes = {}, {}, {}
    if templates is None:
        return lnodetypes, dotypes, datypes
    for lnt in templates.findall("LNodeType"):
        lnodetypes[lnt.get("id")] = {do.get("name"): do.get("type") for do in lnt.findall("DO")}
    for dot in templates.findall("DOType"):
        children = []
        for child in dot:
            if child.tag == "DA":
                children.append(("DA", child.get("name"), child.get("fc"), child.get("bType"), child.get("type")))
            elif child.tag == "SDO":
                children.append(("SDO", child.get("name"), None, None, child.get("type")))
        dotypes[dot.get("id")] = children
    for dat in templates.findall("DAType"):
        datypes[dat.get("id")] = [(bda.get("name"), bda.get("bType"), bda.get("type")) for bda in dat.findall("BDA")]
    return lnodetypes, dotypes, datypes


def _ln_types(ied):
    """(ldInst, prefix, lnClass, lnInst) -> lnType for every LN0/LN of an IED."""
    types = {}
    for ldevice in ied.iter("LDevice"):
        ld_inst = ldevice.get("inst", "")
        for ln in ldevice:
            if ln.tag == "LN0":
                types[(ld_inst, "", "LLN0", "")] = ln.get("lnType")
            elif ln.tag == "LN":
                types[(ld_inst, ln.get("prefix", "") or "", ln.get("lnClass"), ln.get("inst", "") or "")] = ln.get("lnType")
    return types


def _expand_da(path, btype, type_id, datypes, depth):
    """Leaf (path, bType) pairs of an attribute; Struct attributes expand into their BDAs."""
    if btype == "Struct" and type_id in datypes and depth < _MAX_TYPE_DEPTH:
        leaves = []
        for name, child_btype, child_type in datypes[type_id]:
            leaves += _expand_da(f"{path}.{name}", child_btype, child_type, datypes, depth + 1)
        return leaves
    return [(path, btype or "?")]


def _expand_do(path, type_id, fc, dotypes, datypes, depth):
    """Leaves of a data object restricted to one functional constraint, SDOs included."""
    leaves = []
    if type_id not in dotypes or depth >= _MAX_TYPE_DEPTH:
        return leaves
    for kind, name, child_fc, btype, child_type in dotypes[type_id]:
        if kind == "DA" and child_fc == fc:
            leaves += _expand_da(f"{path}.{name}", btype, child_type, datypes, depth + 1)
        elif kind == "SDO":
            leaves += _expand_do(f"{path}.{name}", child_type, fc, dotypes, datypes, depth + 1)
    return leaves


def resolve_leaf_types(types, ln_types, ld_inst, prefix, ln_class, ln_inst, do_name, da_name, fc):
    """Leaf attribute types of one FCDA/signal, e.g. [("Op.general", "BOOLEAN"), ("Op.q", "Quality")].
    Returns None when the templates don't allow a full resolution (unknown, never compared)."""
    lnodetypes, dotypes, datypes = types
    ln_type = ln_types.get((ld_inst or "", prefix or "", ln_class, ln_inst or ""))
    if not ln_type or ln_type not in lnodetypes or not do_name:
        return None
    do_parts = do_name.split(".")
    type_id = lnodetypes[ln_type].get(_ARRAY_INDEX.sub("", do_parts[0]))
    for part in do_parts[1:]:
        child = next((c for c in dotypes.get(type_id, []) if c[0] == "SDO" and c[1] == _ARRAY_INDEX.sub("", part)), None)
        if child is None:
            return None
        type_id = child[4]
    if type_id not in dotypes:
        return None
    if not da_name:
        return _expand_do(do_name, type_id, fc, dotypes, datypes, 0) or None
    da_parts = da_name.split(".")
    child = next((c for c in dotypes[type_id] if c[0] == "DA" and c[1] == _ARRAY_INDEX.sub("", da_parts[0])), None)
    if child is None:
        return None
    btype, attr_type = child[3], child[4]
    for part in da_parts[1:]:
        bda = next((b for b in datypes.get(attr_type, []) if b[0] == _ARRAY_INDEX.sub("", part)), None)
        if bda is None:
            return None
        btype, attr_type = bda[1], bda[2]
    return _expand_da(f"{do_name}.{da_name}", btype, attr_type, datypes, 0)


def _read_gse_address(gse):
    values = {"MAC-Address": None, "APPID": None, "VLAN-ID": None, "VLAN-PRIORITY": None}
    address = gse.find("Address")
    if address is not None:
        for p in address.findall("P"):
            if p.get("type") in values:
                values[p.get("type")] = _text(p)
    return values, _text(gse.find("MinTime")), _text(gse.find("MaxTime"))


def parse_scl(file_path: str) -> ParsedSCL:
    try:
        parser = etree.XMLParser(remove_blank_text=True, resolve_entities=False, no_network=True, huge_tree=False)
        root = etree.parse(file_path, parser=parser).getroot()
    except etree.XMLSyntaxError as e:
        # e.msg already carries line/column; str(e) would also embed the server-side file path.
        raise SCLParseError(f"Not a readable XML file: {e.msg}") from e
    except OSError as e:
        raise SCLParseError(f"Could not read the file: {e.strerror}") from e

    if _localname(root) != "SCL":
        raise SCLParseError(f"Root element is <{_localname(root)}>, expected <SCL>.")

    result = ParsedSCL()
    result.vendor_subscriptions = _collect_vendor_subscriptions(root)
    result.vendor_signal_types = _collect_vendor_signal_types(root)
    root = _normalize_to_scl_namespace(root)
    gse_index = _index_gse_addresses(root)
    types = _type_index(root)
    for cap in root.iter("ConnectedAP"):
        if cap.get("iedName"):
            subnet = cap.getparent().get("name") if cap.getparent() is not None else None
            result.connected_aps.append((cap.get("iedName"), cap.get("apName"), subnet))

    for ied in root.findall("IED"):
        ied_name = ied.get("name")
        if not ied_name:
            continue
        result.ieds.append((ied_name, ied.get("type"), ied.get("manufacturer")))
        ln_types = _ln_types(ied)

        for ldevice in ied.iter("LDevice"):
            ld_inst = ldevice.get("inst", "")
            ln0 = ldevice.find("LN0")
            if ln0 is None:
                continue
            datasets = {ds.get("name"): ds for ds in ln0.findall("DataSet")}

            # GSE control blocks are only allowed in LLN0 (IEC 61850-6 9.3.10).
            for gcb in ln0.findall("GSEControl"):
                cb_name = gcb.get("name", "")
                dataset = gcb.get("datSet") or None
                gse, subnet, ap_name = gse_index.get((ied_name, ld_inst, cb_name), (None, None, None))
                addr, min_time, max_time = _read_gse_address(gse) if gse is not None else ({}, None, None)

                result.gse_controls.append((
                    ied_name, ld_inst, cb_name, gcb.get("type", "GOOSE"), dataset,
                    gcb.get("confRev"), gcb.get("appID"),  # appID is the GoID, not the Ethernet APPID
                    1 if gse is not None else 0,
                    addr.get("MAC-Address"), addr.get("APPID"), addr.get("VLAN-ID"), addr.get("VLAN-PRIORITY"),
                    min_time, max_time,
                    1 if dataset in datasets else 0, subnet, ap_name,
                ))
                for dest in gcb.findall("IEDName"):
                    if _text(dest):
                        result.gse_destinations.append((ied_name, ld_inst, cb_name, _text(dest)))
                if dataset and dataset in datasets:
                    for fcda in datasets[dataset].findall("FCDA"):
                        leaves = resolve_leaf_types(types, ln_types, fcda.get("ldInst") or ld_inst, fcda.get("prefix", ""),
                                                    fcda.get("lnClass"), fcda.get("lnInst", ""), fcda.get("doName"),
                                                    fcda.get("daName"), fcda.get("fc"))
                        result.dataset_members.append((
                            ied_name, ld_inst, dataset,
                            fcda.get("ldInst"), fcda.get("prefix", ""), fcda.get("lnClass"), fcda.get("lnInst", ""),
                            fcda.get("doName"), fcda.get("daName"), fcda.get("fc"),
                            json.dumps(leaves) if leaves else None,  # None = types unknown, never compared
                        ))

        for extref in ied.iter("ExtRef"):
            pub_ied = extref.get("iedName")
            if not pub_ied:
                continue  # unbound input template (only intAddr / pXX attributes)
            if pub_ied == "@":
                pub_ied = ied_name  # IED-internal reference
            service_type = extref.get("serviceType")
            if service_type not in (None, "GOOSE"):
                continue  # Report / Poll / SMV inputs are not GOOSE subscriptions
            result.extrefs.append((
                ied_name, pub_ied,
                extref.get("ldInst"), extref.get("prefix", ""), extref.get("lnClass"), extref.get("lnInst", ""),
                extref.get("doName"), extref.get("daName"), service_type,
                extref.get("srcLDInst"), extref.get("srcCBName"), extref.get("pServT"),
            ))

    if not result.ieds:
        raise SCLParseError("No <IED> elements found in the file.")
    names = [ied[0] for ied in result.ieds]
    duplicates = sorted({n for n in names if names.count(n) > 1})
    if duplicates:
        raise SCLParseError(f"IED names must be unique within a file; duplicated: {', '.join(duplicates)}.")
    return result


def store_parsed(conn, filename: str, parsed: ParsedSCL):
    """Replace everything previously stored from this file and mark it as the latest upload."""
    for table in DATA_TABLES:
        conn.execute(f"DELETE FROM {table} WHERE source_file = ?", (filename,))
    next_seq = conn.execute("SELECT COALESCE(MAX(seq), 0) + 1 FROM files").fetchone()[0]
    conn.execute("INSERT OR REPLACE INTO files (name, seq) VALUES (?, ?)", (filename, next_seq))

    def insert(table, rows):
        if rows:
            marks = ",".join("?" * (len(rows[0]) + 1))
            conn.executemany(f"INSERT INTO {table} VALUES ({marks})", [(filename, *row) for row in rows])

    insert("ieds", parsed.ieds)
    insert("gse_controls", parsed.gse_controls)
    insert("gse_destinations", parsed.gse_destinations)
    insert("dataset_members", parsed.dataset_members)
    insert("extrefs", parsed.extrefs)
    insert("vendor_subscriptions", parsed.vendor_subscriptions)
    insert("vendor_signal_types", parsed.vendor_signal_types)
    insert("connected_aps", parsed.connected_aps)
