import os

import pytest
from fastapi.testclient import TestClient

from app import database, main
from tests.conftest import scl, publisher, subscriber


@pytest.fixture
def client(tmp_path, monkeypatch):
    monkeypatch.setattr(database, "DB_PATH", str(tmp_path / "api.db"))
    monkeypatch.setattr(main, "UPLOAD_DIR", str(tmp_path / "uploads"))
    with TestClient(main.app) as c:  # runs the lifespan: creates the upload dir and schema
        yield c


def site_scd():
    pub_ied, pub_gse = publisher()
    return scl(pub_ied, subscriber(), gses=[pub_gse])


def upload(client, name, content):
    return client.post("/api/v1/upload", files={"file": (name, content.encode("utf-8"), "application/xml")})


def test_upload_then_graph_and_errors(client):
    res = upload(client, "site.scd", site_scd())
    assert res.status_code == 200
    assert res.json() == {"status": "SUCCESS", "file": "site.scd", "ieds": ["PUB", "SUB"]}
    assert os.path.exists(os.path.join(main.UPLOAD_DIR, "site.scd"))

    graph = client.get("/api/v1/graph-data").json()
    assert sorted(n["name"] for n in graph["nodes"]) == ["PUB", "SUB"]
    [edge] = graph["edges"]
    assert (edge["publisher"], edge["subscriber"], edge["app_id"]) == ("PUB", "SUB", "GCB1")
    assert client.get("/api/v1/errors").json() == []


def test_invalid_xml_is_rejected_without_leaking_server_paths(client, tmp_path):
    res = upload(client, "bad.scd", "this is not xml")
    assert res.status_code == 422
    detail = res.json()["detail"]
    assert detail.startswith("bad.scd: Not a readable XML file")
    assert "Start tag expected" in detail and "line 1, column 1" in detail
    assert str(tmp_path) not in detail and "file:/" not in detail  # no server-side path
    assert os.listdir(main.UPLOAD_DIR) == []  # temporary copy removed
    assert client.get("/api/v1/graph-data").json() == {"nodes": [], "edges": []}


def test_unsupported_extension(client):
    res = upload(client, "notes.txt", site_scd())
    assert res.status_code == 400


def test_filename_path_components_are_stripped(client, tmp_path):
    res = upload(client, "../../escape.scd", site_scd())
    assert res.status_code == 200 and res.json()["file"] == "escape.scd"
    assert os.listdir(main.UPLOAD_DIR) == ["escape.scd"]
    assert not (tmp_path.parent / "escape.scd").exists()


def test_failed_reupload_keeps_the_previous_file_and_data(client):
    assert upload(client, "site.scd", site_scd()).status_code == 200
    assert upload(client, "site.scd", "<broken").status_code == 422
    with open(os.path.join(main.UPLOAD_DIR, "site.scd"), encoding="utf-8") as f:
        assert f.read() == site_scd()
    assert len(client.get("/api/v1/graph-data").json()["edges"]) == 1


def test_get_endpoints_do_not_modify_the_database(client):
    upload(client, "site.scd", site_scd())
    with open(database.DB_PATH, "rb") as f:
        before = f.read()
    first = (client.get("/api/v1/graph-data").json(), client.get("/api/v1/errors").json())
    second = (client.get("/api/v1/graph-data").json(), client.get("/api/v1/errors").json())
    with open(database.DB_PATH, "rb") as f:
        assert f.read() == before
    assert first == second


def test_reset_clears_uploads_and_data(client):
    upload(client, "site.scd", site_scd())
    assert client.delete("/api/v1/reset").json() == {"status": "CLEARED"}
    assert os.listdir(main.UPLOAD_DIR) == []
    assert client.get("/api/v1/graph-data").json() == {"nodes": [], "edges": []}
    assert client.get("/api/v1/errors").json() == []
