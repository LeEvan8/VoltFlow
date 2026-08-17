import sqlite3
import os
from lxml import etree
from app.database import get_db_connection

# =========================================================================
# TEMPORARY DEBUG SECTION (Easily removable for production)
# =========================================================================
def print_parser_debug_info(mode: str, data: dict):
    """Temporary diagnostic print function for terminal troubleshooting."""
    print(f"\n================ [PARSER DEBUG: {mode}] ================")
    for key, val in data.items():
        print(f"  {key:<15} : {val}")
    print("========================================================\n")
# =========================================================================

def strip_namespaces(root):
    """Cleanly isolates elements from heavy multi-vendor XML namespace bloat."""
    for elem in root.iter():
        if not (isinstance(elem, etree._Comment) or (isinstance(elem.tag, str) and not elem.tag)):
            elem.tag = etree.QName(elem).localname
            for attr_name in list(elem.attrib.keys()):
                local_attr = etree.QName(attr_name).localname
                if attr_name != local_attr:
                    val = elem.attrib[attr_name]
                    del elem.attrib[attr_name]
                    if local_attr not in elem.attrib:
                        elem.attrib[local_attr] = val
    return root

def parse_and_validate_scl(file_path: str):
    conn = get_db_connection()
    cursor = conn.cursor()
    filename = os.path.basename(file_path)
    
    try:
        parser = etree.XMLParser(remove_blank_text=True)
        tree = etree.parse(file_path, parser=parser)
        root = strip_namespaces(tree.getroot())
        
        # -------------------------------------------------------------------------
        # THE SURGICAL OVERWRITE ENGINE (IED-CENTRIC INGESTION)
        # -------------------------------------------------------------------------
        active_ieds_in_file = [ied.get("name") for ied in root.findall(".//IED") if ied.get("name")]
        
        for ied_name in active_ieds_in_file:
            cursor.execute("DELETE FROM ieds WHERE name = ?", (ied_name,))
            cursor.execute("DELETE FROM goose_links WHERE publisher = ? AND subscriber = 'OUTBOUND'", (ied_name,))
            cursor.execute("DELETE FROM goose_links WHERE subscriber = ?", (ied_name,))

        # -------------------------------------------------------------------------
        # PASS 1: EXTRACT MASTER PUBLISHED SIGNALS (WITH ldInst DIFFERENTIATION)
        # -------------------------------------------------------------------------
        for ied_elem in root.findall(".//IED"):
            ied_name = ied_elem.get("name")
            if not ied_name: continue
            
            cursor.execute(
                "INSERT INTO ieds (name, type, subnetwork) VALUES (?, ?, ?)",
                (ied_name, ied_elem.get("type", "Relay"), filename)
            )
            
            # Iterate through Logical Devices to capture ldInst (e.g., CB1 vs CB2)
            for ldevice_elem in ied_elem.findall(".//LDevice"):
                ld_inst = ldevice_elem.get("inst", "")
                
                for gse_cb in ldevice_elem.findall(".//GSEControl"):
                    cb_name = gse_cb.get("name", "")
                    dataset = gse_cb.get("datSet", "")
                    conf_rev = gse_cb.get("confRev", "")
                    cb_app_id = gse_cb.get("appID", "") 
                    
                    vlan_id, vlan_priority, mac_address, network_appid, min_time, max_time = "", "", "", "", "", ""
                    
                    # Target the exact GSE element matching both ldInst and cbName
                    gse_network_element = root.find(f".//ConnectedAP[@iedName='{ied_name}']//GSE[@ldInst='{ld_inst}'][@cbName='{cb_name}']")
                    
                    if gse_network_element is not None:
                        net_addr = gse_network_element.find(".//Address")
                        if net_addr is not None:
                            for p in net_addr.findall("./P"):
                                p_type = p.get("type")
                                if not p.text: continue
                                if p_type == "MAC-Address": mac_address = p.text.strip().replace("-", ":").upper()
                                elif p_type == "VLAN-ID": vlan_id = p.text.strip()
                                elif p_type == "VLAN-PRIORITY": vlan_priority = p.text.strip()
                                elif p_type == "APPID": network_appid = p.text.strip()
                        
                        min_elem = gse_network_element.find(".//MinTime")
                        if min_elem is not None and min_elem.text: min_time = min_elem.text.strip()
                        max_elem = gse_network_element.find(".//MaxTime")
                        if max_elem is not None and max_elem.text: max_time = max_elem.text.strip()

                    final_appid = network_appid if network_appid else cb_app_id
                    
                    # CALLING TEMPORARY DEBUG FOR PUBLISHER
                    print_parser_debug_info("PUBLISHER (PUB)", {
                        "filename": filename,
                        "ied_name": ied_name,
                        "ld_inst": ld_inst,
                        "cb_name": cb_name,
                        "dataset": dataset,
                        "conf_rev": conf_rev,
                        "final_appid": final_appid,
                        "mac_address": mac_address
                    })

                    # Store ld_inst at the end of the payload for downstream mapping
                    payload = f"PUB||{dataset}||{conf_rev}||{final_appid}||{vlan_id}||{vlan_priority}||{mac_address}||{min_time}||{max_time}||{ld_inst}"
                    cursor.execute(
                        "INSERT INTO goose_links (publisher, subscriber, app_id, xpath) VALUES (?, ?, ?, ?)",
                        (ied_name, "OUTBOUND", cb_name, f"{filename}||{payload}")
                    )

        # -------------------------------------------------------------------------
        # PASS 2: EXTRACT STANDARDIZED SUBSCRIPTION WIRES (WITH srcLDInst SCOPING)
        # -------------------------------------------------------------------------
        processed_subscriptions = set()

        for extref in root.findall(".//ExtRef"):
            pub_ied_name = extref.get("iedName")
            cb_name = extref.get("srcCBName")
            src_ld_inst = extref.get("srcLDInst", "").strip()
            
            # Find subscriber parent node
            ancestor = extref.getparent()
            sub_ied_name = None
            while ancestor is not None:
                if ancestor.tag == "IED":
                    sub_ied_name = ancestor.get("name")
                    break
                ancestor = ancestor.getparent()
                
            if sub_ied_name and pub_ied_name and cb_name:
                # Deduplication composite key now includes src_ld_inst to properly separate CB1/CB2 maps
                sub_key = (sub_ied_name, pub_ied_name, src_ld_inst, cb_name)
                if sub_key in processed_subscriptions:
                    continue  # Skip redundant ExtRef rows (like stVal, q, t mapping attributes)
                
                processed_subscriptions.add(sub_key)

                exp_rev = extref.get("srcInst", "").strip() or extref.get("confRev", "").strip()
                exp_appid = "" 
                
                vendor_sub = root.find(f".//GooseSubscription[@iedName='{pub_ied_name}'][@cbName='{cb_name}']")
                if vendor_sub is not None:
                    if vendor_sub.get("confRev") and not exp_rev:
                        exp_rev = vendor_sub.get("confRev").strip()
                    if vendor_sub.get("APPID"):
                        exp_appid = vendor_sub.get("APPID").strip()
                
                # Precise fallback scoped to the exact logical device instance
                if not exp_rev:
                    ghost_cb = root.find(f".//IED[@name='{pub_ied_name}']//LDevice[@inst='{src_ld_inst}']//GSEControl[@name='{cb_name}']")
                    if ghost_cb is not None and ghost_cb.get("confRev"):
                        exp_rev = ghost_cb.get("confRev").strip()

                # CALLING TEMPORARY DEBUG FOR SUBSCRIBER
                print_parser_debug_info("SUBSCRIBER (SUBSCRIBE)", {
                    "filename": filename,
                    "pub_ied_name": pub_ied_name,
                    "sub_ied_name": sub_ied_name,
                    "src_ld_inst": src_ld_inst,
                    "cb_name": cb_name,
                    "exp_rev": exp_rev or 'AUTO',
                    "exp_appid": exp_appid or 'AUTO'
                })

                # Append src_ld_inst to the payload string so it can be mapped accurately in the main engine
                payload_string = f"SUBSCRIBE||{exp_rev or 'AUTO'}||{exp_appid or 'AUTO'}||{src_ld_inst}"
                cursor.execute(
                    "INSERT INTO goose_links (publisher, subscriber, app_id, xpath) VALUES (?, ?, ?, ?)",
                    (pub_ied_name, sub_ied_name, cb_name, f"{filename}||{payload_string}")
                )

    except Exception as e:
        print(f"[Parser Schema Alert] Extraction error: {str(e)}")
        
    conn.commit()
    conn.close()