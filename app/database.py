import sqlite3

def init_db():
    conn = sqlite3.connect("voltflow.db")
    cursor = conn.cursor()
    
    # Track physical device instances
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS ieds (
            name TEXT PRIMARY KEY,
            type TEXT,
            subnetwork TEXT
        )
    """)
    
    # Store directional structural link parameters globally
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS goose_links (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            publisher TEXT,
            subscriber TEXT,
            app_id TEXT,
            xpath TEXT
        )
    """)
    
    # Store calculated compliance anomalies
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS validation_errors (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            ied_name TEXT,
            severity TEXT,
            rule_type TEXT,
            message TEXT,
            xpath TEXT
        )
    """)
    
    conn.commit()
    conn.close()

def get_db_connection():
    conn = sqlite3.connect("voltflow.db")
    conn.row_factory = sqlite3.Row
    return conn