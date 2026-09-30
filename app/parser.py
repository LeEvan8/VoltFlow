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
    """(iedName, ldInst, cbName) -> Communication/SubNetwork/ConnectedAP/GSE element."""
    index = {}
    for cap in root.iter("ConnectedAP"):
        ied_name = cap.get("iedName")
        for gse in cap.findall("GSE"):
            index.setdefault((ied_name, gse.get("ldInst", ""), gse.get("cbName", "")), gse)
    return index


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
    except (etree.XMLSyntaxError, OSError) as e:
        raise SCLParseError(f"Not a readable XML file: {e}") from e

    if _localname(root) != "SCL":
        raise SCLParseError(f"Root element is <{_localname(root)}>, expected <SCL>.")

    result = ParsedSCL()
    result.vendor_subscriptions = _collect_vendor_subscriptions(root)
    root = _normalize_to_scl_namespace(root)
    gse_index = _index_gse_addresses(root)

    for ied in root.findall("IED"):
        ied_name = ied.get("name")
        if not ied_name:
            continue
        result.ieds.append((ied_name, ied.get("type"), ied.get("manufacturer")))

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
                gse = gse_index.get((ied_name, ld_inst, cb_name))
                addr, min_time, max_time = _read_gse_address(gse) if gse is not None else ({}, None, None)

                result.gse_controls.append((
                    ied_name, ld_inst, cb_name, gcb.get("type", "GOOSE"), dataset,
                    gcb.get("confRev"), gcb.get("appID"),  # appID is the GoID, not the Ethernet APPID
                    1 if gse is not None else 0,
                    addr.get("MAC-Address"), addr.get("APPID"), addr.get("VLAN-ID"), addr.get("VLAN-PRIORITY"),
                    min_time, max_time,
                ))
                for dest in gcb.findall("IEDName"):
                    if _text(dest):
                        result.gse_destinations.append((ied_name, ld_inst, cb_name, _text(dest)))
                if dataset and dataset in datasets:
                    for fcda in datasets[dataset].findall("FCDA"):
                        result.dataset_members.append((
                            ied_name, ld_inst, dataset,
                            fcda.get("ldInst"), fcda.get("prefix", ""), fcda.get("lnClass"), fcda.get("lnInst", ""),
                            fcda.get("doName"), fcda.get("daName"), fcda.get("fc"),
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
                extref.get("srcLDInst"), extref.get("srcCBName"),
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
