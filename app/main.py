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
    Assembles graph elements, matching live data from individual vendor documents.
    """
    conn = get_db_connection()
    cursor = conn.cursor()
    
    ieds = cursor.execute("SELECT * FROM ieds").fetchall()
    links = cursor.execute("SELECT * FROM goose_links").fetchall()
    
    nodes_payload = [dict(ied) for ied in ieds]
    edges_payload = []
    
    # Pre-parse and map file trees for raw property checks
    files = [f for f in os.listdir(UPLOAD_DIR) if f.endswith(('.scd', '.xml', '.cid', '.icd'))]
    file_xml_caches = {}
    
    for f in files:
        f_path = os.path.join(UPLOAD_DIR, f)
        try:
            parser = etree.XMLParser(remove_blank_text=True)
            tree = etree.parse(f_path, parser=parser)
            for elem in tree.getiterator():
                if not (isinstance(elem, etree._Comment) or isinstance(elem, etree._ProcessingInstruction)):
                    elem.tag = etree.QName(elem).localname
            file_xml_caches[f] = tree.getroot()
        except Exception:
            pass

    for link in links:
        link_dict = dict(link)
        cb_name = link_dict["app_id"]
        pub_ied = link_dict["publisher"]
        sub_ied = link_dict["subscriber"]
        
        # Base values default strictly to TBC
        vlan_id = "TBC"
        vlan_priority = "TBC"
        mac_address = "TBC"
        appid = "TBC"
        pub_rev = "TBC"
        sub_rev = "TBC"
        
        # DYNAMIC DECOUPLED LOOKUP: Loop across independent vendor files
        for root in file_xml_caches.values():
            # Extract publisher configuration details natively
            for gse_cb in root.findall(f".//GSEControl[@name='{cb_name}']"):
                p_ied = gse_cb.getparent()
                while p_ied is not None and p_ied.tag != "IED":
                    p_ied = p_ied.getparent()
                if p_ied is not None and p_ied.get("name") == pub_ied:
                    pub_rev = gse_cb.get("confRev", "TBC")
            
            for gse in root.findall(f".//ConnectedAP/GSE[@cbName='{cb_name}']"):
                cap = gse.getparent()
                if cap.get("iedName") == pub_ied:
                    mac_elem = gse.find(".//P[@type='MAC-Address']")
                    vlan_elem = gse.find(".//P[@type='VLAN-ID']")
                    pri_elem = gse.find(".//P[@type='VLAN-PRIORITY']")
                    appid_elem = gse.find(".//P[@type='APPID']")
                    
                    if mac_elem is not None: mac_address = mac_elem.text
                    if vlan_elem is not None: vlan_id = vlan_elem.text
                    if pri_elem is not None: vlan_priority = pri_elem.text
                    if appid_elem is not None: appid = appid_elem.text

            # Extract subscriber expected versions natively
            for extref in root.findall(".//ExtRef"):
                if extref.get("iedName") == pub_ied and extref.get("srcCBName") == cb_name:
                    s_ied = extref.getparent()
                    while s_ied is not None and s_ied.tag != "IED":
                        s_ied = s_ied.getparent()
                    if s_ied is not None and s_ied.get("name") == sub_ied:
                        sub_rev = extref.get("srcSubVersion", "TBC")

        link_dict["network_details"] = {
            "vlan_id": vlan_id if vlan_id else "TBC",
            "vlan_priority": vlan_priority if vlan_priority else "TBC",
            "mac_address": mac_address if mac_address else "TBC",
            "appid": appid if appid else "TBC",
            "pub_rev": pub_rev if pub_rev else "TBC",
            "sub_rev": sub_rev if sub_rev else "TBC"
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