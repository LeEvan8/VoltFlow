"""Builds the GOOSE topology and runs the validation rules over everything uploaded.

Pure read of the database: calling it twice gives the same nodes, edges and errors
(including edge / error ids), so GET endpoints never modify state.

Rule references: IEC 61850-6 Ed2.1 (SCL), IEC 61850-8-1 Ed2 AMD1 (GOOSE mapping),
IEC 61850-7-1 Ed2.1 Annex H (subscription engineering).
"""
import json
import re
from collections import defaultdict

from app.rules import RULE_REFERENCES

APPID_RE = re.compile(r"^[0-9A-Fa-f]{4}$")
MAC_RE = re.compile(r"^([0-9A-Fa-f]{2}[-:]){5}[0-9A-Fa-f]{2}$")
VLAN_ID_RE = re.compile(r"^[0-9A-Fa-f]{3}$")
VLAN_PRIORITY_RE = re.compile(r"^[0-7]$")

# IEC 61850-8-1 Annex B (informative) recommended GOOSE multicast range.
GOOSE_MAC_MIN = 0x010CCD010000
GOOSE_MAC_MAX = 0x010CCD0101FF


# Subscriber-side expectations that can be compared, and the ones that must all be compared for a link to be
# VALID: what a GOOSE subscriber filters/checks on reception (IEC 61850-8-1: destination MAC, APPID, and goID,
# datSet, confRev in the PDU). VLAN ID/priority are compared when declared but not required, because
# 8-1 C.2.2 requires subscribers to tolerate the VLAN tag being modified or removed by the network.
EXPECTED_PARAMS = ["conf_rev", "appid", "mac", "go_id", "dataset", "vlan_id", "vlan_priority"]
REQUIRED_FOR_VALID = ["conf_rev", "appid", "mac", "go_id", "dataset"]


def _same_number(a, b):
    a, b = (a or "").strip(), (b or "").strip()
    return int(a) == int(b) if a.isdigit() and b.isdigit() else a == b


def _same_hex(a, b):
    a, b = (a or "").strip(), (b or "").strip()
    try:
        return int(a, 16) == int(b, 16)
    except ValueError:
        return a.upper() == b.upper()


def _norm_mac(mac):
    return mac.replace(":", "-").upper() if mac else None


def _mac_int(mac):
    return int(mac.replace("-", "").replace(":", ""), 16)


def _names_overlap(a, b):
    """Dotted names (structured DO/DA) match if equal or one is a parent path of the other; empty matches all."""
    if not a or not b:
        return True
    return a == b or a.startswith(b + ".") or b.startswith(a + ".")


def _fcda_matches(extref, member, cb_ld):
    return (
        (extref["ld_inst"] or "") == (member["fcda_ld"] or cb_ld)
        and (extref["prefix"] or "") == (member["prefix"] or "")
        and (extref["ln_class"] or "") == (member["ln_class"] or "")
        and (extref["ln_inst"] or "") == (member["ln_inst"] or "")
        and _names_overlap(extref["do_name"], member["do_name"])
        and _names_overlap(extref["da_name"], member["da_name"])
    )


def _signal_ref(extref):
    ln = f"{extref['prefix'] or ''}{extref['ln_class'] or ''}{extref['ln_inst'] or ''}"
    parts = [p for p in (extref["do_name"], extref["da_name"]) if p]
    return f"{extref['ld_inst'] or '?'}/{ln}" + ("." + ".".join(parts) if parts else "")


def _is_active(cb):
    # IEC 61850-6 9.3.10: a missing datSet indicates an unused control block. GSSE is deprecated.
    return bool(cb["dataset"]) and (cb["cb_type"] or "GOOSE") == "GOOSE"


