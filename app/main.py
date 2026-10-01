import logging
import os
import shutil
import tempfile
from contextlib import asynccontextmanager
from datetime import date
from typing import Optional
from fastapi import FastAPI, UploadFile, File, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse, Response
from pydantic import BaseModel
from app.database import init_db, get_db_connection, clear_all, remove_file
from app.parser import parse_scl, store_parsed, SCLParseError
from app.analysis import analyze
from app.report import build_report, render_html, links_csv, findings_csv
from app.compare import compare_scl, render_compare_html

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(name)s: %(message)s")
logger = logging.getLogger("voltflow")

# Override with VOLTFLOW_UPLOAD_DIR (e.g. for test runs) so the working uploads folder is never touched.
UPLOAD_DIR = os.environ.get("VOLTFLOW_UPLOAD_DIR",
                            os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "uploaded_files"))
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
    # Parse a temporary copy first so a failed re-upload never replaces a previously accepted file.
    temp_path = file_path + ".part"
    with open(temp_path, "wb") as buffer:
        buffer.write(await file.read())

    try:
        parsed = parse_scl(temp_path)
    except SCLParseError as e:
        os.remove(temp_path)
        logger.warning("Rejected upload %s: %s", filename, e)
        raise HTTPException(status_code=422, detail=f"{filename}: {e}")
    os.replace(temp_path, file_path)

    conn = get_db_connection()
    try:
        store_parsed(conn, filename, parsed)
        conn.commit()
    finally:
        conn.close()
    logger.info("Accepted upload %s: IEDs %s, %d GOOSE control blocks, %d bound inputs, %d vendor subscription records",
                filename, ", ".join(ied[0] for ied in parsed.ieds), len(parsed.gse_controls), len(parsed.extrefs),
                len(parsed.vendor_subscriptions))
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


@app.get("/api/v1/files")
def list_files():
    """Uploaded files in upload order, with the IEDs each one contains."""
    conn = get_db_connection()
    try:
        files = conn.execute("SELECT name, seq FROM files ORDER BY seq").fetchall()
        ieds = {}
        for row in conn.execute("SELECT source_file, name FROM ieds ORDER BY name"):
            ieds.setdefault(row["source_file"], []).append(row["name"])
        return [{"name": f["name"], "order": f["seq"], "ieds": ieds.get(f["name"], [])} for f in files]
    finally:
        conn.close()


@app.delete("/api/v1/files/{filename}")
def delete_file(filename: str):
    filename = os.path.basename(filename)
    conn = get_db_connection()
    try:
        if not remove_file(conn, filename):
            raise HTTPException(status_code=404, detail=f"{filename} is not in the workspace.")
        conn.commit()
    finally:
        conn.close()
    path = os.path.join(UPLOAD_DIR, filename)
    if os.path.exists(path):
        os.remove(path)
    logger.info("Removed %s from the workspace", filename)
    return {"status": "REMOVED", "file": filename}


class IedSource(BaseModel):
    source_file: Optional[str] = None  # None: back to "latest upload wins"


@app.put("/api/v1/ieds/{ied_name}/source")
def set_ied_source(ied_name: str, body: IedSource):
    """Choose which uploaded file is authoritative for an IED (e.g. its own CID rather than a copy in a subscriber's file)."""
    conn = get_db_connection()
    try:
        files = [r["source_file"] for r in conn.execute("SELECT source_file FROM ieds WHERE name = ?", (ied_name,))]
        if not files:
            raise HTTPException(status_code=404, detail=f"IED '{ied_name}' is not in any uploaded file.")
        if body.source_file is None:
            conn.execute("DELETE FROM ied_sources WHERE ied_name = ?", (ied_name,))
        elif body.source_file not in files:
            raise HTTPException(status_code=400, detail=f"'{body.source_file}' does not contain IED '{ied_name}'.")
        else:
            conn.execute("INSERT OR REPLACE INTO ied_sources (ied_name, source_file) VALUES (?, ?)", (ied_name, body.source_file))
        conn.commit()
    finally:
        conn.close()
    logger.info("Authoritative file for %s: %s", ied_name, body.source_file or "latest upload")
    return {"ied": ied_name, "source_file": body.source_file}


def _report():
    conn = get_db_connection()
    try:
        return build_report(conn)
    finally:
        conn.close()


@app.get("/api/v1/report.html", response_class=HTMLResponse)
def report_html():
    """Printable validation report (open in a browser and print to PDF)."""
    return HTMLResponse(render_html(_report()))


def _csv_download(content, name):
    filename = f"voltflow-{name}-{date.today().isoformat()}.csv"
    return Response(content, media_type="text/csv; charset=utf-8",
                    headers={"Content-Disposition": f'attachment; filename="{filename}"'})


@app.get("/api/v1/report/links.csv")
def report_links_csv():
    return _csv_download(links_csv(_report()), "links")


@app.get("/api/v1/report/findings.csv")
def report_findings_csv():
    return _csv_download(findings_csv(_report()), "findings")


@app.post("/api/v1/compare")
async def compare_versions(before: UploadFile = File(...), after: UploadFile = File(...), format: str = "json"):
    """Compare two versions of a project file. Nothing is stored; the workspace is not touched."""
    if format not in ("json", "html"):
        raise HTTPException(status_code=400, detail="format must be 'json' or 'html'.")
    parsed, names = [], []
    with tempfile.TemporaryDirectory() as tmp:
        for role, upload in (("before", before), ("after", after)):
            name = os.path.basename(upload.filename or "")
            if not name.lower().endswith(ALLOWED_EXTENSIONS):
                raise HTTPException(status_code=400, detail=f"{role} file '{name}': unsupported file format.")
            path = os.path.join(tmp, f"{role}_{name}")
            with open(path, "wb") as f:
                f.write(await upload.read())
            try:
                parsed.append(parse_scl(path))
            except SCLParseError as e:
                raise HTTPException(status_code=422, detail=f"{role} file '{name}': {e}")
            names.append(name)
    diff = compare_scl(parsed[0], parsed[1], names[0], names[1])
    logger.info("Compared %s -> %s: %s", names[0], names[1], diff["summary"])
    return HTMLResponse(render_compare_html(diff)) if format == "html" else diff


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
    logger.info("Workspace reset: all uploads and parsed data cleared")
    return {"status": "CLEARED"}
