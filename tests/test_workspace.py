"""Phase 3 workspace endpoints: file listing/removal and choosing an IED's authoritative file."""
import os

from app import main
from tests.conftest import scl, publisher, subscriber
from tests.test_api import client, upload  # noqa: F401  (pytest fixture + helper)


def pub_cid(conf_rev="10001"):
    pub_ied, pub_gse = publisher(conf_rev=conf_rev)
    return scl(pub_ied, gses=[pub_gse])


def sub_cid_with_stale_publisher_copy():
    # A subscriber CID that also carries an old copy of PUB (confRev 1): the classic "ghost twin".
    old_pub, old_gse = publisher(conf_rev="1")
    return scl(old_pub, subscriber(), gses=[old_gse])


def node(client, name):
    return next(n for n in client.get("/api/v1/graph-data").json()["nodes"] if n["name"] == name)


def rules(client):
    return sorted(e["rule_type"] for e in client.get("/api/v1/errors").json())


def test_files_are_listed_in_upload_order_with_their_ieds(client):
    upload(client, "pub.cid", pub_cid())
    upload(client, "sub.cid", sub_cid_with_stale_publisher_copy())
    assert client.get("/api/v1/files").json() == [
        {"name": "pub.cid", "order": 1, "ieds": ["PUB"]},
        {"name": "sub.cid", "order": 2, "ieds": ["PUB", "SUB"]},
    ]


def test_ghost_copy_hides_drift_until_the_publisher_file_is_chosen(client):
    upload(client, "pub.cid", pub_cid(conf_rev="10001"))
    upload(client, "sub.cid", sub_cid_with_stale_publisher_copy())

    # Default: latest upload wins, so the stale copy in sub.cid is taken as PUB's configuration -> drift invisible.
    pub = node(client, "PUB")
    assert (pub["source_file"], pub["source_pinned"], pub["copies"]) == ("sub.cid", False, ["sub.cid", "pub.cid"])
    assert "CONFREV_DESYNC" not in rules(client)

    res = client.put("/api/v1/ieds/PUB/source", json={"source_file": "pub.cid"})
    assert res.status_code == 200
    pub = node(client, "PUB")
    assert (pub["source_file"], pub["source_pinned"]) == ("pub.cid", True)
    assert "CONFREV_DESYNC" in rules(client)  # 10001 published vs 1 in the subscriber's copy

    # A later upload does not override the user's choice.
    upload(client, "sub.cid", sub_cid_with_stale_publisher_copy())
    assert node(client, "PUB")["source_file"] == "pub.cid"

    # Clearing the choice returns to "latest upload wins".
    assert client.put("/api/v1/ieds/PUB/source", json={"source_file": None}).status_code == 200
    assert node(client, "PUB")["source_file"] == "sub.cid"


def test_choosing_a_file_that_does_not_contain_the_ied(client):
    upload(client, "pub.cid", pub_cid())
    upload(client, "sub.cid", sub_cid_with_stale_publisher_copy())
    assert client.put("/api/v1/ieds/SUB/source", json={"source_file": "pub.cid"}).status_code == 400
    assert client.put("/api/v1/ieds/NOPE/source", json={"source_file": "pub.cid"}).status_code == 404


def test_removing_a_file_drops_its_data_and_any_choice_pointing_at_it(client):
    upload(client, "pub.cid", pub_cid())
    upload(client, "sub.cid", sub_cid_with_stale_publisher_copy())
    client.put("/api/v1/ieds/PUB/source", json={"source_file": "pub.cid"})

    res = client.delete("/api/v1/files/pub.cid")
    assert res.status_code == 200 and res.json() == {"status": "REMOVED", "file": "pub.cid"}
    assert not os.path.exists(os.path.join(main.UPLOAD_DIR, "pub.cid"))
    assert [f["name"] for f in client.get("/api/v1/files").json()] == ["sub.cid"]
    pub = node(client, "PUB")
    assert (pub["source_file"], pub["source_pinned"], pub["copies"]) == ("sub.cid", False, ["sub.cid"])

    assert client.delete("/api/v1/files/pub.cid").status_code == 404


def test_reset_also_clears_authority_choices(client):
    upload(client, "pub.cid", pub_cid())
    upload(client, "sub.cid", sub_cid_with_stale_publisher_copy())
    client.put("/api/v1/ieds/PUB/source", json={"source_file": "pub.cid"})
    client.delete("/api/v1/reset")
    upload(client, "pub.cid", pub_cid())
    upload(client, "sub.cid", sub_cid_with_stale_publisher_copy())
    assert node(client, "PUB")["source_pinned"] is False
