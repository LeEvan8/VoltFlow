"""GOOSE capture decoding: pcap/pcapng reading, frame/PDU decoding and per-stream summaries.

Encoding per IEC 61850-8-1 Ed2 AMD1: Ethernet (optional IEEE 802.1Q tag), EtherType 0x88B8, header
APPID / Length / Reserved1 (S = simulation bit, MSB) / Reserved2, then the BER-encoded goosePdu
(application tag 0x61) with fields 0x80..0x8A and allData (0xAB) using the MMS Data tags of Annex A,
Table A.2 (boolean 0x83, bit-string 0x84, integer 0x85, unsigned 0x86, floating-point 0x87,
octet-string 0x89, visible-string 0x8A, utc-time 0x91, array 0xA1, structure 0xA2).

Everything here is read-only and bounds-checked: malformed frames are counted, never raised.
"""
import struct
from datetime import datetime, timezone

GOOSE_ETHERTYPE = 0x88B8
VLAN_TPIDS = (0x8100, 0x88A8)
LINKTYPE_ETHERNET = 1

PDU_FIELDS = {0x80: "gocb_ref", 0x81: "tal", 0x82: "dat_set", 0x83: "go_id", 0x84: "t", 0x85: "st_num",
              0x86: "sq_num", 0x87: "simulation", 0x88: "conf_rev", 0x89: "nds_com", 0x8A: "num_entries"}
DATA_KINDS = {0x83: "boolean", 0x84: "bit-string", 0x85: "integer", 0x86: "unsigned", 0x87: "float",
              0x89: "octet-string", 0x8A: "visible-string", 0x8B: "generalized-time", 0x8C: "binary-time",
              0x90: "mms-string", 0x91: "utc-time", 0xA1: "array", 0xA2: "structure"}

MAX_EVENTS_PER_STREAM = 200


class CaptureError(Exception):
    pass


# ---------------------------------------------------------------------------
# pcap / pcapng
# ---------------------------------------------------------------------------

def read_capture(path):
    """Yield (timestamp_seconds or None, linktype, frame_bytes) for every packet in a pcap or pcapng file."""
    with open(path, "rb") as f:
        magic = f.read(4)
        if len(magic) < 4:
            raise CaptureError("File is empty or too short to be a capture.")
        if magic == b"\x0a\x0d\x0d\x0a":
            yield from _read_pcapng(f, magic)
        elif magic in (b"\xd4\xc3\xb2\xa1", b"\xa1\xb2\xc3\xd4", b"\x4d\x3c\xb2\xa1", b"\xa1\xb2\x3c\x4d"):
            yield from _read_pcap(f, magic)
        else:
            raise CaptureError("Not a pcap or pcapng file (unknown file signature).")


def _read_pcap(f, magic):
    endian = "<" if magic in (b"\xd4\xc3\xb2\xa1", b"\x4d\x3c\xb2\xa1") else ">"
    nano = magic in (b"\x4d\x3c\xb2\xa1", b"\xa1\xb2\x3c\x4d")
    header = f.read(20)
    if len(header) < 20:
        raise CaptureError("Truncated pcap file header.")
    linktype = struct.unpack(endian + "HHiIII", header)[5] & 0x0FFFFFFF
    while True:
        rec = f.read(16)
        if len(rec) < 16:
            return
        sec, frac, incl, _orig = struct.unpack(endian + "IIII", rec)
        data = f.read(incl)
        if len(data) < incl:
            return  # truncated last packet (capture still being written / cut short)
        yield sec + frac / (1e9 if nano else 1e6), linktype, data


