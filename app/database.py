import os
import sqlite3
from pathlib import Path

# Anchored to the project root so the DB doesn't depend on the working directory.
DB_PATH = os.environ.get("VOLTFLOW_DB", str(Path(__file__).resolve().parent.parent / "voltflow.db"))

# Bump when the schema changes; older databases are dropped and rebuilt (re-upload files).
SCHEMA_VERSION = 7

SCHEMA = """
-- One row per uploaded file. seq orders uploads: the latest file containing an IED is its
-- authoritative copy; copies of that IED in other files are what those files *expect*.
CREATE TABLE files (
    name TEXT PRIMARY KEY,
    seq  INTEGER NOT NULL
);

CREATE TABLE ieds (
    source_file  TEXT NOT NULL,
    name         TEXT NOT NULL,
    type         TEXT,
    manufacturer TEXT,
    PRIMARY KEY (source_file, name)
);

-- GSEControl (IEC 61850-6 9.3.10) joined with its Communication GSE address (9.4.4).
CREATE TABLE gse_controls (
    source_file   TEXT NOT NULL,
    ied_name      TEXT NOT NULL,
    ld_inst       TEXT NOT NULL,
    cb_name       TEXT NOT NULL,
    cb_type       TEXT,
    dataset       TEXT,
    conf_rev      TEXT,
    go_id         TEXT,
    has_address   INTEGER NOT NULL,
    mac_address   TEXT,
    appid         TEXT,
    vlan_id       TEXT,
    vlan_priority TEXT,
    min_time      TEXT,
    max_time      TEXT,
    dataset_found INTEGER NOT NULL,  -- datSet names a DataSet that exists in the same LLN0
    subnetwork    TEXT,              -- SubNetwork of the ConnectedAP holding the GSE address
    ap_name       TEXT,
    ld_name       TEXT,              -- LDevice@ldName if set; otherwise the LD name is IED name + ldInst
    PRIMARY KEY (source_file, ied_name, ld_inst, cb_name)
);

-- GSEControl/IEDName: subscribers the publisher is configured to send to (IEC 61850-7-1 Annex H).
CREATE TABLE gse_destinations (
    source_file TEXT NOT NULL,
    ied_name    TEXT NOT NULL,
    ld_inst     TEXT NOT NULL,
    cb_name     TEXT NOT NULL,
    dest_ied    TEXT NOT NULL
);

-- FCDA members of data sets referenced by a GSEControl (IEC 61850-6 9.3.7).
CREATE TABLE dataset_members (
    source_file TEXT NOT NULL,
    ied_name    TEXT NOT NULL,
    ld_inst     TEXT NOT NULL,
    dataset     TEXT NOT NULL,
    fcda_ld     TEXT,
    prefix      TEXT,
    ln_class    TEXT,
    ln_inst     TEXT,
    do_name     TEXT,
    da_name     TEXT,
    fc          TEXT,
    leaf_types  TEXT  -- JSON [[path, bType], ...] resolved via DataTypeTemplates; NULL = unknown
);

-- Bound Inputs/ExtRef elements (IEC 61850-6 9.3.13). Unbound templates (no iedName) are skipped.
CREATE TABLE extrefs (
    source_file  TEXT NOT NULL,
    sub_ied      TEXT NOT NULL,
    pub_ied      TEXT NOT NULL,
    ld_inst      TEXT,
    prefix       TEXT,
    ln_class     TEXT,
    ln_inst      TEXT,
    do_name      TEXT,
    da_name      TEXT,
    service_type TEXT,
    src_ld_inst  TEXT,
    src_cb_name  TEXT,
    p_serv_t     TEXT  -- expected service type from an input template (pServT)
);

-- Subscriber-side expectations from vendor records (standard ExtRefs carry none of these values).
-- ld_inst is the LD of the subscribed control block when the record states it.
CREATE TABLE vendor_subscriptions (
    source_file   TEXT NOT NULL,
    sub_ied       TEXT NOT NULL,
    pub_ied       TEXT NOT NULL,
    ld_inst       TEXT,
    cb_name       TEXT NOT NULL,
    conf_rev      TEXT,
    appid         TEXT,
    mac_address   TEXT,
    vlan_id       TEXT,
    vlan_priority TEXT,
    dataset       TEXT,
    go_id         TEXT,
    record_type   TEXT NOT NULL
);

-- Per-signal expected types from ExtRef companion records (e.g. Schneider bType).
CREATE TABLE vendor_signal_types (
    source_file TEXT NOT NULL,
    sub_ied     TEXT NOT NULL,
    pub_ied     TEXT NOT NULL,
    cb_name     TEXT NOT NULL,
    cb_ld       TEXT,
    sig_ld      TEXT,
    prefix      TEXT,
    ln_class    TEXT,
    ln_inst     TEXT,
    do_name     TEXT NOT NULL,
    da_name     TEXT,
    b_type      TEXT NOT NULL
);

-- Network captures (pcap/pcapng) summarised per GOOSE stream; compared against the SCL at analysis time.
CREATE TABLE captures (
    name         TEXT PRIMARY KEY,
    seq          INTEGER NOT NULL,
    summary_json TEXT NOT NULL
);

-- User's choice of which uploaded file is authoritative for an IED (overrides "latest upload wins").
CREATE TABLE ied_sources (
    ied_name    TEXT PRIMARY KEY,
    source_file TEXT NOT NULL
);

-- Communication/SubNetwork/ConnectedAP: which subnetwork each IED access point is on.
CREATE TABLE connected_aps (
    source_file TEXT NOT NULL,
    ied_name    TEXT NOT NULL,
    ap_name     TEXT,
    subnetwork  TEXT
);
"""

DATA_TABLES = ["ieds", "gse_controls", "gse_destinations", "dataset_members", "extrefs", "vendor_subscriptions",
               "vendor_signal_types", "connected_aps"]


def get_db_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn


def init_db():
    conn = get_db_connection()
    try:
        version = conn.execute("PRAGMA user_version").fetchone()[0]
        if version != SCHEMA_VERSION:
            existing = [r[0] for r in conn.execute("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%'")]
            for table in existing:
                conn.execute(f'DROP TABLE "{table}"')
            conn.executescript(SCHEMA)
            conn.execute(f"PRAGMA user_version = {SCHEMA_VERSION}")
        conn.commit()
    finally:
        conn.close()


def clear_all(conn):
    for table in ["files", "ied_sources", "captures", *DATA_TABLES]:
        conn.execute(f"DELETE FROM {table}")


def remove_file(conn, filename):
    """Forget everything parsed from one file, including authority choices that pointed at it."""
    for table in DATA_TABLES:
        conn.execute(f"DELETE FROM {table} WHERE source_file = ?", (filename,))
    conn.execute("DELETE FROM ied_sources WHERE source_file = ?", (filename,))
    return conn.execute("DELETE FROM files WHERE name = ?", (filename,)).rowcount
