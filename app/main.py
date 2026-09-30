import os
import shutil
from contextlib import asynccontextmanager
from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from app.database import init_db, get_db_connection, clear_all
from app.parser import parse_scl, store_parsed, SCLParseError
from app.analysis import analyze

UPLOAD_DIR = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "uploaded_files")
ALLOWED_EXTENSIONS = ('.scd', '.cid', '.iid', '.icd', '.ssd', '.sed', '.xml')


@asynccontextmanager
async def lifespan(_app):
    os.makedirs(UPLOAD_DIR, exist_ok=True)
    init_db()
    yield


app = FastAPI(title="VoltFlow Core Matrix Engine", lifespan=lifespan)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.post("/api/v1/upload")
async def upload_scl_file(file: UploadFile = File(...)):
    filename = os.path.basename(file.filename or "")
    if not filename.lower().endswith(ALLOWED_EXTENSIONS):
        raise HTTPException(status_code=400, detail="Unsupported file format.")

    os.makedirs(UPLOAD_DIR, exist_ok=True)
    file_path = os.path.join(UPLOAD_DIR, filename)
    with open(file_path, "wb") as buffer:
        buffer.write(await file.read())

    try:
        parsed = parse_scl(file_path)
    except SCLParseError as e:
        os.remove(file_path)
        raise HTTPException(status_code=422, detail=f"{filename}: {e}")

    conn = get_db_connection()
    try:
        store_parsed(conn, filename, parsed)
        conn.commit()
    finally:
        conn.close()
    return {"status": "SUCCESS", "file": filename, "ieds": [ied[0] for ied in parsed.ieds]}


def _analysis():
    conn = get_db_connection()
    try:
        return analyze(conn)
    finally:
        conn.close()


@app.get("/api/v1/graph-data")
def get_graph_data():
    result = _analysis()
    return {"nodes": result["nodes"], "edges": result["edges"]}


@app.get("/api/v1/errors")
def get_errors():
    return _analysis()["errors"]


@app.delete("/api/v1/reset")
def reset_workspace():
    conn = get_db_connection()
    try:
        clear_all(conn)
        conn.commit()
    finally:
        conn.close()
    if os.path.exists(UPLOAD_DIR):
        shutil.rmtree(UPLOAD_DIR)
    os.makedirs(UPLOAD_DIR, exist_ok=True)
    return {"status": "CLEARED"}
