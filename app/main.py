import os
import shutil
import sqlite3
from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from app.database import init_db, get_db_connection
from app.parser import parse_and_validate_scl

app = FastAPI(title="VoltFlow Production Matrix Engine")

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
        raise HTTPException(status_code=400, detail="Unsupported extension format.")
    file_path = os.path.join(UPLOAD_DIR, file.filename)
    with open(file_path, "wb") as buffer:
        buffer.write(await file.read())
    try:
        parse_and_validate_scl(file_path)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    return {"status": "SUCCESS"}

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
                "net_appid": parts[5],
                "vlan_id": parts[6],
                "vlan_priority": parts[7],
                "mac_address": parts[8],
                "min_time": parts[9] if len(parts) > 9 else "—",
                "max_time": parts[10] if len(parts) > 10 else "—"
            })
        elif mode == "SUBSCRIBE":
            subscribers_registry.append({
                "pub_ied": link_dict["publisher"],
                "sub_ied": link_dict["subscriber"],
                "cb_name": link_dict["app_id"],
                "filename": filename,
                "expected_rev": parts[2],
                "expected_appid": parts[3],
                "expected_vlan": parts[4],
                "expected_pri": parts[5],
                "expected_mac": parts[6]
            })

    cursor.execute("DELETE FROM validation_errors WHERE rule_type IN ('CONF_REV_MISMATCH', 'PARAMETER_SPACE_DRIFT')")
    
    edge_counter = 1
    parallel_track_matrix = {}

    for pub in publishers_registry:
        has_linked_receiver = False
        
        for sub in subscribers_registry:
            if pub["ied"] == sub["pub_ied"] and pub["cb_name"] == sub["cb_name"]:
                has_linked_receiver = True
                
                is_rev_match = (str(pub["conf_rev"]).strip() == str(sub["expected_rev"]).strip())
                is_appid_match = (str(pub["cb_appid"]).strip() == str(sub["expected_appid"]).strip()) if sub["expected_appid"] else True
                is_vlan_match = (str(pub["vlan_id"]).strip() == str(sub["expected_vlan"]).strip()) if sub["expected_vlan"] else True
                is_mac_match = (str(pub["mac_address"]).strip() == str(sub["expected_mac"]).strip()) if sub["expected_mac"] else True

                if is_rev_match and is_vlan_match and is_mac_match and is_appid_match:
                    color_state = "GREEN"
                else:
                    color_state = "YELLOW"

                if not is_rev_match:
                    cursor.execute(
                        "INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) VALUES (?,?,?,?,?)",
                        (sub["sub_ied"], "ERROR", "CONF_REV_MISMATCH", f"Revision Mismatch on '{pub['cb_name']}': Publisher has '{pub['conf_rev']}', Subscriber expected '{sub['expected_rev']}'.", f"{sub['filename']}||ExtRef")
                    )

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
                    "network_details": {
                        "dataset": pub["dataset"],
                        "cb_name": pub["cb_name"],
                        "appid": pub["cb_appid"],
                        "mac_address": pub["mac_address"],
                        "vlan_id": pub["vlan_id"],
                        "vlan_priority": pub["vlan_priority"],
                        "pub_rev": pub["conf_rev"],
                        "min_time": pub["min_time"],
                        "max_time": pub["max_time"],
                        "sub_rev": sub["expected_rev"] if sub["expected_rev"] else "—",
                        "sub_appid": sub["expected_appid"] if sub["expected_appid"] else "—",
                        "sub_vlan": sub["expected_vlan"] if sub["expected_vlan"] else "—",
                        "sub_pri": sub["expected_pri"] if sub["expected_pri"] else "—",
                        "sub_mac": sub["expected_mac"] if sub["expected_mac"] else "—"
                    }
                })
                edge_counter += 1

        if not has_linked_receiver:
            wire_key = f"{pub['ied']}->{pub['ied']}"
            current_idx = parallel_track_matrix.get(wire_key, 0)
            parallel_track_matrix[wire_key] = current_idx + 1

            edges_payload.append({
                "id": edge_counter,
                "publisher": pub["ied"],
                "subscriber": pub["ied"],
                "app_id": pub["cb_name"],
                "color_state": "RED",
                "edge_index": current_idx,
                "network_details": {
                    "dataset": pub["dataset"],
                    "cb_name": pub["cb_name"],
                    "appid": pub["cb_appid"],
                    "mac_address": pub["mac_address"],
                    "vlan_id": pub["vlan_id"],
                    "vlan_priority": pub["vlan_priority"],
                    "pub_rev": pub["conf_rev"],
                    "min_time": pub["min_time"],
                    "max_time": pub["max_time"],
                    "sub_rev": "—",
                    "sub_appid": "—",
                    "sub_vlan": "—",
                    "sub_pri": "—",
                    "sub_mac": "—"
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