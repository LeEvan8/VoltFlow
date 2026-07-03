import sqlite3
import os

DB_PATH = "voltflow.db"

def get_db_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

def init_db():
    """Initializes tables mapped directly to Phase 2/3 requirements."""
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # 1. IED Inventory Table (Drives React Flow Nodes in Phase 2)
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS ieds (
            name TEXT PRIMARY KEY,
            type TEXT,
            subnetwork TEXT
        )
    """)
    
    # 2. GOOSE Edge Table (Drives React Flow Animated Wires in Phase 2)
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS goose_links (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            publisher TEXT,
            subscriber TEXT,
            app_id TEXT,
            xpath TEXT,
            FOREIGN KEY(subscriber) REFERENCES ieds(name)
        )
    """)
    
    # 3. Validation Errors Table (Drives Phase 3 Sidebar & Line Jump)
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS validation_errors (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            ied_name TEXT,
            severity TEXT,
            rule_type TEXT,
            message TEXT,
            xpath TEXT,
            FOREIGN KEY(ied_name) REFERENCES ieds(name)
        )
    """)
    
    conn.commit()
    conn.close()