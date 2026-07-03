import sqlite3
import os
from lxml import etree
from app.database import get_db_connection

def strip_namespaces(root):
    """
    Strips all XML namespace prefixes and URIs from tags and attributes.
    Standardizes cross-vendor file structures for uniform evaluation.
    """
    for elem in root.getiterator():
        if not (isinstance(elem, etree._Comment) or isinstance(elem, etree._ProcessingInstruction)):
            # Remove namespace URI from the element tag
            elem.tag = etree.QName(elem).localname
            # Strip namespaces from attribute mappings
            for attr_name in list(elem.attrib.keys()):
                local_attr = etree.QName(attr_name).localname
                if attr_name != local_attr:
                    val = elem.attrib[attr_name]
                    del elem.attrib[attr_name]
                    elem.attrib[local_attr] = val
    return root

def parse_and_validate_scl(file_path: str):
    """
    Robust Multi-Vendor Cross-Validator.
    Strips vendor-specific XML namespaces to evaluate configuration parameters
    equally across different manufacturers (e.g., SEL, Siemens).
    """
    conn = get_db_connection()
    cursor = conn.cursor()
    
    UPLOAD_DIR = os.path.dirname(file_path)
    all_files = [f for f in os.listdir(UPLOAD_DIR) if f.endswith(('.scd', '.xml', '.cid', '.icd'))]
    
    # Clean workspace tracking tables prior to building the network map
    cursor.execute("DELETE FROM ieds")
    cursor.execute("DELETE FROM goose_links")
    cursor.execute("DELETE FROM validation_errors")
    
    ied_inventory = {}  # Target: { "IED_Name": {"version": "1.0", "file": "f.cid", "cb_versions": {} } }
    
    # -----------------------------------------------------------------
    # Pass 1: Normalize & Index Device Inventories Globally
    # -----------------------------------------------------------------
    for filename in all_files:
        current_path = os.path.join(UPLOAD_DIR, filename)
        try:
            parser = etree.XMLParser(remove_blank_text=True)
            tree = etree.parse(current_path, parser=parser)
            root = strip_namespaces(tree.getroot())
            
            # Index defined IED names and version attributes natively
            for ied_elem in root.findall(".//IED"):
                ied_name = ied_elem.get("name")
                if ied_name:
                    if ied_name not in ied_inventory:
                        ied_inventory[ied_name] = {
                            "version": ied_elem.get("configVersion", "1.0"),
                            "file": filename,
                            "cb_versions": {}
                        }
                    cursor.execute(
                        "INSERT OR REPLACE INTO ieds (name, type, subnetwork) VALUES (?, ?, ?)",
                        (ied_name, ied_elem.get("type", "Protection_Relay"), "Subnetwork_Alpha")
                    )
            
            # Map out actual Control Block configurations (GSEControl blocks)
            for gse_cb in root.findall(".//GSEControl"):
                cb_name = gse_cb.get("name")
                conf_rev = gse_cb.get("confRev")
                
                # Trace back up to pinpoint the parent IED
                parent = gse_cb.getparent()
                ied_ref = None
                while parent is not None:
                    if parent.tag == "IED":
                        ied_ref = parent.get("name")
                        break
                    parent = parent.getparent()
                
                if ied_ref and cb_name and conf_rev:
                    if ied_ref in ied_inventory:
                        ied_inventory[ied_ref]["cb_versions"][cb_name] = str(conf_rev)

        except Exception as e:
            print(f"[Pass 1 Error] Parsing failed for {filename}: {str(e)}")

    # -----------------------------------------------------------------
    # Pass 2: Parameter Range Validation (MAC, VLAN ID, Priority, APPID)
    # -----------------------------------------------------------------
    for filename in all_files:
        current_path = os.path.join(UPLOAD_DIR, filename)
        try:
            tree = etree.parse(current_path)
            root = strip_namespaces(tree.getroot())
            
            # Inspect GSE communication blocks for network settings
            for gse in root.findall(".//ConnectedAP/GSE"):
                cb_name = gse.get("cbName")
                cap = gse.getparent()
                ied_ref = cap.get("iedName", "Unknown_IED")
                
                # 1. APPID Check
                appid_elem = gse.find(".//P[@type='APPID']")
                if appid_elem is not None and appid_elem.text:
                    appid_val = appid_elem.text.strip()
                    xpath = f"{filename}||{tree.getpath(appid_elem)}"
                    try:
                        appid_int = int(appid_val, 16) if appid_val.lower().startswith('0x') else int(appid_val, 10)
                        if not (0x8000 <= appid_int <= 0xBFFF):
                            cursor.execute(
                                """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                                   VALUES (?, ?, ?, ?, ?)""",
                                (ied_ref, "WARNING", "APPID_OUT_OF_BOUNDS", 
                                 f"GOOSE APPID '{appid_val}' for control block '{cb_name}' deviates from standard parameters (0x8000 - 0xBFFF).", xpath)
                            )
                    except ValueError:
                        pass

                # 2. VLAN Priority Check
                priority_elem = gse.find(".//P[@type='VLAN-PRIORITY']")
                if priority_elem is not None and priority_elem.text:
                    pri_val = priority_elem.text.strip()
                    xpath = f"{filename}||{tree.getpath(priority_elem)}"
                    try:
                        pri_int = int(pri_val)
                        if pri_int < 4 or pri_int > 7:
                            cursor.execute(
                                """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                                   VALUES (?, ?, ?, ?, ?)""",
                                (ied_ref, "WARNING", "VLAN_PRIORITY_LOW", 
                                 f"VLAN Priority '{pri_val}' on '{cb_name}' is set below the recommended threshold (4-7) for critical routing.", xpath)
                            )
                    except ValueError:
                        pass

            # 3. VLAN ID Range Check
            for vlan_elem in root.findall(".//Address/P[@type='VLAN-ID']"):
                vlan_id = vlan_elem.text
                xpath = f"{filename}||{tree.getpath(vlan_elem)}"
                cap = vlan_elem.getparent().getparent().getparent()
                ied_ref = cap.get("iedName", "Unknown_IED")
                
                if vlan_id:
                    try:
                        vlan_int = int(vlan_id, 16) if vlan_id.lower().startswith('0x') else int(vlan_id)
                        if vlan_int < 1 or vlan_int > 4095:
                            raise ValueError()
                    except ValueError:
                        cursor.execute(
                            """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                               VALUES (?, ?, ?, ?, ?)""",
                            (ied_ref, "WARNING", "VLAN_OUT_OF_RANGE", 
                             f"VLAN ID '{vlan_id}' is invalid or out of standard IEEE 802.1Q bounds (1-4095).", xpath)
                        )

            # 4. Multicast MAC Bound Check
            for mac_elem in root.findall(".//Address/P[@type='MAC-Address']"):
                mac_address = mac_elem.text
                xpath = f"{filename}||{tree.getpath(mac_elem)}"
                cap = mac_elem.getparent().getparent().getparent()
                ied_ref = cap.get("iedName", "Unknown_IED")
                
                if mac_address:
                    clean_mac = mac_address.replace("-", ":").upper()
                    if not clean_mac.startswith("01:0C:CD:01"):
                        cursor.execute(
                            """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                               VALUES (?, ?, ?, ?, ?)""",
                            (ied_ref, "WARNING", "MAC_OUT_OF_RANGE", 
                             f"Multicast MAC address '{mac_address}' deviates from standard IEC 61850 GOOSE allocation allocation parameters.", xpath)
                        )
        except Exception as e:
            print(f"[Pass 2 Error] Network check failed for {filename}: {str(e)}")

    # -----------------------------------------------------------------
    # Pass 3: Cross-File Wire Generation & Version Conflict Check
    # -----------------------------------------------------------------
    for filename in all_files:
        current_path = os.path.join(UPLOAD_DIR, filename)
        try:
            tree = etree.parse(current_path)
            root = strip_namespaces(tree.getroot())
            
            for extref in root.findall(".//ExtRef"):
                publisher_ied = extref.get("iedName")
                cb_name = extref.get("srcCBName")
                expected_rev = extref.get("srcSubVersion")
                
                # Identify the subscribing IED
                ancestor = extref.getparent()
                subscriber_ied = None
                while ancestor is not None:
                    if ancestor.tag == "IED":
                        subscriber_ied = ancestor.get("name")
                        break
                    ancestor = ancestor.getparent()
                    
                if not subscriber_ied or not publisher_ied:
                    continue
                    
                xpath = f"{filename}||{tree.getpath(extref)}"
                app_id = cb_name if cb_name else "GOOSE_CB"
                
                # Write to the runtime edge matrix table
                cursor.execute(
                    "INSERT INTO goose_links (publisher, subscriber, app_id, xpath) VALUES (?, ?, ?, ?)",
                    (publisher_ied, subscriber_ied, app_id, xpath)
                )
                
                # Rule 3A: Cross-File Missing Node Check
                if publisher_ied not in ied_inventory:
                    cursor.execute(
                        """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                           VALUES (?, ?, ?, ?, ?)""",
                        (subscriber_ied, "ERROR", "EXTREF_UNKNOWN_IED", 
                         f"Subscriber expects signals from publisher '{publisher_ied}', which is missing from all uploaded configurations.", xpath)
                    )
                else:
                    # Rule 3B: Cross-File Configuration Revision Check
                    actual_cb_versions = ied_inventory[publisher_ied]["cb_versions"]
                    actual_rev = actual_cb_versions.get(cb_name) if cb_name else None
                    
                    if not actual_rev:
                        actual_rev = ied_inventory[publisher_ied]["version"]
                        
                    if expected_rev and str(expected_rev) != str(actual_rev):
                        pub_file = ied_inventory[publisher_ied]["file"]
                        cursor.execute(
                            """INSERT INTO validation_errors (ied_name, severity, rule_type, message, xpath) 
                               VALUES (?, ?, ?, ?, ?)""",
                            (subscriber_ied, "WARNING", "CONF_REV_MISMATCH", 
                             f"Version Skew! Subscriber expects revision '{expected_rev}' for block '{cb_name}', but publisher file '{pub_file}' registers version '{actual_rev}'.", xpath)
                        )
                        
        except Exception as e:
            print(f"[Pass 3 Error] Cross check failed for {filename}: {str(e)}")
            
    conn.commit()
    conn.close()