def _read_pcapng(f, first4):
    interfaces = []  # per section: [(linktype, ticks_per_second)]
    endian = "<"
    pending = first4
    while True:
        head = pending + f.read(8 - len(pending)) if pending else f.read(8)
        pending = b""
        if len(head) < 8:
            return
        if head[:4] == b"\x0a\x0d\x0d\x0a":  # Section Header Block: endianness from the byte-order magic
            bom = f.read(4)
            if len(bom) < 4:
                return
            endian = "<" if bom == b"\x4d\x3c\x2b\x1a" else ">" if bom == b"\x1a\x2b\x3c\x4d" else None
            if endian is None:
                raise CaptureError("Corrupt pcapng section header.")
            total = struct.unpack(endian + "I", head[4:8])[0]
            if total < 16:
                raise CaptureError("Corrupt pcapng block length.")
            f.read(total - 12)
            interfaces = []
            continue
        btype, total = struct.unpack(endian + "II", head)
        if total < 12 or total % 4:
            raise CaptureError("Corrupt pcapng block length.")
        body = f.read(total - 8)
        if len(body) < total - 8:
            return
        body = body[:-4]  # trailing block length
        if btype == 1 and len(body) >= 8:  # Interface Description Block
            linktype = struct.unpack(endian + "H", body[:2])[0]
            interfaces.append((linktype, _if_tsresol(body[8:], endian)))
        elif btype in (6, 2) and len(body) >= 20:  # Enhanced Packet Block / obsolete Packet Block
            if btype == 6:
                iface, ts_hi, ts_lo, cap_len = struct.unpack(endian + "IIII", body[:16])
            else:
                iface, _drops, ts_hi, ts_lo, cap_len = struct.unpack(endian + "HHIII", body[:16])
            if iface >= len(interfaces):
                continue
            linktype, ticks = interfaces[iface]
            yield ((ts_hi << 32) | ts_lo) / ticks, linktype, body[20:20 + cap_len]
        elif btype == 3 and len(body) >= 4 and interfaces:  # Simple Packet Block (no timestamp)
            yield None, interfaces[0][0], body[4:]


def _if_tsresol(options, endian):
    pos = 0
    while pos + 4 <= len(options):
        code, length = struct.unpack(endian + "HH", options[pos:pos + 4])
        if code == 0:
            break
        if code == 9 and length >= 1:
            v = options[pos + 4]
            return float(2 ** (v & 0x7F)) if v & 0x80 else float(10 ** v)
        pos += 4 + length + (-length % 4)
    return 1e6


# ---------------------------------------------------------------------------
# BER / GOOSE decoding
# ---------------------------------------------------------------------------

def _tlv(buf, pos, end):
    """(tag, value_start, value_end) of the TLV at pos; raises ValueError when it does not fit."""
    if pos + 2 > end:
        raise ValueError("truncated TLV")
    tag = buf[pos]
    if tag & 0x1F == 0x1F:
        raise ValueError("multi-byte tags are not used by GOOSE")
    length, pos = buf[pos + 1], pos + 2
    if length & 0x80:
        n = length & 0x7F
        if n == 0 or n > 4 or pos + n > end:
            raise ValueError("bad length")
        length, pos = int.from_bytes(buf[pos:pos + n], "big"), pos + n
    if pos + length > end:
        raise ValueError("value exceeds its container")
    return tag, pos, pos + length


def utc_time(value):
    """IEC 61850-8-1 §8.1.3.7 UtcTime: 4 bytes seconds, 3 bytes fraction of second, 1 byte time quality."""
    if len(value) != 8:
        return None
    seconds = int.from_bytes(value[:4], "big") + int.from_bytes(value[4:7], "big") / 2 ** 24
    return datetime.fromtimestamp(seconds, tz=timezone.utc).isoformat(timespec="milliseconds").replace("+00:00", "Z")


def _decode_data(buf, start, end, depth=0):
    items, pos = [], start
    while pos < end:
        tag, vs, ve = _tlv(buf, pos, end)
        value = bytes(buf[vs:ve])
        kind = DATA_KINDS.get(tag, f"tag-0x{tag:02X}")
        if tag in (0xA1, 0xA2):
            if depth > 10:
                raise ValueError("data nested too deeply")
            items.append((kind, _decode_data(buf, vs, ve, depth + 1)))
        elif tag == 0x83:
            items.append((kind, value != b"\x00" and len(value) > 0))
        elif tag == 0x84:
            pad = value[0] if value else 0
            bits = "".join(f"{b:08b}" for b in value[1:])
            items.append((kind, bits[:len(bits) - pad] if pad <= len(bits) else bits))
        elif tag == 0x85:
            items.append((kind, int.from_bytes(value, "big", signed=True) if value else 0))
        elif tag == 0x86:
            items.append((kind, int.from_bytes(value, "big", signed=False) if value else 0))
        elif tag == 0x87:
            if len(value) == 5:
                items.append((kind, round(struct.unpack(">f", value[1:])[0], 6)))
            elif len(value) == 9:
                items.append((kind, struct.unpack(">d", value[1:])[0]))
            else:
                items.append((kind, value.hex()))
        elif tag in (0x8A, 0x90):
            items.append((kind, value.decode("latin-1").rstrip("\x00")))
        elif tag == 0x91:
            items.append((kind, utc_time(value)))
        else:
            items.append((kind, value.hex()))
        pos = ve
    return items


