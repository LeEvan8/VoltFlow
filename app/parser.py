import sqlite3
import os
from lxml import etree
from app.database import get_db_connection

def strip_namespaces(root):
    """Strips all XML namespace prefixes and URIs to normalize parsing formats."""
    for elem in root.getiterator():
        if not (isinstance(elem, etree._Comment) or isinstance(elem, etree._ProcessingInstruction)):
            elem.tag = etree.QName(elem).localname
            for attr_name in list(elem.attrib.keys()):
                local_attr = etree.QName(attr_name).localname
                if attr_name != local_attr:
                    val = elem.attrib[attr_name]
                    del elem.attrib[attr_name]
                    elem.attrib[local_attr] = val
    return root

def parse_and_validate_scl(file_path: str):
    """ 
    Decoupled Cross-Vendor Multi-File Engine.
    Indexes all files globally first, then validates parameter matrices cross-file.
    """
    conn = get_db_connection()
    cursor = conn.cursor()
    
    UPLOAD_DIR = os.path.dirname(file_path)
    all_files = [f for f in os.listdir(UPLOAD_DIR) if f.endswith(('.scd', '.xml', '.cid', '.icd'))]
    
    cursor.execute("DELETE FROM ieds")
    cursor.execute("DELETE FROM goose_links")
    cursor.execute("DELETE FROM validation_errors")
    
    # Global lookup tables to hold exact specifications extracted across all vendor files
    global_publisher_matrix = {}
    ied_file_map = {}

    # -----------------------------------------------------------------
    # PASS 1: Global Multi-Vendor Parameter Indexing (Build the Matrix)
    # -----------------------------------------------------------------
    for filename in all_files:
        current_path = os.path.join(UPLOAD_DIR, filename)
        try:
            parser = etree.XMLParser(remove_blank_text=True)
            tree = etree.parse(current_path, parser=parser)
            root = strip_namespaces(tree.getroot())
            
            # Map physical IED profiles
            for ied_elem in root.findall(".//IED"):
                ied_name = ied_elem.get("name")
                if ied_name:
                    ied_file_map[ied_name] = filename
                    cursor.execute(
                        "INSERT OR REPLACE INTO ieds (name, type, subnetwork) VALUES (?, ?, ?)",
                        (ied_name, ied_elem.get("type", "Protection_Relay"), "Subnetwork_Alpha")
                    )
                    if ied_name not in global_publisher_matrix:
                        global_publisher_matrix[ied_name] = {}
            
            # Harvest individual GOOSE Control Block revisions
            for gse_cb in root.findall(".//GSEControl"):
                cb_name = gse_cb.get("name")
                conf_rev = gse_cb.get("confRev")  # None if absent - caught explicitly in Pass 2
                
                parent = gse_cb.getparent()
                ied_ref = None
                while parent is not None:
                    if parent.tag == "IED":
                        ied_ref = parent.get("name")
                        break
                    parent = parent.getparent()
                
                if ied_ref and cb_name:
                    if cb_name not in global_publisher_matrix[ied_ref]:
                        global_publisher_matrix[ied_ref][cb_name] = {
                            "mac": "TBC", "vlan_id": "TBC", "priority": "TBC", "appid": "TBC", 
                            "conf_rev": str(conf_rev) if conf_rev is not None else "MISSING", 
                            "file": filename
                        }
                    else:
                        global_publisher_matrix[ied_ref][cb_name]["conf_rev"] = str(conf_rev) if conf_rev is not None else "MISSING"

            # Harvest communications box network settings (MAC, VLAN, Priority, APPID)
            for gse in root.findall(".//ConnectedAP/GSE"):
                cb_name = gse.get("cbName")
                cap = gse.getparent()
                ied_ref = cap.get("iedName")
                
                if ied_ref and cb_name:
                    if ied_ref not in global_publisher_matrix:
                        global_publisher_matrix[ied_ref] = {}
                    if cb_name not in global_publisher_matrix[ied_ref]:
                        global_publisher_matrix[ied_ref][cb_name] = {
                            "mac": "TBC", "vlan_id": "TBC", "priority": "TBC", "appid": "TBC", "conf_rev": "MISSING", "file": filename
                        }
                    
                    mac_elem = gse.find(".//P[@type='MAC-Address']")
                    vlan_elem = gse.find(".//P[@type='VLAN-ID']")
                    pri_elem = gse.find(".//P[@type='VLAN-PRIORITY']")
                    appid_elem = gse.find(".//P[@type='APPID']")
                    
                    if mac_elem is not None and mac_elem.text:
                        global_publisher_matrix[ied_ref][cb_name]["mac"] = mac_elem.text.strip().replace("-", ":").upper()
                    if vlan_elem is not None and vlan_elem.text:
                        global_publisher_matrix[ied_ref][cb_name]["vlan_id"] = vlan_elem.text.strip()
                    if pri_elem is not None and pri_elem.text:
                        global_publisher_matrix[ied_ref][cb_name]["priority"] = pri_elem.text.strip()
                    if appid_elem is not None and appid_elem.text:
                        global_publisher_matrix[ied_ref][cb_name]["appid"] = appid_elem.text.strip()

        except Exception as e:
            print(f"[Pass 1 Error] Parsing failed for {filename}: {str(e)}")

    # -----------------------------------------------------------------
    # PASS 2: Multi-File Cross-Validation & Link Analysis
    # -----------------------------------------------------------------
    for filename in all_files:
        current_path = os.path.join(UPLOAD_DIR, filename)
        try:
            tree = etree.parse(current_path)
            root = strip_namespaces(tree.getroot())
            
            # Inspect every subscriber mapping node
            for extref in root.findall(".//ExtRef"):
                publisher_ied = extref.get("iedName")
                cb_name = extref.get("srcCBName")
                
                # Identify the subscriber IED tracking this input block
                ancestor = extref.getparent()
                subscriber_ied = None
                while ancestor is not None:
                    if ancestor.tag == "IED":
                        subscriber_ied = ancestor.get("name")
                        break
                    ancestor = ancestor.getparent()
                    
                if not subscriber_ied or not publisher_ied or not cb_name:
                    continue
                    
                xpath = f"{filename}||{tree.getpath(extref)}"
                
                # Commit wire linkage directly to database
                cursor.execute(
                    "INSERT INTO goose_links (publisher, subscriber, app_id, xpath) VALUES (?, ?, ?, ?)",
                    (publisher_ied, subscriber_ied, cb_name, xpath)
                )
                
                # CRITICAL RULE 1: Missing Publisher IED Verification
                if publisher_ied not in global_publisher_matrix:
                    cursor.execute(
                        """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                           VALUES (?, ?, ?, ?, ?)""",
                        (subscriber_ied, "ERROR", "EXTREF_UNKNOWN_IED", 
                         f"Cross-File Error: Subscriber '{subscriber_ied}' expects signals from publisher '{publisher_ied}', but that device profile cannot be found in any uploaded configurations.", xpath)
                    )
                    continue
                
                # CRITICAL RULE 2: Missing Control Block Verification
                if cb_name not in global_publisher_matrix[publisher_ied]:
                    cursor.execute(
                        """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                           VALUES (?, ?, ?, ?, ?)""",
                        (subscriber_ied, "ERROR", "MISSING_CONTROL_BLOCK", 
                         f"Cross-File Error: Subscriber '{subscriber_ied}' targets control block '{cb_name}' on publisher '{publisher_ied}', but that block does not exist.", xpath)
                    )
                    continue
                
                # Pull verified publisher specifications from global lookup matrix
                pub_specs = global_publisher_matrix[publisher_ied][cb_name]
                pub_file = pub_specs["file"]
                
                # CORRECTED RULE 3: Actual Configuration Revision Space Verification
                actual_rev = pub_specs["conf_rev"]
                if actual_rev == "MISSING":
                    cursor.execute(
                        """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                           VALUES (?, ?, ?, ?, ?)""",
                        (publisher_ied, "ERROR", "CONF_REV_MISSING", 
                         f"Publisher '{publisher_ied}' control block '{cb_name}' (in '{pub_file}') has no confRev declared. Subscribers will reject its GOOSE messages.", xpath)
                    )
                elif actual_rev == "0":
                    cursor.execute(
                        """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                           VALUES (?, ?, ?, ?, ?)""",
                        (publisher_ied, "WARNING", "CONF_REV_ZERO", 
                         f"Publisher '{publisher_ied}' control block '{cb_name}' has confRev=0. This is the SCL default — the dataset has likely never been commissioned.", xpath)
                    )

                # CRITICAL RULE 4: Cross-File Network Space Validation (MAC Address Range)
                if pub_specs["mac"] != "TBC" and not pub_specs["mac"].startswith("01:0C:CD:01"):
                    cursor.execute(
                        """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                           VALUES (?, ?, ?, ?, ?)""",
                        (publisher_ied, "WARNING", "MAC_OUT_OF_RANGE", 
                         f"Network Mismatch on block '{cb_name}': Multicast MAC address '{pub_specs['mac']}' deviates from standard IEC 61850 parameters.", xpath)
                    )

                # CRITICAL RULE 5: Cross-File VLAN ID Range Validation
                if pub_specs["vlan_id"] != "TBC":
                    try:
                        vlan_val = pub_specs["vlan_id"]
                        vlan_int = int(vlan_val, 16) if vlan_val.lower().startswith('0x') else int(vlan_val)
                        if vlan_int < 1 or vlan_int > 4095:
                            raise ValueError()
                    except ValueError:
                        cursor.execute(
                            """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                               VALUES (?, ?, ?, ?, ?)""",
                            (publisher_ied, "ERROR", "VLAN_OUT_OF_RANGE", 
                             f"Network Mismatch on block '{cb_name}': VLAN ID '{pub_specs['vlan_id']}' falls outside valid IEEE 802.1Q limits (1-4095).", xpath)
                        )

                # CRITICAL RULE 6: Cross-File VLAN Priority Threshold Verification
                if pub_specs["priority"] != "TBC":
                    try:
                        pri_int = int(pub_specs["priority"])
                        if pri_int < 4 or pri_int > 7:
                            cursor.execute(
                                """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                                   VALUES (?, ?, ?, ?, ?)""",
                                (publisher_ied, "WARNING", "VLAN_PRIORITY_LOW", 
                                 f"Performance Hazard on block '{cb_name}': VLAN Priority '{pub_specs['priority']}' is lower than recommended bounds (4-7) for critical protection messages.", xpath)
                            )
                    except ValueError:
                        pass

                # CRITICAL RULE 7: Cross-File APPID Hex Domain Validation
                if pub_specs["appid"] != "TBC":
                    try:
                        ap_val = pub_specs["appid"]
                        appid_int = int(ap_val, 16) if ap_val.lower().startswith('0x') else int(ap_val, 10)
                        if not (0x8000 <= appid_int <= 0xBFFF):
                            cursor.execute(
                                """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                                   VALUES (?, ?, ?, ?, ?)""",
                                (publisher_ied, "WARNING", "APPID_OUT_OF_BOUNDS", 
                                 f"Network Mismatch on block '{cb_name}': APPID '{pub_specs['appid']}' deviates from standardized GOOSE space allocation limits (0x8000 - 0xBFFF).", xpath)
                            )
                    except ValueError:
                        pass

        except Exception as e:
            print(f"[Pass 2 Error] Validation matrix analysis failed for {filename}: {str(e)}")
            
    conn.commit()
    conn.close()