"""Standard references for every validation rule, shown in the UI and in exported reports.

Clause numbers refer to the documents the rules were written against:
IEC 61850-6 Ed2.1 (SCL), IEC 61850-7-1 Ed2.1 (Annex H: subscription engineering) and
IEC 61850-8-1 Ed2 AMD1 (GOOSE mapping). Where a rule rests on the base 8-1 Ed2 text rather than
AMD1, the reference says so.
"""

P6_GSE = "IEC 61850-6 §9.3.10 (GSE control block)"
P6_DATASET = "IEC 61850-6 §9.3.7 (data set definition)"
P6_EXTREF = "IEC 61850-6 §9.3.13, Table 34 (ExtRef)"
P6_GSE_ADDR = "IEC 61850-6 §9.4.4 (GSE address)"
P81_L2 = "IEC 61850-8-1 §25.3.2, Table 163 (GOOSE layer 2 addressing)"
P81_MAC = "IEC 61850-8-1 Annex B (multicast address selection)"
P81_APPID = "IEC 61850-8-1 Annex C, Table C.2 (APPID type)"
P81_CONFREV = "IEC 61850-8-1 §18.1.2.5 (SendGOOSEMessage: confRev)"
P71_H = "IEC 61850-7-1 Annex H (GOOSE/SMV subscription configuration)"

RULE_REFERENCES = {
    # control block configuration
    "CONF_REV_MISSING": f"{P6_GSE}: confRev is mandatory for GOOSE",
    "CONF_REV_ZERO": f"{P6_GSE}: confRev 0 only without a data set",
    "DATASET_NOT_FOUND": f"{P6_GSE}: datSet must be a valid data set reference",
    "CONFREV_NOT_INCREMENTED": f"{P6_GSE}: confRev shall be incremented on any data set change",
    "CONFREV_DECREASED": f"{P6_GSE}: confRev is incremented on changes, so it should never go down",
    "GOID_DUPLICATE": f"{P6_GSE}, Table 28: appID (GoID) is system-wide unique",
    "MISSING_GSE_ADDRESS": f"{P81_L2}: every configured GSEControl needs a GSE element",
    "GOOSE_TIMING": f"{P6_GSE_ADDR}: MinTime / MaxTime in ms",
    # addresses
    "APPID_MISSING": P81_L2,
    "APPID_FORMAT": "IEC 61850-6 Annex A (tP_APPID: 4 hex characters); " + P81_L2,
    "APPID_RANGE": P81_APPID,
    "APPID_UNCONFIGURED": "IEC 61850-8-1 Ed2 Annex C (base edition, not in the AMD1 text): 0x0000 is the reserved default",
    "APPID_COLLISION": "IEC 61850-8-1 Ed2 Annex C (base edition): unique, source-oriented APPIDs are strongly recommended",
    "MAC_MISSING": P81_L2,
    "MAC_FORMAT": "IEC 61850-6 Annex A (tP_MAC-Address); " + P81_L2,
    "MAC_UNCONFIGURED": f"{P81_MAC}: 00-00-00-00-00-00 means not configured",
    "MAC_NOT_MULTICAST": f"{P81_MAC}: the multicast bit shall be set",
    "MAC_OUTSIDE_RECOMMENDED_RANGE": f"{P81_MAC}, Table B.1 (informative recommended range)",
    "MULTICAST_MAC_DUPLICATE": P81_MAC,
    "VLAN_ID_FORMAT": "IEC 61850-6 Annex A (tP_VLAN-ID: 3 hex characters)",
    "VLAN_PRIORITY_FORMAT": "IEC 61850-6 Annex A (tP_VLAN-PRIORITY: 0-7)",
    # subscription resolution
    "SRC_LDINST_DEFAULT_MISMATCH": f"{P6_EXTREF}: srcLDInst defaults to ldInst when missing",
    "SRC_LDINST_MISMATCH": P6_EXTREF,
    "UNRESOLVED_SOURCE": P6_EXTREF,
    "AMBIGUOUS_SOURCE": P6_EXTREF,
    "PUBLISHER_NOT_LOADED": P6_EXTREF,
    "SUBSCRIBED_TO_UNUSED_CB": f"{P6_GSE}: a missing datSet indicates an unused control block",
    "SERVICE_TYPE_MISMATCH": f"{P6_EXTREF}: serviceType shall meet pServT",
    "DATASET_MEMBER_MISSING": f"{P6_DATASET}; {P6_EXTREF}",
    "ORPHANED_STREAM": P71_H,
    "DESTINATION_WITHOUT_INPUTS": f"{P71_H}; IEC 61850-6 Table 29 (IEDName)",
    "IEDNAME_NOT_LISTED": f"{P71_H}; IEC 61850-6 Table 29 (IEDName)",
    "SUBNETWORK_MISMATCH": f"{P71_H}.2: subscriber AP on the publisher's subnetwork",
    # publisher vs subscriber expectations
    "CONFREV_DESYNC": P81_CONFREV,
    "NETWORK_ROUTING_FAIL": f"{P81_L2}; {P81_CONFREV} (goID)",
    "FATAL_TYPE_MISMATCH": f"{P6_DATASET}: FCDA order and types define the message; {P81_CONFREV}",
    # network captures (what the IEDs actually send)
    "WIRE_CONFIG_MISMATCH": f"{P81_CONFREV}: message fields; {P81_L2}: addresses",
    "WIRE_SUBSCRIBER_MISMATCH": f"{P81_CONFREV}; {P81_L2}",
    "WIRE_TYPE_MISMATCH": f"IEC 61850-8-1 Annex A, Table A.2 (allData encoding); {P6_DATASET}",
    "WIRE_STREAM_INTERRUPTED": f"{P81_CONFREV}: timeAllowedToLive and the subscriber state machine (Figure 11)",
    "WIRE_MAXTIME_EXCEEDED": f"{P81_CONFREV}: retransmission interval up to MaxTime (Figure 8); {P6_GSE_ADDR}",
    "WIRE_FRAMES_LOST": f"{P81_CONFREV}: sqNum increments with each retransmission",
    "WIRE_STNUM_RESET": f"{P81_CONFREV}: stNum increments with each state change",
    "WIRE_SIMULATION": "IEC 61850-8-1 Annex C.2 (S bit) and §18.1.2.5 (simulation); IEC 61850-7-1 §7.8.2",
    "WIRE_NEEDS_COMMISSIONING": f"{P81_CONFREV}: ndsCom",
    "WIRE_DUPLICATE_STREAM": f"{P81_CONFREV}: gocbRef identifies one control block",
    "WIRE_UNKNOWN_STREAM": f"{P81_CONFREV}: gocbRef; not described by any loaded SCL file",
    "WIRE_NOT_SEEN": f"{P81_CONFREV}: a publisher retransmits at least every MaxTime",
    "WIRE_IED_SILENT": f"{P81_CONFREV}: a publisher retransmits at least every MaxTime",
}