def decode_frame(frame):
    """Decode one Ethernet frame. Returns None for non-GOOSE frames, a dict for GOOSE frames.
    A dict with an 'error' key is returned for GOOSE frames that cannot be fully decoded."""
    if len(frame) < 14:
        return None
    dst, src = frame[0:6], frame[6:12]
    pos, vlan_id, vlan_pri = 12, None, None
    ethertype = int.from_bytes(frame[pos:pos + 2], "big")
    while ethertype in VLAN_TPIDS and pos + 6 <= len(frame):
        tci = int.from_bytes(frame[pos + 2:pos + 4], "big")
        vlan_pri, vlan_id = tci >> 13, tci & 0x0FFF
        pos += 4
        ethertype = int.from_bytes(frame[pos:pos + 2], "big")
    if ethertype != GOOSE_ETHERTYPE:
        return None
    result = {"dst_mac": "-".join(f"{b:02X}" for b in dst), "src_mac": "-".join(f"{b:02X}" for b in src),
              "vlan_id": vlan_id, "vlan_priority": vlan_pri}
    hdr = pos + 2
    try:
        if hdr + 8 > len(frame):
            raise ValueError("truncated GOOSE header")
        appid, length, reserved1 = struct.unpack(">HHH", frame[hdr:hdr + 6])
        result.update(appid=f"{appid:04X}", header_simulation=bool(reserved1 & 0x8000))
        end = min(len(frame), hdr + length) if length >= 8 else len(frame)
        tag, vs, ve = _tlv(frame, hdr + 8, end)
        if tag != 0x61:
            raise ValueError(f"unexpected APDU tag 0x{tag:02X}")
        pos = vs
        while pos < ve:
            tag, fs, fe = _tlv(frame, pos, ve)
            value = bytes(frame[fs:fe])
            name = PDU_FIELDS.get(tag)
            if name in ("gocb_ref", "dat_set", "go_id"):
                result[name] = value.decode("latin-1")
            elif name in ("tal", "st_num", "sq_num", "conf_rev", "num_entries"):
                result[name] = int.from_bytes(value, "big") if value else 0
            elif name in ("simulation", "nds_com"):
                result[name] = value != b"\x00" and len(value) > 0
            elif name == "t":
                result[name] = utc_time(value)
            elif tag == 0xAB:
                result["all_data"] = _decode_data(frame, fs, fe)
            pos = fe
    except (ValueError, struct.error, IndexError) as e:
        result["error"] = str(e)
    return result


# ---------------------------------------------------------------------------
# Per-stream summary
# ---------------------------------------------------------------------------

def data_signature(items):
    """Type structure of allData, e.g. ['boolean', ['bit-string', 'utc-time']]."""
    return [data_signature(v) if k in ("structure", "array") else k for k, v in items]