def analyze(conn):
    file_seq = {r["name"]: r["seq"] for r in conn.execute("SELECT name, seq FROM files")}

    # Authoritative copy of each IED = the file the user chose for it, else the most recently uploaded file
    # that contains it. A choice pointing at a file that no longer contains the IED is ignored.
    ied_rows = conn.execute("SELECT * FROM ieds").fetchall()
    auth_file, ied_info, ied_files = {}, {}, defaultdict(list)
    for row in ied_rows:
        name = row["name"]
        ied_files[name].append(row["source_file"])
        if name not in auth_file or file_seq.get(row["source_file"], 0) > file_seq.get(auth_file[name], 0):
            auth_file[name] = row["source_file"]
            ied_info[name] = dict(row)
    pinned = set()
    for choice in conn.execute("SELECT * FROM ied_sources"):
        row = next((r for r in ied_rows if r["name"] == choice["ied_name"] and r["source_file"] == choice["source_file"]), None)
        if row is not None:
            auth_file[row["name"]], ied_info[row["name"]] = row["source_file"], dict(row)
            pinned.add(row["name"])

    def is_auth(row, ied_col="ied_name"):
        return auth_file.get(row[ied_col]) == row["source_file"]

    all_cbs = [dict(r) for r in conn.execute("SELECT * FROM gse_controls")]
    cb_copies = {(c["source_file"], c["ied_name"], c["ld_inst"], c["cb_name"]): c for c in all_cbs}
    auth_cbs = {(c["ied_name"], c["ld_inst"], c["cb_name"]): c for c in all_cbs if is_auth(c)}
    cbs_by_ied = defaultdict(list)
    for key in sorted(auth_cbs):
        cbs_by_ied[key[0]].append(key)

    # Members of every copy of every data set, in FCDA order (the order defines the GOOSE payload layout).
    members_by_file = defaultdict(list)
    members = defaultdict(list)
    for m in conn.execute("SELECT * FROM dataset_members ORDER BY rowid"):
        members_by_file[(m["source_file"], m["ied_name"], m["ld_inst"], m["dataset"])].append(dict(m))
        if is_auth(m):
            members[(m["ied_name"], m["ld_inst"], m["dataset"])].append(dict(m))

    destinations = defaultdict(set)
    for d in conn.execute("SELECT * FROM gse_destinations"):
        if is_auth(d):
            destinations[(d["ied_name"], d["ld_inst"], d["cb_name"])].add(d["dest_ied"])

    extrefs = [dict(e) for e in conn.execute("SELECT * FROM extrefs") if is_auth(e, "sub_ied")]
    vendor_recs = defaultdict(list)
    for v in conn.execute("SELECT * FROM vendor_subscriptions ORDER BY rowid"):
        if is_auth(v, "sub_ied"):
            vendor_recs[(v["sub_ied"], v["pub_ied"], v["cb_name"])].append(dict(v))

    vendor_types = defaultdict(list)
    for v in conn.execute("SELECT * FROM vendor_signal_types ORDER BY rowid"):
        if is_auth(v, "sub_ied"):
            vendor_types[(v["sub_ied"], v["pub_ied"], v["cb_name"])].append(dict(v))

    subnets_by_file = defaultdict(set)  # (file, ied) -> subnetworks its access points are on
    for ap in conn.execute("SELECT * FROM connected_aps"):
        if ap["subnetwork"]:
            subnets_by_file[(ap["source_file"], ap["ied_name"])].add(ap["subnetwork"])

    def vendor_record(sub, cb_key):
        """The subscriber's vendor record for this control block: one naming the same LD, else one naming no LD."""
        recs = vendor_recs[(sub, cb_key[0], cb_key[2])]
        chosen = [r for r in recs if r["ld_inst"] == cb_key[1]] or [r for r in recs if not r["ld_inst"]]
        return chosen[0] if chosen else None

    def data_in_cb(extref, cb_key):
        cb = auth_cbs[cb_key]
        return any(_fcda_matches(extref, m, cb_key[1]) for m in members[(cb_key[0], cb_key[1], cb["dataset"])])

    # ---------------------------------------------------------------------
    # Resolve every bound ExtRef to a publisher control block
    # ---------------------------------------------------------------------
    subscriptions = {}           # (sub_ied, cb_key) -> subscription record
    unresolved = {}              # (sub_ied, pub_ied, src_cb_name) -> (rule, severity, message, [signals])

    def add_unresolved(extref, rule, severity, message):
        key = (extref["sub_ied"], extref["pub_ied"], extref["src_cb_name"] or "", rule)
        entry = unresolved.setdefault(key, {"rule": rule, "severity": severity, "message": message, "signals": [], "sub": extref["sub_ied"]})
        entry["signals"].append(_signal_ref(extref))

    for extref in extrefs:
        sub, pub, src_cb = extref["sub_ied"], extref["pub_ied"], extref["src_cb_name"]
        if pub not in auth_file:
            add_unresolved(extref, "PUBLISHER_NOT_LOADED", "WARNING",
                           f"'{sub}' subscribes to '{pub}'{f' / {src_cb}' if src_cb else ''}, but no uploaded file contains IED '{pub}'.")
            continue

        cb_key, via, note = None, None, None
        if src_cb:
            # IEC 61850-6 Table 34: srcLDInst defaults to the ExtRef's ldInst when missing.
            src_ld = extref["src_ld_inst"] or extref["ld_inst"] or ""
            direct = (pub, src_ld, src_cb)
            if direct in auth_cbs:
                if not _is_active(auth_cbs[direct]):
                    add_unresolved(extref, "SUBSCRIBED_TO_UNUSED_CB", "ERROR",
                                   f"'{sub}' subscribes to '{pub}/{src_ld}/LLN0.{src_cb}', which has no data set (unused control block).")
                    continue
                cb_key, via = direct, "standard"
            else:
                named = [k for k in cbs_by_ied[pub] if k[2] == src_cb and _is_active(auth_cbs[k]) and data_in_cb(extref, k)]
                if len(named) == 1:
                    cb_key, via = named[0], "dataset"
                    target = f"'{pub}/{cb_key[1]}/LLN0.{src_cb}'"
                    if extref["src_ld_inst"]:
                        # An explicitly written srcLDInst that points nowhere is an error in the file.
                        note = ("WARNING", "SRC_LDINST_MISMATCH", "YELLOW",
                                f"'{sub}' references '{pub}/{src_ld}/LLN0.{src_cb}' (srcLDInst='{src_ld}'), which does not exist; "
                                f"matched by data set content to {target} instead.")
                    else:
                        # srcLDInst omitted: flagged as non-conformance, but the unique data set match identifies the
                        # source, so the link itself stays green.
                        confirmed = any(r["ld_inst"] == cb_key[1] for r in vendor_recs[(sub, pub, src_cb)])
                        note = ("WARNING", "SRC_LDINST_DEFAULT_MISMATCH", "GREEN",
                                f"'{sub}' omits srcLDInst for '{src_cb}', so by IEC 61850-6 it defaults to ldInst='{src_ld}', "
                                f"where no such control block exists. Resolved by data set content to {target}"
                                + (f", confirmed by the vendor subscription record (ldName='{cb_key[1]}')." if confirmed else ".")
                                + " Communication is unaffected; strict SCL tools may not resolve this reference.")
                else:
                    add_unresolved(extref, "UNRESOLVED_SOURCE", "WARNING",
                                   f"'{sub}' expects data from control block '{src_cb}' on '{pub}', but that control block is missing or deleted.")
                    continue
        else:
            # Edition 1 style ExtRef without srcCBName: find the GOOSE data set that carries the signal.
            matched = [k for k in cbs_by_ied[pub] if _is_active(auth_cbs[k]) and data_in_cb(extref, k)]
            if len(matched) > 1:
                listed = [k for k in matched if sub in destinations[k]]
                matched = listed if len(listed) == 1 else matched
            if len(matched) == 1:
                cb_key, via = matched[0], "dataset"
            elif len(matched) > 1:
                add_unresolved(extref, "AMBIGUOUS_SOURCE", "WARNING",
                               f"'{sub}' input from '{pub}' has no srcCBName and its signal is published by several control blocks "
                               f"({', '.join(k[2] for k in matched)}).")
                continue
            elif extref["service_type"] == "GOOSE":
                add_unresolved(extref, "UNRESOLVED_SOURCE", "WARNING",
                               f"'{sub}' expects a GOOSE input from '{pub}' that is not in any published GOOSE data set.")
                continue
            else:
                continue  # no service type and not in any GOOSE data set: likely a report/poll input

        record = subscriptions.setdefault((sub, cb_key), {"sub": sub, "cb_key": cb_key, "via": via, "notes": set(), "missing": [],
                                                          "service_conflicts": set()})
        if note:
            record["notes"].add(note)
        # IEC 61850-6 9.3.13: a pServT given by the input template must be met by the engineered service type.
        if extref["p_serv_t"] and extref["p_serv_t"] != (extref["service_type"] or "GOOSE"):
            record["service_conflicts"].add((_signal_ref(extref), extref["p_serv_t"]))
        if via == "standard" and (extref["do_name"] or extref["ln_class"]) and not data_in_cb(extref, cb_key):
            record["missing"].append(_signal_ref(extref))

    # ---------------------------------------------------------------------
    # Edges
    # ---------------------------------------------------------------------
    subs_by_cb = defaultdict(list)
    for record in subscriptions.values():
        subs_by_cb[record["cb_key"]].append(record)

    active_keys = [k for k in sorted(auth_cbs) if _is_active(auth_cbs[k])]
    edges, edges_by_cb, edge_of_sub, edge_cb = [], defaultdict(list), {}, {}
    parallel, stub_count, unresolved_count = defaultdict(int), defaultdict(int), defaultdict(int)

    def no_flags():
        return {"rev_mismatch": False, "appid_mismatch": False, "mac_mismatch": False, "goid_mismatch": False,
                "vlan_mismatch": False, "dataset_mismatch": False, "type_mismatch": False, "appid_collision": False}

    def no_expectation():
        return {"sub_rev": None, "sub_appid": None, "sub_mac": None, "sub_vlan": None, "sub_pri": None, "sub_dataset": None,
                "sub_goid": None, "expected_sources": {}, "not_declared": list(EXPECTED_PARAMS), "fully_verified": False,
                "match_method": None, "flags": no_flags()}

    def expectations(sub, cb_key):
        """What the subscriber declares it expects, per parameter, with the source of each value.
        Standard ExtRefs carry no such values; they come from a publisher copy in the subscriber's own
        file and/or the subscriber's vendor record (the record wins where both declare a value)."""
        expected, sources = {}, {}

        def put(param, value, source):
            if value is not None and value != "":
                expected[param], sources[param] = value, source

        copy = cb_copies.get((auth_file[sub], *cb_key))
        if copy and auth_file[sub] != auth_file[cb_key[0]]:
            src = auth_file[sub]
            put("conf_rev", copy["conf_rev"], src)
            put("go_id", copy["go_id"], src)
            if copy["has_address"]:
                put("appid", copy["appid"], src)
                put("mac", _norm_mac(copy["mac_address"]), src)
                put("vlan_id", copy["vlan_id"] or "000", src)
                put("vlan_priority", copy["vlan_priority"], src)
            copy_members = members_by_file[(auth_file[sub], cb_key[0], cb_key[1], copy["dataset"])]
            if copy["dataset"] and copy_members:
                put("dataset", copy["dataset"], src)
                expected["dataset_members"] = member_seq(copy_members)
                expected["dataset_types"] = [m["leaf_types"] for m in copy_members]

        vendor = vendor_record(sub, cb_key)
        if vendor:
            src = f"{ied_info[sub]['manufacturer'] or 'vendor'} {vendor['record_type']}"
            if vendor["dataset"] and vendor["dataset"] != expected.get("dataset"):
                expected.pop("dataset_members", None)  # copy's member list belongs to a different data set name
                expected.pop("dataset_types", None)
            put("conf_rev", vendor["conf_rev"], src)
            put("appid", vendor["appid"], src)
            put("mac", _norm_mac(vendor["mac_address"]), src)
            put("vlan_id", vendor["vlan_id"], src)
            put("vlan_priority", vendor["vlan_priority"], src)
            put("dataset", vendor["dataset"], src)
            put("go_id", vendor["go_id"], src)
        return expected, sources

    def member_seq(rows):
        return [tuple(m[k] or "" for k in ("fcda_ld", "prefix", "ln_class", "ln_inst", "do_name", "da_name", "fc")) for m in rows]

    def leaf_type_changes(old_types, new_types):
        """Attribute type changes between two member lists with the same FCDA sequence.
        Members whose types are unknown on either side (NULL leaf_types) are not compared."""
        changes = []
        for old, new in zip(old_types, new_types):
            if not old or not new or old == new:
                continue
            old_leaves, new_leaves = dict(json.loads(old)), dict(json.loads(new))
            for path in sorted(set(old_leaves) | set(new_leaves)):
                before, after = old_leaves.get(path, "absent"), new_leaves.get(path, "absent")
                if before.upper() != after.upper():
                    changes.append(f"{path}: {before} → {after}")
        return changes

    def vendor_type_changes(sub, cb_key):
        """Signals whose type the subscriber's vendor record declares differently from the publisher's templates."""
        cb, changes = auth_cbs[cb_key], []
        for sig in vendor_types[(sub, cb_key[0], cb_key[2])]:
            if sig["cb_ld"] and sig["cb_ld"] != cb_key[1]:
                continue
            signal = {"ld_inst": sig["sig_ld"], "prefix": sig["prefix"], "ln_class": sig["ln_class"],
                      "ln_inst": sig["ln_inst"], "do_name": sig["do_name"], "da_name": sig["da_name"]}
            path = sig["do_name"] + (f".{sig['da_name']}" if sig["da_name"] else "")
            for m in members[(cb_key[0], cb_key[1], cb["dataset"])]:
                if m["leaf_types"] and _fcda_matches(signal, m, cb_key[1]):
                    published = dict(json.loads(m["leaf_types"])).get(path)
                    if published is not None:
                        if published.upper() != sig["b_type"].upper():
                            changes.append(f"{path}: publisher sends {published}, '{sub}' expects {sig['b_type']}")
                        break
        return sorted(set(changes))

    def pub_details(cb):
        return {
            "dataset": cb["dataset"], "cb_name": cb["cb_name"], "ld_inst": cb["ld_inst"], "go_id": cb["go_id"],
            "appid": cb["appid"], "mac_address": _norm_mac(cb["mac_address"]),
            "vlan_id": cb["vlan_id"] or "000",  # 8-1 C.2.4: VID is 0 when VLAN-ID is not configured
            "vlan_priority": cb["vlan_priority"], "pub_rev": cb["conf_rev"],
            "min_time": cb["min_time"], "max_time": cb["max_time"],
        }

    for cb_key in active_keys:
        cb = auth_cbs[cb_key]
        records = sorted(subs_by_cb[cb_key], key=lambda r: r["sub"])
        for record in records:
            edge_id = len(edges) + 1
            sub = record["sub"]

            expected, sources = expectations(sub, cb_key)
            record["expected"], record["sources"] = expected, sources

            details = pub_details(cb)
            actual_members = member_seq(members[(cb_key[0], cb_key[1], cb["dataset"])])
            flags = no_flags()
            flags.update({
                "rev_mismatch": "conf_rev" in expected and not _same_number(expected["conf_rev"], cb["conf_rev"]),
                "appid_mismatch": "appid" in expected and not _same_hex(expected["appid"], cb["appid"]),
                "mac_mismatch": "mac" in expected and expected["mac"] != details["mac_address"],
                "goid_mismatch": "go_id" in expected and expected["go_id"] != (cb["go_id"] or ""),
                "vlan_mismatch": ("vlan_id" in expected and not _same_hex(expected["vlan_id"], details["vlan_id"]))
                                 or ("vlan_priority" in expected and expected["vlan_priority"] != (cb["vlan_priority"] or "")),
                "dataset_mismatch": ("dataset_members" in expected and (expected["dataset"], expected["dataset_members"]) != (cb["dataset"], actual_members))
                                    or ("dataset" in expected and expected["dataset"] != cb["dataset"]),
            })
            actual_types = [m["leaf_types"] for m in members[(cb_key[0], cb_key[1], cb["dataset"])]]
            type_changes = []
            if "dataset_members" in expected and not flags["dataset_mismatch"]:
                type_changes += [f"{c} (vs {sources['dataset']})" for c in leaf_type_changes(expected["dataset_types"], actual_types)]
            vendor_changes = vendor_type_changes(sub, cb_key)
            if vendor_changes:
                vendor_src = f"{ied_info[sub]['manufacturer'] or 'vendor'} subscription record"
                type_changes += [f"{c} (from {vendor_src})" for c in vendor_changes]
            flags["type_mismatch"] = bool(type_changes)
            record["flags"], record["actual_members"], record["type_changes"] = flags, actual_members, type_changes
            not_declared = [p for p in EXPECTED_PARAMS if p not in expected]
            fully_verified = not any(p in not_declared for p in REQUIRED_FOR_VALID)
            details.update({
                "sub_rev": expected.get("conf_rev"), "sub_appid": expected.get("appid"), "sub_mac": expected.get("mac"),
                "sub_vlan": expected.get("vlan_id"), "sub_pri": expected.get("vlan_priority"), "sub_dataset": expected.get("dataset"),
                "sub_goid": expected.get("go_id"), "expected_sources": sources, "not_declared": not_declared,
                "fully_verified": fully_verified, "match_method": record["via"], "flags": flags,
            })
            wire = (cb_key[0], sub)
            edges.append({
                "id": edge_id, "publisher": cb_key[0], "subscriber": sub, "app_id": cb["cb_name"],
                # UNVERIFIED: nothing known to be wrong, but not every required parameter could be compared.
                "color_state": "GREEN", "status": "VALID" if fully_verified else "UNVERIFIED", "edge_index": parallel[wire],
                "is_orphan_stub": False, "is_unresolved_stub": False, "unresolved_publisher": None, "network_details": details,
            })
            parallel[wire] += 1
            edges_by_cb[cb_key].append(edge_id)
            edge_of_sub[(sub, cb_key)] = edge_id
            edge_cb[edge_id] = cb_key

        if not records:
            edge_id = len(edges) + 1
            details = pub_details(cb)
            details.update(no_expectation())
            edges.append({
                "id": edge_id, "publisher": cb_key[0], "subscriber": cb_key[0], "app_id": cb["cb_name"],
                "color_state": "AMBER", "status": "ORPHANED_STREAM", "edge_index": stub_count[cb_key[0]],
                "is_orphan_stub": True, "is_unresolved_stub": False, "unresolved_publisher": None, "network_details": details,
            })
            stub_count[cb_key[0]] += 1
            edges_by_cb[cb_key].append(edge_id)
            edge_cb[edge_id] = cb_key

    # Dangling inbound stubs: the subscriber expects data whose publisher control block is missing or deleted.
    for key in sorted(unresolved):
        entry = unresolved[key]
        if entry["rule"] != "UNRESOLVED_SOURCE":
            continue
        sub, pub, src_cb = key[0], key[1], key[2]
        edge_id = len(edges) + 1
        edges.append({
            "id": edge_id, "publisher": sub, "subscriber": sub, "app_id": src_cb or "unknown control block",
            "color_state": "YELLOW", "status": "UNRESOLVED_SOURCE", "edge_index": unresolved_count[sub],
            "is_orphan_stub": False, "is_unresolved_stub": True, "unresolved_publisher": pub,
            "network_details": {
                "dataset": None, "cb_name": src_cb or None, "ld_inst": None, "go_id": None, "appid": None, "mac_address": None,
                "vlan_id": None, "vlan_priority": None, "pub_rev": None, "min_time": None, "max_time": None,
                **no_expectation(),
            },
        })
        unresolved_count[sub] += 1
        entry["edge_id"] = edge_id

    # ---------------------------------------------------------------------
    # Validation rules
    # ---------------------------------------------------------------------
    errors, cb_marks, edge_marks = [], defaultdict(list), defaultdict(list)
    color_rank = {"GREEN": 0, "YELLOW": 1, "RED": 2}
    severity_color = {"ERROR": "RED", "WARNING": "YELLOW", "INFO": "GREEN"}

    def report(ied, severity, rule, message, cb_key=None, edge_id=None, target_ied=None, color=None):
        """color: what this finding does to the edge; defaults from severity (a green WARNING flags without recolouring)."""
        # mark = (colour rank, specificity, -report order, rule): the edge status is the most severe finding; on equal
        # colour a finding about the link itself beats one about its whole control block; then the first reported.
        rank = color_rank[color or severity_color[severity]]
        if cb_key is not None and edge_id is None:
            edge_id = edges_by_cb[cb_key][0] if edges_by_cb.get(cb_key) else None
            cb_marks[cb_key].append((rank, 0, -len(errors), rule))
        elif edge_id is not None:
            edge_marks[edge_id].append((rank, 1, -len(errors), rule))
        errors.append({
            "id": len(errors) + 1, "ied_name": ied, "severity": severity, "rule_type": rule, "message": message,
            "xpath": f"e-{edge_id}" if edge_id else "", "target_ied": target_ied or ied,
            "reference": RULE_REFERENCES.get(rule),
        })

    def cb_label(key):
        return f"'{key[2]}' ({key[0]}/{key[1]})"

    for cb_key in active_keys:
        cb, ied = auth_cbs[cb_key], cb_key[0]
        if not cb["conf_rev"]:
            report(ied, "ERROR", "CONF_REV_MISSING", f"GOOSE control block {cb_label(cb_key)} has no confRev (mandatory for GOOSE, IEC 61850-6 9.3.10).", cb_key)
        elif cb["conf_rev"].strip() == "0":
            report(ied, "WARNING", "CONF_REV_ZERO", f"Control block {cb_label(cb_key)} references data set '{cb['dataset']}' but has confRev 0, which is only allowed without a data set.", cb_key)

        if not cb["dataset_found"]:
            report(ied, "ERROR", "DATASET_NOT_FOUND",
                   f"Control block {cb_label(cb_key)} references data set '{cb['dataset']}', which does not exist in {cb_key[0]}/{cb_key[1]}/LLN0 "
                   f"(IEC 61850-6 9.3.10: datSet must be a valid data set reference). Nothing can be published.", cb_key)

        if not cb["has_address"]:
            report(ied, "WARNING", "MISSING_GSE_ADDRESS", f"Control block {cb_label(cb_key)} has no GSE address in the Communication section (IEC 61850-8-1 25.3.2).", cb_key)
            continue

        appid = cb["appid"]
        if not appid:
            report(ied, "ERROR", "APPID_MISSING", f"Control block {cb_label(cb_key)} has no APPID in its GSE address.", cb_key)
        elif not APPID_RE.match(appid):
            report(ied, "ERROR", "APPID_FORMAT", f"APPID '{appid}' on {cb_label(cb_key)} must be 4 hexadecimal characters.", cb_key)
        else:
            value = int(appid, 16)
            if not (0x0000 <= value <= 0x3FFF or 0x8000 <= value <= 0xBFFF):
                report(ied, "ERROR", "APPID_RANGE", f"APPID '{appid}' on {cb_label(cb_key)} is outside the GOOSE ranges 0000-3FFF (Type 1) and 8000-BFFF (Type 1A).", cb_key)
            elif value == 0:
                report(ied, "WARNING", "APPID_UNCONFIGURED", f"APPID 0000 on {cb_label(cb_key)} is the default value reserved to indicate a missing configuration.", cb_key)

        mac = cb["mac_address"]
        if not mac:
            report(ied, "ERROR", "MAC_MISSING", f"Control block {cb_label(cb_key)} has no MAC-Address in its GSE address.", cb_key)
        elif not MAC_RE.match(mac):
            report(ied, "ERROR", "MAC_FORMAT", f"MAC-Address '{mac}' on {cb_label(cb_key)} is not of the form XX-XX-XX-XX-XX-XX.", cb_key)
        else:
            value = _mac_int(mac)
            if value == 0:
                report(ied, "ERROR", "MAC_UNCONFIGURED", f"MAC-Address 00-00-00-00-00-00 on {cb_label(cb_key)} means the multicast address is not configured.", cb_key)
            elif not (value >> 40) & 0x01:
                report(ied, "ERROR", "MAC_NOT_MULTICAST", f"MAC-Address '{_norm_mac(mac)}' on {cb_label(cb_key)} is not a multicast address (IEC 61850-8-1 Annex B).", cb_key)
            elif not GOOSE_MAC_MIN <= value <= GOOSE_MAC_MAX:
                report(ied, "WARNING", "MAC_OUTSIDE_RECOMMENDED_RANGE", f"MAC-Address '{_norm_mac(mac)}' on {cb_label(cb_key)} is outside the recommended GOOSE range 01-0C-CD-01-00-00 to 01-0C-CD-01-01-FF.", cb_key)

        if cb["vlan_id"] and not VLAN_ID_RE.match(cb["vlan_id"]):
            report(ied, "ERROR", "VLAN_ID_FORMAT", f"VLAN-ID '{cb['vlan_id']}' on {cb_label(cb_key)} must be 3 hexadecimal characters.", cb_key)
        if cb["vlan_priority"] and not VLAN_PRIORITY_RE.match(cb["vlan_priority"]):
            report(ied, "ERROR", "VLAN_PRIORITY_FORMAT", f"VLAN-PRIORITY '{cb['vlan_priority']}' on {cb_label(cb_key)} must be a single digit 0-7.", cb_key)

        try:
            min_t = float(cb["min_time"]) if cb["min_time"] else None
            max_t = float(cb["max_time"]) if cb["max_time"] else None
            if min_t is not None and max_t is not None and min_t >= max_t:
                report(ied, "WARNING", "GOOSE_TIMING", f"MinTime {cb['min_time']} ms is not below MaxTime {cb['max_time']} ms on {cb_label(cb_key)}.", cb_key)
        except ValueError:
            report(ied, "WARNING", "GOOSE_TIMING", f"MinTime/MaxTime on {cb_label(cb_key)} are not numeric milliseconds.", cb_key)

    def report_duplicates(value_of, rule, severity, describe):
        groups = defaultdict(list)
        for key in active_keys:
            value = value_of(auth_cbs[key])
            if value:
                groups[value].append(key)
        for value, keys in groups.items():
            if len(keys) > 1:
                for key in keys:
                    others = ", ".join(cb_label(k) for k in keys if k != key)
                    report(key[0], severity, rule, describe(value, key, others), key)
                    if rule == "APPID_COLLISION":
                        for edge_id in edges_by_cb[key]:
                            edges[edge_id - 1]["network_details"]["flags"]["appid_collision"] = True

    report_duplicates(lambda c: c["appid"].upper() if c["has_address"] and c["appid"] and APPID_RE.match(c["appid"]) else None,
                      "APPID_COLLISION", "ERROR", lambda v, k, o: f"APPID '{v}' on {cb_label(k)} is also used by {o}.")
    report_duplicates(lambda c: _norm_mac(c["mac_address"]) if c["has_address"] and c["mac_address"] and MAC_RE.match(c["mac_address"]) and _mac_int(c["mac_address"]) else None,
                      "MULTICAST_MAC_DUPLICATE", "WARNING", lambda v, k, o: f"Multicast MAC '{v}' on {cb_label(k)} is also used by {o}.")
    report_duplicates(lambda c: c["go_id"], "GOID_DUPLICATE", "WARNING",
                      lambda v, k, o: f"GoID (GSEControl appID) '{v}' on {cb_label(k)} is also used by {o}; it should be system-wide unique.")

    # IEC 61850-6 9.3.10: confRev shall be incremented for any change of the data set. Compare every uploaded
    # copy of each control block; same confRev with a different data set means subscribers cannot detect the change.
    for cb_key in active_keys:
        copies = sorted((c for (f, *k), c in cb_copies.items() if tuple(k) == cb_key and c["dataset"]), key=lambda c: file_seq.get(c["source_file"], 0))
        seen = set()
        for i, a in enumerate(copies):
            for b in copies[i + 1:]:
                if not _same_number(a["conf_rev"], b["conf_rev"]) or (a["source_file"], b["source_file"]) in seen:
                    continue
                a_rows = members_by_file[(a["source_file"], *cb_key[:2], a["dataset"])]
                b_rows = members_by_file[(b["source_file"], *cb_key[:2], b["dataset"])]
                if not a_rows or not b_rows:
                    continue  # a copy without its data set content can't be compared
                if (a["dataset"], member_seq(a_rows)) != (b["dataset"], member_seq(b_rows)):
                    change = f"data set '{a['dataset']}' ({len(a_rows)} entries) vs '{b['dataset']}' ({len(b_rows)} entries)"                         if a["dataset"] != b["dataset"] else f"{len(a_rows)} vs {len(b_rows)} entries or a different order"
                else:
                    type_diff = leaf_type_changes([m["leaf_types"] for m in a_rows], [m["leaf_types"] for m in b_rows])
                    if not type_diff:
                        continue
                    change = "attribute types changed: " + "; ".join(type_diff[:3]) + (" …" if len(type_diff) > 3 else "")
                seen.add((a["source_file"], b["source_file"]))
                report(cb_key[0], "ERROR", "CONFREV_NOT_INCREMENTED",
                       f"{cb_label(cb_key)} has confRev {b['conf_rev']} in both '{a['source_file']}' and '{b['source_file']}', "
                       f"but the data set differs ({change}). IEC 61850-6 requires confRev to be incremented on any data set change; "
                       f"subscribers configured against the other version cannot detect it.", cb_key)

    for cb_key in active_keys:
        subscribers = {r["sub"] for r in subs_by_cb[cb_key]}
        if not subscribers:
            report(cb_key[0], "WARNING", "ORPHANED_STREAM", f"GOOSE control block {cb_label(cb_key)} has no subscribers among the uploaded IEDs.", cb_key)
        for dest in sorted(destinations[cb_key]):
            if dest in auth_file and dest not in subscribers:
                report(cb_key[0], "WARNING", "DESTINATION_WITHOUT_INPUTS",
                       f"{cb_label(cb_key)} lists '{dest}' as a subscriber (GSEControl/IEDName), but '{dest}' has no inputs bound to it.", cb_key)

    for (sub, cb_key), record in sorted(subscriptions.items()):
        edge_id = edge_of_sub[(sub, cb_key)]
        cb, flags, expected, sources = auth_cbs[cb_key], record["flags"], record["expected"], record["sources"]

        def src(*params):
            names = sorted({sources[p] for p in params if p in sources})
            return f"from {', '.join(names)}" if names else ""

        for severity, rule, color, note in sorted(record["notes"]):
            report(sub, severity, rule, note, edge_id=edge_id, color=color)
        if flags["dataset_mismatch"]:
            old, new = expected.get("dataset_members"), record["actual_members"]
            if expected["dataset"] != cb["dataset"]:
                change = f"it expects data set '{expected['dataset']}' but the publisher sends '{cb['dataset']}'"
            elif sorted(old) == sorted(new):
                change = "the same members were reordered"
            else:
                added, removed = len([m for m in new if m not in old]), len([m for m in old if m not in new])
                change = f"{added} member(s) added, {removed} removed ({len(old)} → {len(new)} entries)"
            report(sub, "ERROR", "FATAL_TYPE_MISMATCH",
                   f"Data set composition of {cb_label(cb_key)} differs from what '{sub}' was configured with ({src('dataset')}): {change}. "
                   f"The byte sequence no longer matches, so the subscriber will drop the payload.", edge_id=edge_id)
        if flags["type_mismatch"]:
            changes = record["type_changes"]
            report(sub, "ERROR", "FATAL_TYPE_MISMATCH",
                   f"Signal types of {cb_label(cb_key)} differ from what '{sub}' expects: {'; '.join(changes[:4])}{' …' if len(changes) > 4 else ''}. "
                   f"The subscriber decodes the payload with the wrong types and will drop it.", edge_id=edge_id)
        for signal, expected_service in sorted(record["service_conflicts"]):
            report(sub, "ERROR", "SERVICE_TYPE_MISMATCH",
                   f"Input {signal} of '{sub}' requires service type '{expected_service}' (pServT), but it is bound to GOOSE "
                   f"from {cb_label(cb_key)} (IEC 61850-6 9.3.13).", edge_id=edge_id)
        if record["missing"]:
            report(sub, "ERROR", "DATASET_MEMBER_MISSING",
                   f"'{sub}' expects {len(record['missing'])} signal(s) from {cb_label(cb_key)} that are not in data set '{cb['dataset']}': {', '.join(sorted(set(record['missing'])))}.",
                   edge_id=edge_id)
        if destinations[cb_key] and sub not in destinations[cb_key]:
            report(sub, "WARNING", "IEDNAME_NOT_LISTED",
                   f"'{sub}' subscribes to {cb_label(cb_key)}, but is not in its GSEControl/IEDName list.", edge_id=edge_id)
        if flags["rev_mismatch"]:
            report(sub, "WARNING", "CONFREV_DESYNC",
                   f"confRev desync on {cb_label(cb_key)}: publisher has '{cb['conf_rev']}', '{sub}' expects '{expected['conf_rev']}' ({src('conf_rev')}). "
                   f"The link exists, but the subscriber may discard these messages and its received values freeze.", edge_id=edge_id)
        routing, routing_params = [], []
        if flags["appid_mismatch"]:
            routing.append(f"APPID publisher '{cb['appid']}' vs expected '{expected['appid']}'")
            routing_params.append("appid")
        if flags["mac_mismatch"]:
            routing.append(f"MAC publisher '{_norm_mac(cb['mac_address'])}' vs expected '{expected['mac']}'")
            routing_params.append("mac")
        if flags["goid_mismatch"]:
            routing.append(f"GoID publisher '{cb['go_id']}' vs expected '{expected['go_id']}'")
            routing_params.append("go_id")
        if flags["vlan_mismatch"]:
            routing.append(f"VLAN publisher {cb['vlan_id'] or '000'}/prio {cb['vlan_priority']} vs expected "
                           f"{expected.get('vlan_id', 'not declared')}/prio {expected.get('vlan_priority', 'not declared')}")
            routing_params += ["vlan_id", "vlan_priority"]
        if routing:
            report(sub, "ERROR", "NETWORK_ROUTING_FAIL",
                   f"Layer 2 parameters of {cb_label(cb_key)} do not match what '{sub}' filters on ({src(*routing_params)}): {'; '.join(routing)}. "
                   f"Multicast frames will be dropped.", edge_id=edge_id)
        # IEC 61850-7-1 Annex H: the subscriber access point must be on the publisher's subnetwork. SubNetwork names
        # are tool-specific, so only compare within one file that describes both IEDs' communication.
        for f in dict.fromkeys([auth_file[sub], auth_file[cb_key[0]]]):
            copy = cb_copies.get((f, *cb_key))
            pub_subnet, sub_subnets = (copy or {}).get("subnetwork"), subnets_by_file[(f, sub)]
            if pub_subnet and sub_subnets:
                if pub_subnet not in sub_subnets:
                    report(sub, "ERROR", "SUBNETWORK_MISMATCH",
                           f"In '{f}', {cb_label(cb_key)} is published on subnetwork '{pub_subnet}', but '{sub}' is only connected to "
                           f"{', '.join(repr(n) for n in sorted(sub_subnets))}. GOOSE is layer 2 and will not reach it (IEC 61850-7-1 Annex H).",
                           edge_id=edge_id)
                break

    for key in sorted(unresolved):
        entry = unresolved[key]
        signals = sorted(set(entry["signals"]))
        suffix = f" Signals: {', '.join(signals[:5])}{' …' if len(signals) > 5 else ''}."
        report(entry["sub"], entry["severity"], entry["rule"], entry["message"] + suffix, edge_id=entry.get("edge_id"))

    # Edge colour = the most severe colour of any finding on the edge or its control block; the status is that finding's flag.
    for edge in edges:
        if edge["is_orphan_stub"]:
            continue
        marks = edge_marks[edge["id"]] + (cb_marks[edge_cb[edge["id"]]] if edge["id"] in edge_cb else [])
        if marks:
            rank, _, _, rule = max(marks)
            edge["color_state"] = ["GREEN", "YELLOW", "RED"][rank]
            edge["status"] = rule

    # ---------------------------------------------------------------------
    # Nodes
    # ---------------------------------------------------------------------
    nodes = []
    for name in sorted(auth_file):
        unused = [{"ld_inst": k[1], "cb_name": k[2], "status": "UNUSED_CB",
                   "reason": "no data set" if not auth_cbs[k]["dataset"] else f"type {auth_cbs[k]['cb_type']}"}
                  for k in cbs_by_ied[name] if not _is_active(auth_cbs[k])]
        nodes.append({"name": name, "type": ied_info[name]["type"], "manufacturer": ied_info[name]["manufacturer"],
                      "source_file": auth_file[name], "source_pinned": name in pinned,
                      # every uploaded file containing this IED, newest first
                      "copies": sorted(ied_files[name], key=lambda f: -file_seq.get(f, 0)), "unused_cbs": unused})

    return {"nodes": nodes, "edges": edges, "errors": errors}
