import os
import shutil
import sqlite3
from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from app.database import init_db, get_db_connection
from app.parser import parse_and_validate_scl

app = FastAPI(title="VoltFlow Core Matrix Engine")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

UPLOAD_DIR = "uploaded_files"
os.makedirs(UPLOAD_DIR, exist_ok=True)

@app.on_event("startup")
def startup():
    init_db()

@app.post("/api/v1/upload")
async def upload_scl_file(file: UploadFile = File(...)):
    if not file.filename.lower().endswith(('.scd', '.cid', '.iid', '.icd', '.xml')):
        raise HTTPException(status_code=400, detail="Unsupported file format.")
    file_path = os.path.join(UPLOAD_DIR, file.filename)
    with open(file_path, "wb") as buffer:
        buffer.write(await file.read())
    try:
        parse_and_validate_scl(file_path)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    return {"status": "SUCCESS"}

def parse_appid_int(appid_str: str) -> int:
    if not appid_str or appid_str in ["—", "AUTO", "NONE"]:
        return -1
    try:
        return int(appid_str, 16)
    except ValueError:
        try:
            return int(appid_str)
        except ValueError:
            return -1

@app.get("/api/v1/graph-data")
def get_graph_data():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    ieds = cursor.execute("SELECT * FROM ieds").fetchall()
    links = cursor.execute("SELECT * FROM goose_links").fetchall()
    
    nodes_payload = [dict(ied) for ied in ieds]
    edges_payload = []
    
    publishers_registry = []
    subscribers_registry = []
    
    for link in links:
        link_dict = dict(link)
        parts = link_dict["xpath"].split("||")
        filename = parts[0]
        mode = parts[1]
        
        if mode == "PUB":
            publishers_registry.append({
                "ied": link_dict["publisher"],
                "dataset": parts[2],
                "cb_name": link_dict["app_id"],
                "filename": filename,
                "conf_rev": parts[3],
                "cb_appid": parts[4],
                "vlan_id": parts[5],
                "vlan_priority": parts[6],
                "mac_address": parts[7],
                "min_time": parts[8] if len(parts) > 8 else "—",
                "max_time": parts[9] if len(parts) > 9 else "—"
            })
        elif mode == "SUBSCRIBE":
            subscribers_registry.append({
                "pub_ied": link_dict["publisher"],
                "sub_ied": link_dict["subscriber"],
                "cb_name": link_dict["app_id"],
                "filename": filename,
                "expected_rev": parts[2],
                "expected_appid": parts[3] if len(parts) > 3 else "AUTO"
            })

    cursor.execute("""
        DELETE FROM validation_errors 
        WHERE rule_type IN (
            'CONF_REV_MISMATCH', 
            'APPID_MISMATCH', 
            'VLAN_MISMATCH',
            'DECOUPLED_GHOST_IMPORT', 
            'ORPHANED_STREAM', 
            'APPID_COLLISION', 
            'MULTICAST_MAC_DUPLICATE'
        )
    """)

    # AppID & MAC collision validations...
    appid_map = {}
    collided_cb_keys = set()
    for pub in publishers_registry:
        raw_appid = pub["cb_appid"].strip().upper().zfill(4)
        appid_int = parse_appid_int(raw_appid)
        if 0 <= appid_int <= 0x3FFF:
            cb_key = f"{pub['ied']}||{pub['cb_name']}"
            appid_map.setdefault(raw_appid, []).append((pub, cb_key))

    for appid_val, entries in appid_map.items():
        if len(entries) > 1:
            for pub_item, cb_key in entries:
                collided_cb_keys.add(cb_key)
                cursor.execute(
                    "INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) VALUES (?,?,?,?,?)",
                    (pub_item["ied"], "ERROR", "APPID_COLLISION",
                     f"Critical APPID Collision: Stream '{pub_item['cb_name']}' on '{pub_item['ied']}' reuses reserved APPID '{appid_val}'.",
                     f"{pub_item['filename']}||GSEControl")
                )

    edge_counter = 1
    parallel_track_matrix = {}

    for pub in publishers_registry:
        has_linked_receiver = False
        pub_cb_key = f"{pub['ied']}||{pub['cb_name']}"
        
        for sub in subscribers_registry:
            if pub["ied"] == sub["pub_ied"] and pub["cb_name"] == sub["cb_name"]:
                has_linked_receiver = True
                wire_id = f"e-{edge_counter}"
                
                sub_rev = pub["conf_rev"] if sub["expected_rev"] in ["AUTO", "—", ""] else sub["expected_rev"]
                sub_appid = pub["cb_appid"] if sub["expected_appid"] in ["AUTO", "—", ""] else sub["expected_appid"]
                pub_vlan = pub["vlan_id"] if pub["vlan_id"] else "000"

                is_rev_match = (str(pub["conf_rev"]).strip() == str(sub_rev).strip())
                is_appid_match = (str(pub["cb_appid"]).strip().upper() == str(sub_appid).strip().upper())

                if not is_rev_match:
                    cursor.execute(
                        "INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) VALUES (?,?,?,?,?)",
                        (sub["sub_ied"], "ERROR", "CONF_REV_MISMATCH", 
                         f"Revision Mismatch on '{pub['cb_name']}': Publisher has '{pub['conf_rev']}', Subscriber expected '{sub_rev}'. Target edge: {wire_id}", 
                         wire_id)
                    )

                if pub_cb_key in collided_cb_keys:
                    color_state = "RED"
                elif not is_rev_match or not is_appid_match:
                    color_state = "YELLOW"
                else:
                    color_state = "GREEN"

                wire_key = f"{pub['ied']}->{sub['sub_ied']}"
                current_idx = parallel_track_matrix.get(wire_key, 0)
                parallel_track_matrix[wire_key] = current_idx + 1

                edges_payload.append({
                    "id": edge_counter,
                    "publisher": pub["ied"],
                    "subscriber": sub["sub_ied"],
                    "app_id": pub["cb_name"],
                    "color_state": color_state,
                    "edge_index": current_idx,
                    "is_orphan_stub": False,
                    "network_details": {
                        "dataset": pub["dataset"],
                        "cb_name": pub["cb_name"],
                        "appid": pub["cb_appid"],
                        "mac_address": pub["mac_address"],
                        "vlan_id": pub_vlan,
                        "vlan_priority": pub["vlan_priority"],
                        "pub_rev": pub["conf_rev"],
                        "min_time": pub["min_time"],
                        "max_time": pub["max_time"],
                        "sub_rev": sub_rev,
                        "sub_appid": sub_appid,
                        "sub_vlan": pub_vlan,
                        "sub_pri": pub["vlan_priority"],
                        "sub_mac": pub["mac_address"]
                    }
                })
                edge_counter += 1

        # -------------------------------------------------------------------------
        # ORPHANED STREAM: FLOATING OUTBOUND TERMINAL STUB PATTERN
        # -------------------------------------------------------------------------
        if not has_linked_receiver:
            wire_id = f"e-{edge_counter}"
            
            cursor.execute(
                "INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) VALUES (?,?,?,?,?)",
                (pub["ied"], "WARNING", "ORPHANED_STREAM", 
                 f"Orphaned GOOSE Stream: Control Block '{pub['cb_name']}' has 0 global subscribers listening.", 
                 wire_id)
            )

            edges_payload.append({
                "id": edge_counter,
                "publisher": pub["ied"],
                "subscriber": pub["ied"],  # Self-targeting for layout coordinate binding
                "app_id": pub["cb_name"],
                "color_state": "AMBER",
                "edge_index": 0,
                "is_orphan_stub": True, # Triggers floating terminal stub rendering
                "network_details": {
                    "dataset": pub["dataset"],
                    "cb_name": pub["cb_name"],
                    "appid": pub["cb_appid"],
                    "mac_address": pub["mac_address"],
                    "vlan_id": pub["vlan_id"] or "000",
                    "vlan_priority": pub["vlan_priority"],
                    "pub_rev": pub["conf_rev"],
                    "min_time": pub["min_time"],
                    "max_time": pub["max_time"],
                    "sub_rev": "NONE",
                    "sub_appid": "0 LISTENERS",
                    "sub_vlan": "NONE",
                    "sub_pri": "NONE",
                    "sub_mac": pub["mac_address"]
                }
            })
            edge_counter += 1

    conn.commit()
    conn.close()
    return {"nodes": nodes_payload, "edges": edges_payload}

@app.get("/api/v1/errors")
def get_errors():
    conn = get_db_connection()
    cursor = conn.cursor()
    errors = cursor.execute("SELECT * FROM validation_errors").fetchall()
    conn.close()
    return [dict(err) for err in errors]

@app.delete("/api/v1/reset")
def reset_workspace():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM ieds")
    cursor.execute("DELETE FROM goose_links")
    cursor.execute("DELETE FROM validation_errors")
    conn.commit()
    conn.close()
    if os.path.exists(UPLOAD_DIR): shutil.rmtree(UPLOAD_DIR)
    os.makedirs(UPLOAD_DIR, exist_ok=True)
    return {"status": "CLEARED"}