def summarize_capture(path):
    """Read a capture and summarise every GOOSE stream it contains."""
    totals = {"frames": 0, "goose_frames": 0, "decode_errors": 0, "non_ethernet": 0, "start": None, "end": None}
    streams = {}
    for ts, linktype, frame in read_capture(path):
        totals["frames"] += 1
        if linktype != LINKTYPE_ETHERNET:
            totals["non_ethernet"] += 1
            continue
        g = decode_frame(frame)
        if g is None:
            continue
        totals["goose_frames"] += 1
        if ts is not None:
            totals["start"] = ts if totals["start"] is None else min(totals["start"], ts)
            totals["end"] = ts if totals["end"] is None else max(totals["end"], ts)
        if "error" in g or "gocb_ref" not in g:
            totals["decode_errors"] += 1
            continue
        key = (g["src_mac"], g["dst_mac"], g["appid"], g["gocb_ref"])
        s = streams.get(key)
        if s is None:
            s = streams[key] = {
                "src_mac": g["src_mac"], "dst_mac": g["dst_mac"], "appid": g["appid"], "gocb_ref": g["gocb_ref"],
                "vlan_ids": set(), "vlan_priorities": set(), "go_ids": set(), "dat_sets": set(), "conf_revs": set(),
                "num_entries": set(), "tals_ms": set(), "simulation": False, "nds_com": False, "frames": 0,
                "first_ts": ts, "last_ts": ts, "max_gap_ms": None, "max_steady_gap_ms": None,
                "first_retransmission_ms": [], "tal_violations": [], "sq_gaps": 0, "st_resets": 0, "st_skips": 0,
                "events": [], "signatures": [], "last_values": None, "_prev": None,
            }
        s["frames"] += 1
        for field, target in (("vlan_id", "vlan_ids"), ("vlan_priority", "vlan_priorities"), ("go_id", "go_ids"),
                              ("dat_set", "dat_sets"), ("conf_rev", "conf_revs"), ("num_entries", "num_entries"),
                              ("tal", "tals_ms")):
            s[target].add(g.get(field))
        s["simulation"] |= bool(g.get("simulation")) or g.get("header_simulation", False)
        s["nds_com"] |= bool(g.get("nds_com"))
        values = g.get("all_data", [])
        sig = data_signature(values)
        if sig not in s["signatures"]:
            s["signatures"].append(sig)
        s["last_values"] = values

        prev = s["_prev"]
        st, sq = g.get("st_num"), g.get("sq_num")
        if prev is None or st != prev["st_num"]:
            if len(s["events"]) < MAX_EVENTS_PER_STREAM:
                s["events"].append({"ts": ts, "t": g.get("t"), "st_num": st, "sq_num": sq, "values": values})
        if prev is not None:
            gap = (ts - prev["ts"]) * 1000 if ts is not None and prev["ts"] is not None else None
            if gap is not None:
                s["max_gap_ms"] = gap if s["max_gap_ms"] is None else max(s["max_gap_ms"], gap)
                # §18.1.2.5: the next message must arrive within the previous message's timeAllowedToLive.
                if prev["tal"] is not None and gap > prev["tal"]:
                    s["tal_violations"].append({"ts": prev["ts"], "gap_ms": round(gap, 1), "tal_ms": prev["tal"]})
            if st == prev["st_num"]:
                if sq is not None and prev["sq_num"] is not None and sq > prev["sq_num"] + 1:
                    s["sq_gaps"] += sq - prev["sq_num"] - 1
                if gap is not None and prev["sq_num"] == 0 and sq == 1:
                    s["first_retransmission_ms"].append(round(gap, 1))
                elif gap is not None and (sq or 0) > 1:
                    s["max_steady_gap_ms"] = gap if s["max_steady_gap_ms"] is None else max(s["max_steady_gap_ms"], gap)
            elif st is not None and prev["st_num"] is not None:
                if st < prev["st_num"] and not (prev["st_num"] > 0xFFFFFF00 and st <= 1):
                    s["st_resets"] += 1
                elif st > prev["st_num"] + 1:
                    s["st_skips"] += st - prev["st_num"] - 1
        s["_prev"] = {"ts": ts, "st_num": st, "sq_num": sq, "tal": g.get("tal")}
        s["last_ts"] = ts if ts is not None else s["last_ts"]

    out = []
    for s in streams.values():
        s.pop("_prev")
        for k in ("vlan_ids", "vlan_priorities", "go_ids", "dat_sets", "conf_revs", "num_entries", "tals_ms"):
            s[k] = sorted(s[k], key=lambda v: (v is None, v))
        for k in ("max_gap_ms", "max_steady_gap_ms"):
            s[k] = round(s[k], 1) if s[k] is not None else None
        s["first_retransmission_ms"] = s["first_retransmission_ms"][:20]
        s["tal_violations"] = s["tal_violations"][:50]
        out.append(s)
    out.sort(key=lambda s: (s["gocb_ref"], s["src_mac"]))
    if totals["frames"] == 0:
        raise CaptureError("The capture contains no packets.")
    return {"totals": totals, "streams": out}
