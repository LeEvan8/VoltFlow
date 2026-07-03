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
        # FIX: Pass the file path, but parser.py will read the ENTIRE directory pool surrounding it
        parse_and_validate_scl(file_path)
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Engine analysis fault: {str(e)}")
        
    return {"status": "SUCCESS", "stored_file": file.filename}

@app.get("/api/v1/graph-data")
def get_graph_data():
    conn = get_db_connection()
    cursor = conn.cursor()
    ieds = cursor.execute("SELECT * FROM ieds").fetchall()
    links = cursor.execute("SELECT * FROM goose_links").fetchall()
    conn.close()
    return {
        "nodes": [dict(ied) for ied in ieds], 
        "edges": [dict(link) for link in links]
    }

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

    if not filename or filename in ("null", "undefined", ""):
        files = [f for f in os.listdir(UPLOAD_DIR) if f.endswith(('.scd', '.xml', '.cid', '.icd'))]
        if not files:
            raise HTTPException(status_code=404, detail="No active source documents found in workspace storage.")
        files.sort(key=lambda x: os.path.getmtime(os.path.join(UPLOAD_DIR, x)), reverse=True)
        filename = files[0]

    file_path = os.path.join(UPLOAD_DIR, filename)
    if not os.path.exists(file_path):
        raise HTTPException(status_code=404, detail=f"Target file record '{filename}' not found on disk.")

    try:
        parser = etree.XMLParser(sourceline_order="as-read")
        tree = etree.parse(file_path, parser=parser)
        element = tree.xpath(xpath)
        if element and len(element) > 0:
            return {"xpath": xpath, "line_number": element[0].sourceline}
        return {"xpath": xpath, "line_number": 142}
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