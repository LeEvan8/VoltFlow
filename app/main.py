import os
import shutil
import sqlite3
from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from lxml import etree
from app.database import init_db, get_db_connection
from app.parser import parse_and_validate_scl

app = FastAPI(title="VoltFlow Unified Multi-Vendor Engine")

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
    allowed_extensions = ('.scd', '.cid', '.icd', '.xml')
    if not file.filename.lower().endswith(allowed_extensions):
        raise HTTPException(
            status_code=400, 
            detail=f"Unsupported file format. System only accepts valid SCL profiles: {', '.join(allowed_extensions)}"
        )

    file_path = os.path.join(UPLOAD_DIR, file.filename)
    with open(file_path, "wb") as buffer:
        buffer.write(await file.read())
        
    try:
        parse_and_validate_scl(file_path)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Engine analysis fault: {str(e)}")
        
    return {"status": "SUCCESS", "stored_file": file.filename}

@app.get("/api/v1/graph-data")
def get_graph_data():
    """
    Phase 2/3 Canvas Integration Route.
    Attaches explicitly read network parameters to individual GOOSE links without fallbacks.
    """
    conn = get_db_connection()
    cursor = conn.cursor()
    
    ieds = cursor.execute("SELECT * FROM ieds").fetchall()
    links = cursor.execute("SELECT * FROM goose_links").fetchall()
    
    nodes_payload = [dict(ied) for ied in ieds]
    edges_payload = []
    
    for link in links:
        link_dict = dict(link)
        cb_name = link_dict["app_id"]
        pub_ied = link_dict["publisher"]
        
        # Pull baseline attributes extracted during parser engine loops
        errors = cursor.execute(
            "SELECT rule_type, message FROM validation_errors WHERE ied_name = ? AND message LIKE ?",
            (pub_ied, f"%{cb_name}%")
        ).fetchall()
        
        # Absolute structural baseline: default parameters read as TBC unless explicitly resolved
        vlan_id = "TBC"
        vlan_priority = "TBC"
        mac_address = "TBC"
        appid = "TBC"
        config_rev = "TBC"
        
        # Attempt to read data configuration parameters out of validation logs if captured
        for err in errors:
            msg = err["message"]
            if err["rule_type"] == "MAC_OUT_OF_RANGE":
                mac_address = msg.split("'")[1] if "'" in msg else mac_address
            elif err["rule_type"] == "VLAN_OUT_OF_RANGE":
                vlan_id = msg.split("'")[1] if "'" in msg else vlan_id
            elif err["rule_type"] == "VLAN_PRIORITY_LOW":
                vlan_priority = msg.split("'")[1] if "'" in msg else vlan_priority
            elif err["rule_type"] == "APPID_OUT_OF_BOUNDS":
                appid = msg.split("'")[1] if "'" in msg else appid
            elif err["rule_type"] == "CONF_REV_MISMATCH":
                config_rev = msg.split("'")[3] if len(msg.split("'")) >= 4 else config_rev

        # If no error parameter was captured, inspect structural XML index trackers for healthy values
        # This scans the underlying files dynamically if they are clear of range violation errors
        if vlan_id == "TBC" or vlan_priority == "TBC" or mac_address == "TBC" or appid == "TBC" or config_rev == "TBC":
            files = [f for f in os.listdir(UPLOAD_DIR) if f.endswith(('.scd', '.xml', '.cid', '.icd'))]
            for f in files:
                f_path = os.path.join(UPLOAD_DIR, f)
                try:
                    parser = etree.XMLParser(remove_blank_text=True)
                    tree = etree.parse(f_path, parser=parser)
                    
                    # Clean namespaces locally for robust scanning loops
                    for elem in tree.getiterator():
                        if not (isinstance(elem, etree._Comment) or isinstance(elem, etree._ProcessingInstruction)):
                            elem.tag = etree.QName(elem).localname
                    root = tree.getroot()
                    
                    # Search for matching publisher control block definitions
                    for gse_cb in root.findall(f".//GSEControl[@name='{cb_name}']"):
                        parent_ied = gse_cb.getparent()
                        while parent_ied is not None and parent_ied.tag != "IED":
                            parent_ied = parent_ied.getparent()
                        
                        if parent_ied is not None and parent_ied.get("name") == pub_ied:
                            if config_rev == "TBC":
                                config_rev = gse_cb.get("confRev", "TBC")
                    
                    # Search for connected communications configurations blocks
                    for gse in root.findall(f".//ConnectedAP/GSE[@cbName='{cb_name}']"):
                        cap = gse.getparent()
                        if cap.get("iedName") == pub_ied:
                            if mac_address == "TBC":
                                mac_elem = gse.find(".//P[@type='MAC-Address']")
                                if mac_elem is not None: mac_address = mac_elem.text
                            if vlan_id == "TBC":
                                vlan_elem = gse.find(".//P[@type='VLAN-ID']")
                                if vlan_elem is not None: vlan_id = vlan_elem.text
                            if vlan_priority == "TBC":
                                pri_elem = gse.find(".//P[@type='VLAN-PRIORITY']")
                                if pri_elem is not None: vlan_priority = pri_elem.text
                            if appid == "TBC":
                                appid_elem = gse.find(".//P[@type='APPID']")
                                if appid_elem is not None: appid = appid_elem.text
                except Exception:
                    pass

        link_dict["network_details"] = {
            "vlan_id": vlan_id if vlan_id else "TBC",
            "vlan_priority": vlan_priority if vlan_priority else "TBC",
            "mac_address": mac_address if mac_address else "TBC",
            "appid": appid if appid else "TBC",
            "config_rev": config_rev if config_rev else "TBC"
        }
        edges_payload.append(link_dict)
        
    conn.close()
    return {"nodes": nodes_payload, "edges": edges_payload}

@app.get("/api/v1/errors")
def get_errors():
    conn = get_db_connection()
    cursor = conn.cursor()
    errors = cursor.execute("SELECT * FROM validation_errors ORDER BY severity ASC").fetchall()
    conn.close()
    return [dict(err) for err in errors]

@app.get("/api/v1/line-index")
def get_line_number(xpath: str, filename: str = None):
    if "||" in xpath:
        filename, xpath = xpath.split("||", 1)

    file_path = os.path.join(UPLOAD_DIR, filename)
    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail=f"Target file record '{filename}' not found on disk.")

    try:
        parser = etree.XMLParser(sourceline_order="as-read")
        tree = etree.parse(file_path, parser=parser)
        element = tree.xpath(xpath)
        if element and len(element) > 0:
            return {"xpath": xpath, "line_number": element[0].sourceline}
        return {"xpath": xpath, "line_number": 1}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"XML live code stream indexing failed: {str(e)}")

@app.delete("/api/v1/reset")
def reset_workspace():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM ieds")
    cursor.execute("DELETE FROM goose_links")
    cursor.execute("DELETE FROM validation_errors")
    conn.commit()
    conn.close()
    
    if os.path.exists(UPLOAD_DIR):
        shutil.rmtree(UPLOAD_DIR)
    os.makedirs(UPLOAD_DIR, exist_ok=True)
    return {"status": "CLEARED", "message": "Substation workspace reset successfully."}