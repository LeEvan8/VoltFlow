"""Builds GOOSE frames and pcap/pcapng files for tests (IEC 61850-8-1 Annex A encoding). Files only; never transmits."""
import struct


def tlv(tag, value):
    n = len(value)
    if n < 0x80:
        length = bytes([n])
    elif n < 0x100:
        length = bytes([0x81, n])
    else:
        length = bytes([0x82]) + n.to_bytes(2, "big")
    return bytes([tag]) + length + value


def boolean(v):
    return tlv(0x83, b"\x01" if v else b"\x00")


def integer(v, size=4):
    return tlv(0x85, v.to_bytes(size, "big", signed=True))


def unsigned(v, size=4):
    return tlv(0x86, v.to_bytes(size, "big"))


def float32(v):
    return tlv(0x87, b"\x08" + struct.pack(">f", v))


def bits(bitstring):
    pad = (-len(bitstring)) % 8
    padded = bitstring + "0" * pad
    return tlv(0x84, bytes([pad]) + bytes(int(padded[i:i + 8], 2) for i in range(0, len(padded), 8)))


def quality(validity="00"):
    return bits(validity + "0" * 11)


def utc_bytes(seconds):
    """IEC 61850-8-1 §8.1.3.7 UtcTime: seconds (4), fraction of second (3), time quality (1)."""
    whole = int(seconds)
    return whole.to_bytes(4, "big") + int((seconds - whole) * 2 ** 24).to_bytes(3, "big") + b"\x0a"


def utc(seconds):
    return tlv(0x91, utc_bytes(seconds))


def visible(s):
    return tlv(0x8A, s.encode())


def structure(*items):
    return tlv(0xA2, b"".join(items))


def goose_frame(*, gocb_ref, dat_set, go_id, all_data, st=1, sq=0, conf_rev=1, tal=2000, appid=0x0001,
                dst="01-0C-CD-01-00-01", src="00-11-22-33-44-55", vlan=None, simulation=False, header_simulation=False,
                nds_com=False, num_entries=None, t=1_700_000_000.0):
    pdu = b"".join([
        tlv(0x80, gocb_ref.encode()), tlv(0x81, tal.to_bytes(4, "big")), tlv(0x82, dat_set.encode()),
        tlv(0x83, go_id.encode()), tlv(0x84, utc_bytes(t)), tlv(0x85, st.to_bytes(4, "big")),
        tlv(0x86, sq.to_bytes(4, "big")), tlv(0x87, b"\x01" if simulation else b"\x00"), tlv(0x88, conf_rev.to_bytes(4, "big")),
        tlv(0x89, b"\x01" if nds_com else b"\x00"),
        tlv(0x8A, (len(all_data) if num_entries is None else num_entries).to_bytes(4, "big")),
        tlv(0xAB, b"".join(all_data)),
    ])
    apdu = tlv(0x61, pdu)
    header = struct.pack(">HHHH", appid, 8 + len(apdu), 0x8000 if header_simulation else 0, 0)
    eth = bytes.fromhex(dst.replace("-", "")) + bytes.fromhex(src.replace("-", ""))
    if vlan is not None:
        vid, pri = vlan
        eth += struct.pack(">HH", 0x8100, (pri << 13) | vid)
    return eth + struct.pack(">H", 0x88B8) + header + apdu


def other_frame():
    """An ARP frame: not GOOSE, must be skipped."""
    return bytes.fromhex("ffffffffffff" "001122334455" "0806") + b"\x00" * 28


def write_pcap(path, packets, endian="<", nano=False, linktype=1):
    magic = 0xA1B23C4D if nano else 0xA1B2C3D4
    with open(path, "wb") as f:
        f.write(struct.pack(endian + "IHHiIII", magic, 2, 4, 0, 0, 65535, linktype))
        for ts, frame in packets:
            sec = int(ts)
            frac = round((ts - sec) * (1e9 if nano else 1e6))
            f.write(struct.pack(endian + "IIII", sec, frac, len(frame), len(frame)) + frame)


def write_pcapng(path, packets, tsresol=None, endian="<", simple=False):
    def block(btype, body):
        body += b"\x00" * ((-len(body)) % 4)
        total = 12 + len(body)
        return struct.pack(endian + "II", btype, total) + body + struct.pack(endian + "I", total)

    ticks = 1e6
    options = b""
    if tsresol is not None:
        options = struct.pack(endian + "HH", 9, 1) + bytes([tsresol]) + b"\x00\x00\x00" + struct.pack(endian + "HH", 0, 0)
        ticks = float(2 ** (tsresol & 0x7F)) if tsresol & 0x80 else float(10 ** tsresol)
    with open(path, "wb") as f:
        f.write(block(0x0A0D0D0A, struct.pack(endian + "IHHq", 0x1A2B3C4D, 1, 0, -1)))
        f.write(block(1, struct.pack(endian + "HHI", 1, 0, 65535) + options))
        for ts, frame in packets:
            if simple:
                f.write(block(3, struct.pack(endian + "I", len(frame)) + frame))
            else:
                t = int(round(ts * ticks))
                f.write(block(6, struct.pack(endian + "IIIII", 0, t >> 32, t & 0xFFFFFFFF, len(frame), len(frame)) + frame))
