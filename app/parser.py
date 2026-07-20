import sqlite3
import os
from lxml import etree
from app.database import get_db_connection

def strip_namespaces(root):
    """Strips XML namespaces cleanly without overwriting base attributes."""
    for elem in root.iter():
        if not (isinstance(elem, etree._Comment) or (isinstance(elem.tag, str) and not elem.tag)):
            elem.tag = etree.QName(elem).localname
            for attr_name in list(elem.attrib.keys()):
                local_attr = etree.QName(attr_name).localname
                if attr_name != local_attr:
                    val = elem.attrib[attr_name]
                    del elem.attrib[attr_name]
                    
                    # CRITICAL FIX: Prevent xsi:type from overwriting standard type="APPID"
                    if local_attr not in elem.attrib:
                        elem.attrib[local_attr] = val
    return root

def parse_and_validate_scl(file_path: str):
    conn = get_db_connection()
    cursor = conn.cursor()
    
    filename = os.path.basename(file_path)
    
    cursor.execute("DELETE FROM ieds WHERE subnetwork = ?", (filename,))
    cursor.execute("DELETE FROM goose_links WHERE xpath LIKE ?", (f"{filename}||%",))
    cursor.execute("DELETE FROM validation_errors WHERE xpath LIKE ?", (f"{filename}||%",))
    
    try:
        parser = etree.XMLParser(remove_blank_text=True)
        tree = etree.parse(file_path, parser=parser)
        root = strip_namespaces(tree.getroot())
        
        for ied_elem in root.findall(".//IED"):
            ied_name = ied_elem.get("name")
            if not ied_name: continue
            
            cursor.execute(
                "INSERT OR REPLACE INTO ieds (name, type, subnetwork) VALUES (?, ?, ?)",
                (ied_name, ied_elem.get("type", "Relay"), filename)
            )
            
            # Find publishing Control Blocks belonging to this IED
            for gse_cb in ied_elem.findall(".//GSEControl"):
                cb_name = gse_cb.get("name", "")
                dataset = gse_cb.get("datSet", "")
                conf_rev = gse_cb.get("confRev", "")
                cb_app_id = gse_cb.get("appID", "") 
                
                vlan_id = ""
                vlan_priority = ""
                mac_address = ""
                network_appid = "" 
                min_time = ""
                max_time = ""
                
                # -------------------------------------------------------------------------
                # TARGET EXACTLY THE <GSE> SIGNAL BLOCK REQUESTED
                # -------------------------------------------------------------------------
                gse_network_element = root.find(f".//ConnectedAP[@iedName='{ied_name}']//GSE[@cbName='{cb_name}']")
                
                if gse_network_element is not None:
                    net_addr = gse_network_element.find(".//Address")
                    if net_addr is not None:
                        # Iterate perfectly through <P> tags, immune to sequence shifting
                        for p in net_addr.findall("./P"):
                            p_type = p.get("type")
                            if not p.text: continue
                            
                            if p_type == "MAC-Address":
                                mac_address = p.text.strip().replace("-", ":").upper()
                            elif p_type == "VLAN-ID":
                                vlan_id = p.text.strip()
                            elif p_type == "VLAN-PRIORITY":
                                vlan_priority = p.text.strip()
                            elif p_type == "APPID":
                                network_appid = p.text.strip()
                    
                    # Extract MinTime and MaxTime directly from the exact GSE block
                    min_elem = gse_network_element.find(".//MinTime")
                    if min_elem is not None and min_elem.text: 
                        min_time = min_elem.text.strip()
                        
                    max_elem = gse_network_element.find(".//MaxTime")
                    if max_elem is not None and max_elem.text: 
                        max_time = max_elem.text.strip()
                
                # -------------------------------------------------------------------------
                # VENDOR PRIVATE FALLBACK (Only triggers if GSE is completely missing)
                # -------------------------------------------------------------------------
                if not vlan_id or not network_appid:
                    private_addr = gse_cb.find(".//Private/Address")
                    if private_addr is not None:
                        for p in private_addr.findall("./P"):
                            p_type = p.get("type")
                            if not p.text: continue
                            
                            if p_type == "MAC-Address" and not mac_address:
                                mac_address = p.text.strip().replace("-", ":").upper()
                            elif p_type == "VLAN-ID" and not vlan_id:
                                vlan_id = p.text.strip()
                            elif p_type == "VLAN-PRIORITY" and not vlan_priority:
                                vlan_priority = p.text.strip()
                            elif p_type == "APPID" and not network_appid:
                                network_appid = p.text.strip()

                payload = f"PUB||{dataset}||{conf_rev}||{cb_app_id}||{network_appid}||{vlan_id}||{vlan_priority}||{mac_address}||{min_time}||{max_time}"
                cursor.execute(
                    "INSERT INTO goose_links (publisher, subscriber, app_id, xpath) VALUES (?, ?, ?, ?)",
                    (ied_name, "OUTBOUND", cb_name, f"{filename}||{payload}")
                )

        # PASS 2: Extract Subscriber Mappings (Inbound Wires)
        for extref in root.findall(".//ExtRef"):
            pub_ied_name = extref.get("iedName")
            cb_name = extref.get("srcCBName")
            
            ancestor = extref.getparent()
            sub_ied_name = None
            while ancestor is not None:
                if ancestor.tag == "IED":
                    sub_ied_name = ancestor.get("name")
                    break
                ancestor = ancestor.getparent()
                
            if sub_ied_name and pub_ied_name and cb_name:
                xpath = f"{filename}||{tree.getpath(extref)}"
                
                exp_rev, exp_appid, exp_vlan, exp_pri, exp_mac = "", "", "", "", ""
                local_clone_cb = root.find(f".//IED[@name='{pub_ied_name}']//GSEControl[@name='{cb_name}']")
                if local_clone_cb is not None:
                    exp_rev = local_clone_cb.get("confRev", "")
                    exp_appid = local_clone_cb.get("appID", "")
                    private_addr = local_clone_cb.find(".//Private/Address")
                    if private_addr is not None:
                        for p in private_addr.findall("./P"):
                            p_type = p.get("type")
                            if not p.text: continue
                            if p_type == "MAC-Address": exp_mac = p.text.strip().replace("-", ":").upper()
                            elif p_type == "VLAN-ID": exp_vlan = p.text.strip()
                            elif p_type == "VLAN-PRIORITY": exp_pri = p.text.strip()

                payload_string = f"SUBSCRIBE||{exp_rev}||{exp_appid}||{exp_vlan}||{exp_pri}||{exp_mac}"
                cursor.execute(
                    "INSERT INTO goose_links (publisher, subscriber, app_id, xpath) VALUES (?, ?, ?, ?)",
                    (pub_ied_name, sub_ied_name, cb_name, f"{filename}||{payload_string}")
                )

    except Exception as e:
        print(f"[Parser Error] Processing asset failed: {str(e)}")
        
    conn.commit()
    conn.close()