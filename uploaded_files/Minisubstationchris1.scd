<?xml version="1.0" encoding="UTF-8"?>
<SCL version="2007" revision="B" release="4" xmlns="http://www.iec.ch/61850/2003/SCL" xsi:schemaLocation="http://www.iec.ch/61850/2003/SCL SCL.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:IEC_60870_5_104="http://www.iec.ch/61850-80-1/2007/SCL" xmlns:siebase="http://www.siemens.com/energy/2009/09/siprotec5/SieBase" eIEC61850-6-100:version="2019" eIEC61850-6-100:revision="B" eIEC61850-6-100:release="9" xmlns:eIEC61850-6-100="http://www.iec.ch/61850/2019/SCL/6-100" xmlns:siedig="http://www.siemens.com/energy/2011/11/Siedig">
	<Private type="Siemens-SclLib-V5-Version">V09.90.06.000</Private>
	<Private type="Siemens-SclLib-V5-EditTime">12.08.2026 17:09:10</Private>
	<Private type="Siemens-Configurator-Version">7.90.58</Private>
	<Private type="Siemens_SiedigGooseApplicationStorage">
		<siedig:GooseApplicationStorage>
			<siedig:MacAddrMin>01-0C-CD-01-00-00</siedig:MacAddrMin>
			<siedig:MacAddrMax>01-0C-CD-01-01-FF</siedig:MacAddrMax>
			<siedig:GooseApplication name="87T Protection CBs" desc="" profileName="PriorityLow">
				<siedig:AppId>0001</siedig:AppId>
				<siedig:MinTime unit="s" multiplier="m">10</siedig:MinTime>
				<siedig:MaxTime unit="s" multiplier="m">2000</siedig:MaxTime>
				<siedig:VLanId>000</siedig:VLanId>
				<siedig:VLanPriority>4</siedig:VLanPriority>
				<siedig:DataSet guidRef="bce93159b81348189fa48c9766394e4f" />
				<siedig:DataSet guidRef="462e95a0db0646279cd0ea5ef1db8ea8" />
			</siedig:GooseApplication>
		</siedig:GooseApplicationStorage>
	</Private>
	<Private type="Siemens_SiedigSMVApplicationStorage">
		<siedig:SMVApplicationStorage>
			<siedig:MacAddrMax>01-0C-CD-04-01-FF</siedig:MacAddrMax>
			<siedig:MacAddrMin>01-0C-CD-04-00-00</siedig:MacAddrMin>
			<siedig:SMVApplication name="E01MU1/Mod2_MU1/LLN0/PhsMeas3" desc="" profileName="">
				<siedig:SmvId>4001</siedig:SmvId>
				<siedig:DataSet guidRef="f64f4e1ab49742a084a526281e577bef" />
			</siedig:SMVApplication>
			<siedig:SMVApplication name="D01MU1/Mod2_MU1/LLN0/PhsMeas3" desc="" profileName="">
				<siedig:SmvId>4002</siedig:SmvId>
				<siedig:DataSet guidRef="8223c0d3c7e14f20b23f9edd6b84610a" />
			</siedig:SMVApplication>
		</siedig:SMVApplicationStorage>
	</Private>
	<Private type="eIEC61850-6-100">
		<eIEC61850-6-100:ServiceSpecifications>
			<eIEC61850-6-100:SMVParameters id="E01MU1Mod2MU103" />
			<eIEC61850-6-100:SMVParameters id="SIPMod2MU103" />
		</eIEC61850-6-100:ServiceSpecifications>
	</Private>
	<Header id="IEC station 1" version="1" revision="7" toolID="IEC 61850 System Configurator, Version: 7.90.58" nameStructure="IEDName">
		<Text>IEC station 1</Text>
		<History>
			<Hitem version="1" revision="1" when="Thursday, August 6, 2026 2:47:36 PM" who="Licenced User:  Admin Machine: DESKTOP-D2H5RE4 User: Admin" what="Device E01F87T is imported from C:\Users\Admin\AppData\Local\Temp\tfxi42zq.qfv\E01F87T.iid" why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="2" when="Thursday, August 6, 2026 2:47:37 PM" who="Licenced User:  Admin Machine: DESKTOP-D2H5RE4 User: Admin" what="Device E01MU1 is imported from C:\Users\Admin\AppData\Local\Temp\tfxi42zq.qfv\E01MU1.iid" why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="3" when="Thursday, August 6, 2026 2:47:37 PM" who="Licenced User:  Admin Machine: DESKTOP-D2H5RE4 User: Admin" what="Device D01MU1 is imported from C:\Users\Admin\AppData\Local\Temp\tfxi42zq.qfv\D01MU1.iid" why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="4" when="Friday, August 7, 2026 10:17:11 AM" who="Licenced User:  Admin Machine: DESKTOP-D2H5RE4 User: Admin" what="Device E0187T updated from C:\Users\Admin\AppData\Local\Temp\eo1vxvde.uoy\E0187T.iid." why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="5" when="Friday, August 7, 2026 10:17:11 AM" who="Licenced User:  Admin Machine: DESKTOP-D2H5RE4 User: Admin" what="Device C01MU1 updated from C:\Users\Admin\AppData\Local\Temp\eo1vxvde.uoy\C01MU1.iid." why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="6" when="Friday, August 7, 2026 10:18:57 AM" who="Licenced User:  Admin Machine: DESKTOP-D2H5RE4 User: Admin" what="Device E01MU1 updated from C:\Users\Admin\AppData\Local\Temp\utn3qkzn.ts1\E01MU1.iid." why="IEC 61850 System Configurator Automatic Startup: Insert Comment" />
			<Hitem version="1" revision="7" when="Wednesday, August 12, 2026 5:09:10 PM" who="Licenced User:  Admin Machine: DESKTOP-D2H5RE4 User: Admin" what="SCD file exported as Edition2B4." why="IEC 61850 System Configurator User Action" />
		</History>
	</Header>
	<Communication>
		<SubNetwork name="Process Bus" type="8-MMS">
			<Private type="Siemens-Start-Address">172.16.0.1</Private>
			<ConnectedAP iedName="E0187T" apName="F">
				<Address>
					<P type="IP" xsi:type="tP_IP">192.168.1.1</P>
					<P type="IP-SUBNET" xsi:type="tP_IP-SUBNET">255.255.255.0</P>
					<P type="OSI-AP-Title" xsi:type="tP_OSI-AP-Title">1,3,9999,23</P>
					<P type="OSI-AE-Qualifier" xsi:type="tP_OSI-AE-Qualifier">23</P>
					<P type="OSI-PSEL" xsi:type="tP_OSI-PSEL">00000001</P>
					<P type="OSI-SSEL" xsi:type="tP_OSI-SSEL">0001</P>
					<P type="OSI-TSEL" xsi:type="tP_OSI-TSEL">0001</P>
				</Address>
				<GSE ldInst="CB1" cbName="Control_DataSet">
					<Address>
						<P type="MAC-Address" xsi:type="tP_MAC-Address">01-0C-CD-01-00-00</P>
						<P type="VLAN-ID" xsi:type="tP_VLAN-ID">000</P>
						<P type="VLAN-PRIORITY" xsi:type="tP_VLAN-PRIORITY">4</P>
						<P type="APPID" xsi:type="tP_APPID">0001</P>
					</Address>
					<MinTime unit="s" multiplier="m">10</MinTime>
					<MaxTime unit="s" multiplier="m">2000</MaxTime>
				</GSE>
				<GSE ldInst="CB2" cbName="Control_DataSet">
					<Address>
						<P type="MAC-Address" xsi:type="tP_MAC-Address">01-0C-CD-01-00-01</P>
						<P type="VLAN-ID" xsi:type="tP_VLAN-ID">000</P>
						<P type="VLAN-PRIORITY" xsi:type="tP_VLAN-PRIORITY">4</P>
						<P type="APPID" xsi:type="tP_APPID">0002</P>
					</Address>
					<MinTime unit="s" multiplier="m">10</MinTime>
					<MaxTime unit="s" multiplier="m">2000</MaxTime>
				</GSE>
			</ConnectedAP>
			<ConnectedAP iedName="C01MU1" apName="F">
				<Address>
					<P type="IP" xsi:type="tP_IP">192.168.1.2</P>
					<P type="IP-SUBNET" xsi:type="tP_IP-SUBNET">255.255.255.0</P>
					<P type="OSI-AP-Title" xsi:type="tP_OSI-AP-Title">1,3,9999,23</P>
					<P type="OSI-AE-Qualifier" xsi:type="tP_OSI-AE-Qualifier">23</P>
					<P type="OSI-PSEL" xsi:type="tP_OSI-PSEL">00000001</P>
					<P type="OSI-SSEL" xsi:type="tP_OSI-SSEL">0001</P>
					<P type="OSI-TSEL" xsi:type="tP_OSI-TSEL">0001</P>
				</Address>
				<SMV ldInst="Mod2_MU1" cbName="MSVCB03">
					<Address>
						<P type="VLAN-ID" xsi:type="tP_VLAN-ID">000</P>
						<P type="VLAN-PRIORITY" xsi:type="tP_VLAN-PRIORITY">4</P>
						<P type="MAC-Address" xsi:type="tP_MAC-Address">01-0C-CD-04-00-00</P>
						<P type="APPID" xsi:type="tP_APPID">4001</P>
					</Address>
				</SMV>
			</ConnectedAP>
			<ConnectedAP iedName="E01MU1" apName="F">
				<Address>
					<P type="IP" xsi:type="tP_IP">192.168.1.3</P>
					<P type="IP-SUBNET" xsi:type="tP_IP-SUBNET">255.255.255.0</P>
					<P type="OSI-AP-Title" xsi:type="tP_OSI-AP-Title">1,3,9999,23</P>
					<P type="OSI-AE-Qualifier" xsi:type="tP_OSI-AE-Qualifier">23</P>
					<P type="OSI-PSEL" xsi:type="tP_OSI-PSEL">00000001</P>
					<P type="OSI-SSEL" xsi:type="tP_OSI-SSEL">0001</P>
					<P type="OSI-TSEL" xsi:type="tP_OSI-TSEL">0001</P>
				</Address>
				<SMV ldInst="Mod2_MU1" cbName="MSVCB03">
					<Address>
						<P type="VLAN-ID" xsi:type="tP_VLAN-ID">000</P>
						<P type="VLAN-PRIORITY" xsi:type="tP_VLAN-PRIORITY">4</P>
						<P type="MAC-Address" xsi:type="tP_MAC-Address">01-0C-CD-04-00-01</P>
						<P type="APPID" xsi:type="tP_APPID">4002</P>
					</Address>
				</SMV>
			</ConnectedAP>
		</SubNetwork>
	</Communication>
	<IED desc="7UT85 Protection IED" name="E0187T" type="7UT85" manufacturer="SIEMENS" configVersion="V09.90.01" originalSclVersion="2007" originalSclRevision="B" owner="IEC station 1" originalSclRelease="4">
		<Private type="Siemens-MasterId">34d1852f-220d-42ec-a9e1-e8bfecda0361</Private>
		<Private type="Siemens-s7ManagerName">7UT85 Protection IED</Private>
		<Private type="Siemens-ICD-Language">en-US</Private>
		<Private type="Siemens-Siprotec5-Product-Code">7UT85-DAAA-AA0-0AAAA0-AZ0112-23111B-ABD000-000AC0-CC1BA1-CL0</Private>
		<Private type="Siemens-Siprotec5-Application-Template">7UT8x_2WindTransformer_Basic</Private>
		<Private type="Siemens-Siprotec5-Communication-Configuration-Version">99101</Private>
		<Private type="Siemens-Siprotec5-Configuration-Version">V09.90.01</Private>
		<Private type="Siemens-IsSiprotec5IED" />
		<Private type="Siemens-IED-Id">34d1852f-220d-42ec-a9e1-e8bfecda0361</Private>
		<Private type="Siemens-ModifiedDate">08/07/2026 02:18:58</Private>
		<Private type="Siemens-ModificationCounter">8</Private>
		<Services nameLength="64">
			<ClientServices goose="true" gsse="false" bufReport="false" unbufReport="false" readLog="false" sv="true" supportsLdName="true" maxGOOSE="128" maxSMV="16" rGOOSE="true" rSV="false" noIctBinding="false">
				<TimeSyncProt sntp="true" c37_238="false" other="false" iec61850_9_3="true" />
			</ClientServices>
			<DynAssociation max="8" />
			<SettingGroups>
				<SGEdit resvTms="true" />
			</SettingGroups>
			<GetDirectory />
			<GetDataObjectDefinition />
			<DataObjectDirectory />
			<GetDataSetValue />
			<DataSetDirectory />
			<ConfDataSet max="50" maxAttributes="200" modify="true" />
			<DynDataSet max="30" maxAttributes="60" />
			<ReadWrite />
			<ConfReportControl max="60" bufMode="both" bufConf="true" />
			<GetCBValues />
			<ReportSettings cbName="Conf" datSet="Dyn" rptID="Dyn" optFields="Dyn" bufTime="Dyn" trgOps="Dyn" intgPd="Dyn" resvTms="true" owner="true" />
			<GSESettings cbName="Conf" datSet="Conf" appID="Conf" dataLabel="Fix" kdaParticipant="false" />
			<ConfLNs fixPrefix="false" fixLnInst="false" />
			<ConfLdName />
			<GOOSE max="16" fixedOffs="false" goose="true" rGOOSE="true" />
			<FileHandling />
			<SupSubscription maxGo="0" maxSv="60" />
			<ValueHandling setToRO="false" />
			<RedProt hsr="true" prp="true" rstp="true" />
			<CommProt ipv6="false" />
		</Services>
		<AccessPoint desc="Port F" name="F" router="false" clock="false">
			<Server timeout="0">
				<Authentication none="true" />
				<LDevice desc="Application" inst="Application">
					<Private type="Siemens-MasterId">4e404e34-47cd-4ad0-92da-ce697f0a2c49</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_Application" desc="General">
						<Private type="Siemens-MasterId">2bc43140-d7ca-4aa5-87ab-0accb5696b42</Private>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB" confRev="1" buffered="false" name="A_URCB">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_1" confRev="1" buffered="false" name="A_URCB_1">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_2" confRev="1" buffered="false" name="A_URCB_2">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_3" confRev="1" buffered="false" name="A_URCB_3">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_4" confRev="1" buffered="false" name="A_URCB_4">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_5" confRev="1" buffered="false" name="A_URCB_5">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_6" confRev="1" buffered="false" name="A_URCB_6">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_7" confRev="1" buffered="false" name="A_URCB_7">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_8" confRev="1" buffered="false" name="A_URCB_8">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_9" confRev="1" buffered="false" name="A_URCB_9">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_10" confRev="1" buffered="false" name="A_URCB_10">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_11" confRev="1" buffered="false" name="A_URCB_11">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_12" confRev="1" buffered="false" name="A_URCB_12">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_13" confRev="1" buffered="false" name="A_URCB_13">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_14" confRev="1" buffered="false" name="A_URCB_14">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_15" confRev="1" buffered="false" name="A_URCB_15">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_16" confRev="1" buffered="false" name="A_URCB_16">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_17" confRev="1" buffered="false" name="A_URCB_17">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_18" confRev="1" buffered="false" name="A_URCB_18">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_19" confRev="1" buffered="false" name="A_URCB_19">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_20" confRev="1" buffered="false" name="A_URCB_20">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_21" confRev="1" buffered="false" name="A_URCB_21">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_22" confRev="1" buffered="false" name="A_URCB_22">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_23" confRev="1" buffered="false" name="A_URCB_23">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_24" confRev="1" buffered="false" name="A_URCB_24">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_25" confRev="1" buffered="false" name="A_URCB_25">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_26" confRev="1" buffered="false" name="A_URCB_26">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_27" confRev="1" buffered="false" name="A_URCB_27">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_28" confRev="1" buffered="false" name="A_URCB_28">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$RP$A_URCB_29" confRev="1" buffered="false" name="A_URCB_29">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB" confRev="1" buffered="true" name="A_BRCB">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_1" confRev="1" buffered="true" name="A_BRCB_1">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_2" confRev="1" buffered="true" name="A_BRCB_2">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_3" confRev="1" buffered="true" name="A_BRCB_3">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_4" confRev="1" buffered="true" name="A_BRCB_4">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_5" confRev="1" buffered="true" name="A_BRCB_5">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_6" confRev="1" buffered="true" name="A_BRCB_6">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_7" confRev="1" buffered="true" name="A_BRCB_7">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_8" confRev="1" buffered="true" name="A_BRCB_8">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_9" confRev="1" buffered="true" name="A_BRCB_9">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_10" confRev="1" buffered="true" name="A_BRCB_10">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_11" confRev="1" buffered="true" name="A_BRCB_11">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_12" confRev="1" buffered="true" name="A_BRCB_12">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_13" confRev="1" buffered="true" name="A_BRCB_13">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_14" confRev="1" buffered="true" name="A_BRCB_14">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_15" confRev="1" buffered="true" name="A_BRCB_15">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_16" confRev="1" buffered="true" name="A_BRCB_16">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_17" confRev="1" buffered="true" name="A_BRCB_17">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_18" confRev="1" buffered="true" name="A_BRCB_18">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_19" confRev="1" buffered="true" name="A_BRCB_19">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_20" confRev="1" buffered="true" name="A_BRCB_20">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_21" confRev="1" buffered="true" name="A_BRCB_21">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_22" confRev="1" buffered="true" name="A_BRCB_22">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_23" confRev="1" buffered="true" name="A_BRCB_23">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E0187TApplication/LLN0$BR$A_BRCB_24" confRev="1" buffered="true" name="A_BRCB_24">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<DOI name="Mod" desc="Application mode" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health (61850 only)" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="LEDRs" desc="LED reset" />
						<DOI name="LocKey" desc="Sw.authority key/set">
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="MltLev" desc="Multiple sw.auth. levels">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<SettingControl numOfSGs="1" actSG="1">
							<Private type="Siemens-MasterId">eee36905-587c-4ad3-82cb-ef0095df850a</Private>
						</SettingControl>
					</LN0>
					<LN prefix="" lnClass="LPHD" inst="0" lnType="SIPROTEC5_LNType_LPHD" desc="Device">
						<Private type="Siemens-MasterId">00403d93-b6c1-43a3-8aeb-87d44ec23ee8</Private>
						<DOI name="PhyNam" desc="Physical device name">
							<DAI name="vendor">
								<Val>SIEMENS</Val>
							</DAI>
							<DAI name="hwRev">
								<Val>7UT85-DAAA-AA0-0AAAA0-AZ0112-23111B-ABD000-000AC0-CC1BA1-CL0</Val>
							</DAI>
							<DAI name="swRev">
								<Val>V09.91</Val>
							</DAI>
							<DAI name="model">
								<Val>7UT85</Val>
							</DAI>
							<DAI name="d">
								<Val>SIEMENS SIPROTEC 5</Val>
							</DAI>
						</DOI>
						<DOI name="PhyHealth" desc="Physical health" />
						<DOI name="Proxy" desc="Proxy" />
						<DOI name="PwrUp" desc="Device startup" />
						<DOI name="Sim" desc="GOOSE/SV sim.mode" />
						<DOI name="OpTmh" desc="Device operating hours">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>h</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="PrcModIna" desc="Process mode inactive" />
					</LN>
					<LN prefix="" lnClass="CALH" inst="0" lnType="SIPROTEC5_LNType_CALH_Application" desc="Alarm handling">
						<Private type="Siemens-MasterId">c0f9fabd-9810-4de7-8a84-081528c38edd</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="GrAlm" desc="Group alarm" />
						<DOI name="GrWrn" desc="Group warning" />
						<DOI name="GrInd" desc="Group indication" />
					</LN>
					<LN prefix="" lnClass="LTIM" inst="0" lnType="SIPROTEC5_LNType_LTIM_Application" desc="Time managem.">
						<Private type="Siemens-MasterId">e2be54de-2be7-4ef4-802c-cf347a3af1b3</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="TmDT" desc="Daylight saving time" />
						<DOI name="TmOfsTmm" desc="Time zone offset to UTC">
							<DAI name="setVal">
								<Val>60</Val>
							</DAI>
							<DAI name="minVal">
								<Val>-720</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>840</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>15</Val>
							</DAI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>min</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmUseDT" desc="Switch daylight sav. time">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="TmChgDT" desc="Start of daylight sav. time">
							<SDI name="setCal">
								<DAI name="occ">
									<Val>0</Val>
								</DAI>
								<DAI name="occType">
									<Val>WeekDay</Val>
								</DAI>
								<DAI name="occPer">
									<Val>Year</Val>
								</DAI>
								<DAI name="weekDay">
									<Val>Sunday</Val>
								</DAI>
								<DAI name="month">
									<Val>March</Val>
								</DAI>
								<DAI name="day">
									<Val>0</Val>
								</DAI>
								<DAI name="hr">
									<Val>2</Val>
								</DAI>
								<DAI name="mn">
									<Val>0</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmChgST" desc="End of daylight sav. time">
							<SDI name="setCal">
								<DAI name="occ">
									<Val>0</Val>
								</DAI>
								<DAI name="occType">
									<Val>WeekDay</Val>
								</DAI>
								<DAI name="occPer">
									<Val>Year</Val>
								</DAI>
								<DAI name="weekDay">
									<Val>Sunday</Val>
								</DAI>
								<DAI name="month">
									<Val>October</Val>
								</DAI>
								<DAI name="day">
									<Val>0</Val>
								</DAI>
								<DAI name="hr">
									<Val>3</Val>
								</DAI>
								<DAI name="mn">
									<Val>0</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="LTMS" inst="0" lnType="SIPROTEC5_LNType_LTMS_Application" desc="Time/Samp.syn.">
						<Private type="Siemens-MasterId">b57f51fb-93d7-454e-b1dd-97a55959a446</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrc" desc="Current time source" />
						<DOI name="TmSrcTyp" desc="Type of clock source" />
						<DOI name="TmChSt1" desc="Status time source 1" />
						<DOI name="TmChSt2" desc="Status time source 2" />
					</LN>
					<LN prefix="" lnClass="LTRK" inst="0" lnType="SIPROTEC5_LNType_LTRK_Application" desc="Service track.">
						<Private type="Siemens-MasterId">10aaac98-bcc2-4429-9245-5c397b9ad8f5</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="GenTrk" desc="Common Tracking" />
						<DOI name="SgcbTrk" desc="Settings grps. access" />
						<DOI name="UrcbTrk" desc="UrcbTrk" />
						<DOI name="BrcbTrk" desc="BrcbTrk" />
						<DOI name="SpcTrk" desc="SPC control tracking" />
						<DOI name="DpcTrk" desc="DPC control tracking" />
						<DOI name="IncTrk" desc="INC control tracking" />
						<DOI name="EncTrk1" desc="ENC1 control tracking" />
						<DOI name="EncTrk2" desc="ENC2 control tracking" />
						<DOI name="EncTrk3" desc="ENC3 control tracking" />
						<DOI name="EncTrk4" desc="ENC4 control tracking" />
						<DOI name="ApcFTrk" desc="APC control tracking">
							<SDI name="ctlVal">
								<DAI name="f" />
							</SDI>
						</DOI>
						<DOI name="BscTrk" desc="BSC control tracking" />
						<DOI name="IscTrk" desc="ISC control tracking" />
						<DOI name="BacTrk" desc="BAC control tracking" />
					</LN>
					<LN prefix="RSBO" lnClass="GAPC" inst="0" lnType="SIPROTEC5_LNType_ResetBO" desc="Res. bin. out.">
						<Private type="Siemens-MasterId">514d6a59-1c92-4a45-ad34-7bd88b773e8a</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="0" lnType="SIPROTEC5_LNType_ResetBO" desc="LED not in FG">
						<Private type="Siemens-MasterId">e91ba490-27fb-4eb6-a7a6-03d42ecf7533</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Binary IO" inst="BinIO">
					<Private type="Siemens-MasterId">17665203-1b20-4a5c-b63d-5653cab304c4</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="BinIO/LLN0/LLN0">
						<Private type="Siemens-MasterId">26944790-0490-4263-8dbe-92c821dcef0d</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="Binary IO_BI" inst="BinIO_BinaryInputs">
					<Private type="Siemens-MasterId">1b2edc4d-0842-45f7-b5bf-b1ee4eff5721</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="BinIO_BinaryInputs/LLN0/LLN0">
						<Private type="Siemens-MasterId">c50039d4-0455-4ea9-ae14-9d6c0d206d12</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@BinIO</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="Binary IO_BO" inst="BinIO_BinaryOutputs">
					<Private type="Siemens-MasterId">3803c61d-9a41-4dcb-b55c-fb2c133c67dc</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="BinIO_BinaryOutputs/LLN0/LLN0">
						<Private type="Siemens-MasterId">3c53d169-eddc-402a-bc8c-981f5fad66e3</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@BinIO</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="400kV CB" inst="CB1">
					<Private type="Siemens-MasterId">250b9e20-3c02-4002-917c-1e2ee863e2fa</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="CB1/LLN0/LLN0">
						<Private type="Siemens-MasterId">57fa6905-d74b-41da-9d59-8dea1b7877e8</Private>
						<DataSet name="DataSet">
							<Private type="Siemens-GUID">bce93159b81348189fa48c9766394e4f</Private>
							<FCDA ldInst="CB1" prefix="" lnClass="PTRC" lnInst="1" doName="Op" daName="general" fc="ST" />
							<FCDA ldInst="CB1" prefix="" lnClass="PTRC" lnInst="1" doName="Op" daName="q" fc="ST" />
						</DataSet>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
						<GSEControl datSet="DataSet" confRev="10001" appID="E01F87T/CB1/LLN0/Control_DataSet" name="Control_DataSet" type="GOOSE">
							<IEDName apRef="F">C01MU1</IEDName>
						</GSEControl>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">babfb71c-1664-4c9c-aff9-757487d97e27</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_Trip_3pol" desc="Trip logic">
						<Private type="Siemens-MasterId">23979f11-e8c2-4990-ae76-bcc74dd3d92e</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Tr" desc="Trip indication" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="" lnClass="XCBR" inst="1" lnType="SIPROTEC5_LNType_XCBR_3pol_Ctl" desc="Circuit break.">
						<Private type="Siemens-MasterId">ede62312-c4c1-4136-8a92-7e298ceef250</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="EEHealth" desc="External health" />
						<DOI name="EEName" desc="External name plate" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>100</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SumSwARs" desc="ΣI Brk.">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="pulsQty">
								<Val>0.001</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="GAPC" inst="2" lnType="SIPROTEC5_LNType_GAPC_ManualClose" desc="Manual close">
						<Private type="Siemens-MasterId">dd11095e-8486-4008-88f7-7a88652e3999</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block manual close" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetBO" desc="Reset LED Group">
						<Private type="Siemens-MasterId">a8e53ee2-ba15-4b5d-834b-5cf3e5a865c8</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="TSCB_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_FB_HSBT_BreakerAdaptor" desc="HSBT interface">
						<Private type="Siemens-MasterId">bcbb8964-7b46-44a9-9454-472f0db2c0cf</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_LNType_CSWI" desc="Control">
						<Private type="Siemens-MasterId">81adc39d-7060-483a-8a44-8e65d4e023c5</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_LNType_CILO" desc="Interlocking">
						<Private type="Siemens-MasterId">794b38ae-cae5-4d6e-8dc7-afe96ab8b78f</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
					</LN>
					<LN prefix="CBT_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="CB test">
						<Private type="Siemens-MasterId">25189155-8bd5-4328-b34d-afd65db0bd72</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="400kV CB_FdOMV" inst="CB1_Fundamental">
					<Private type="Siemens-MasterId">b218e77e-eb78-4d63-beea-8e1d649d9480</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="CB1_Fundamental/LLN0/LLN0">
						<Private type="Siemens-MasterId">47a20968-db82-4e38-8cf0-b61f9040e180</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@CB1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">e4a21f27-fbc8-4397-8391-95352bd6d406</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>400</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>400</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>400</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>400</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="110kV CB" inst="CB2">
					<Private type="Siemens-MasterId">9fbadbbe-1593-4ea0-87d3-40340cec8254</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="CB2/LLN0/LLN0">
						<Private type="Siemens-MasterId">86b7f3a3-4134-4134-8c63-22f57cf9a134</Private>
						<DataSet name="DataSet">
							<Private type="Siemens-GUID">462e95a0db0646279cd0ea5ef1db8ea8</Private>
							<FCDA ldInst="CB2" prefix="" lnClass="PTRC" lnInst="1" doName="Op" daName="general" fc="ST" />
							<FCDA ldInst="CB2" prefix="" lnClass="PTRC" lnInst="1" doName="Op" daName="q" fc="ST" />
						</DataSet>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
						<GSEControl datSet="DataSet" confRev="10001" appID="E01F87T/CB2/LLN0/Control_DataSet" name="Control_DataSet" type="GOOSE">
							<IEDName apRef="F">E01MU1</IEDName>
						</GSEControl>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">05acbce9-85ec-42a6-a82c-3529bda6e170</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_Trip_3pol" desc="Trip logic">
						<Private type="Siemens-MasterId">99186d99-5e32-4a87-9bc4-cdfbea4bb782</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Tr" desc="Trip indication" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="" lnClass="XCBR" inst="1" lnType="SIPROTEC5_LNType_XCBR_3pol_Ctl" desc="Circuit break.">
						<Private type="Siemens-MasterId">3b2553e7-6eb7-422f-acd6-d767984a50d7</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="EEHealth" desc="External health" />
						<DOI name="EEName" desc="External name plate" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>100</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SumSwARs" desc="ΣI Brk.">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="pulsQty">
								<Val>0.001</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="GAPC" inst="2" lnType="SIPROTEC5_LNType_GAPC_ManualClose" desc="Manual close">
						<Private type="Siemens-MasterId">8ffdb22e-0745-45d9-a11d-0bfd756b7126</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block manual close" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetBO" desc="Reset LED Group">
						<Private type="Siemens-MasterId">775958ee-080e-4b68-8881-32ff6ccba56e</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="TSCB_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_FB_HSBT_BreakerAdaptor" desc="HSBT interface">
						<Private type="Siemens-MasterId">e9cf3486-b92b-4cab-88ce-5b963865dcf0</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_LNType_CSWI" desc="Control">
						<Private type="Siemens-MasterId">bd02e2b5-2625-4e64-a75a-c18269815d37</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_LNType_CILO" desc="Interlocking">
						<Private type="Siemens-MasterId">977eb5a2-eb80-40e1-93b2-85ef29a56db0</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
					</LN>
					<LN prefix="CBT_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="CB test">
						<Private type="Siemens-MasterId">f910d3de-4f2c-4e5b-90db-dbf0008f68bc</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="110kV CB_FdOMV" inst="CB2_Fundamental">
					<Private type="Siemens-MasterId">589699e1-f7ed-46ab-b642-ffa103e538bf</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="CB2_Fundamental/LLN0/LLN0">
						<Private type="Siemens-MasterId">9a65444b-37f3-468c-b039-2735074d9e1a</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@CB2</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">a8f0e910-df39-4d50-a6e7-dfbaab9debb3</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>7500</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>7500</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>7500</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>7500</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Com. supervision" inst="ComSupervision">
					<Private type="Siemens-MasterId">2e6c14fe-0bd5-41ac-ac58-d024b1c245f8</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="ComSupervision/LLN0/LLN0">
						<Private type="Siemens-MasterId">acea44f1-28b3-4a0e-92b8-601133a3baeb</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:09</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="Com. supervision_SV supervision" inst="ComSupervision_SV">
					<Private type="Siemens-MasterId">863165f0-133a-45d5-87dc-ce955c6bc142</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="ComSupervision_SV/LLN0/LLN0">
						<Private type="Siemens-MasterId">6bc2f54c-3369-40d2-9e73-7866a2df2082</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:09</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@ComSupervision</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="CALH" inst="1" lnType="SIPROTEC5_LNType_CALH_LSVS" desc="Group Indicat.">
						<Private type="Siemens-MasterId">68e29518-ef6b-467e-820b-c789e16701ef</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:09</Val>
							</DAI>
						</DOI>
						<DOI name="GrAlm" desc="Group alarm" />
						<DOI name="GrInd" desc="Group indication" />
					</LN>
					<LN prefix="" lnClass="LSVS" inst="1" lnType="SIPROTEC5_LNType_LSVS" desc="Subscription 1">
						<Private type="Siemens-MasterId">29b5eb83-7d0b-47b8-85c9-75a9682671ca</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:09</Val>
							</DAI>
						</DOI>
						<DOI name="St" desc="Status subscription" />
						<DOI name="SimSt" desc="Status Sim messages" />
						<DOI name="ConfRevNum" desc="Exp. conf. rev." />
						<DOI name="SvCBRef" desc="Ref. SV CB">
							<DAI name="setSrcRef" valImport="true">
								<Val>C01MU1Mod2_MU1/LLN0.MSVCB03</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="LSVS" inst="2" lnType="SIPROTEC5_LNType_LSVS" desc="Subscription 2">
						<Private type="Siemens-MasterId">491d48f8-790b-4a55-8f50-848fa8ccaf6d</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-07 01:38:02</Val>
							</DAI>
						</DOI>
						<DOI name="St" desc="Status subscription" />
						<DOI name="SimSt" desc="Status Sim messages" />
						<DOI name="ConfRevNum" desc="Exp. conf. rev." />
						<DOI name="SvCBRef" desc="Ref. SV CB">
							<DAI name="setSrcRef" valImport="true">
								<Val>E01MU1Mod2_MU1/LLN0.MSVCB03</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="J:Onboard Ethernet" inst="Mod1">
					<Private type="Siemens-MasterId">6c6784a9-e6ab-4d8b-b6e7-08c619298852</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Mod1/LLN0/LLN0">
						<Private type="Siemens-MasterId">2da6da69-04f1-463e-92c8-848f20fdfceb</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="J:Onboard Ethernet_Chan.1" inst="Mod1_Channel1">
					<Private type="Siemens-MasterId">cf6d3a9f-d289-4f61-bd84-fbe439f2d76f</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Mod1_Channel1/LLN0/LLN0">
						<Private type="Siemens-MasterId">8f36a1fa-04aa-47b9-85a1-98f73e675c9b</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod1</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="F:ETH-BD-2FO" inst="Mod2">
					<Private type="Siemens-MasterId">751ae50e-fc74-427f-9400-8ef6b8e3a021</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Mod2/LLN0/LLN0">
						<Private type="Siemens-MasterId">d618a1c7-4ae7-4f54-b183-8fda104a32a9</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="F:ETH-BD-2FO_Chan.1" inst="Mod2_Channel1">
					<Private type="Siemens-MasterId">40f321ab-08af-4b84-b4fb-963fc9e54076</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Mod2_Channel1/LLN0/LLN0">
						<Private type="Siemens-MasterId">93f0b3fc-9a8c-4b1a-aa6a-ad57d1d8a8dc</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod2</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="Line_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_LineMode" desc="Line Mode">
						<Private type="Siemens-MasterId">7bcfdeee-cd0e-45ff-af41-02c8b6a8115e</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
						<DOI name="RedChLiv" desc="Redund. Channel Live" />
					</LN>
					<LN prefix="IEC81_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_61850" desc="IEC 61850-8-1">
						<Private type="Siemens-MasterId">0d6d0a80-2eb0-489e-85e0-9e915c7fca4d</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:09:34</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
					<LN prefix="PBCL_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_61850" desc="9-2 Client">
						<Private type="Siemens-MasterId">aaec3ae4-12e0-44de-9fe8-b9d248c6f718</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:09</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
					<LN prefix="PTP_" lnClass="LTPC" inst="1" lnType="SIPROTEC5_LNType_LTPC_IEEE1588HiAcc" desc="IEEE 1588">
						<Private type="Siemens-MasterId">0265636e-ec3d-4535-9f7c-ce25bcad09cb</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:09</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>(Tr)IEC 61850-90-4:2018A</Val>
							</DAI>
						</DOI>
						<DOI name="ClkAcc" desc="Clock accuracy" />
						<DOI name="ClkClass" desc="Clock class" />
						<DOI name="ClkId" desc="Clock identity" />
						<DOI name="GmClkClass" desc="GM clock class" />
						<DOI name="GmClkId" desc="GM clock identity" />
						<DOI name="GmClkPrio1" desc="GM clock priority 1" />
						<DOI name="GmClkPrio2" desc="GM clock priority 2" />
						<DOI name="GmClkAcc" desc="GM clock accuracy" />
						<DOI name="MePathDlTmns" desc="Mean path delay" />
						<DOI name="NumPorts" desc="Number of ports" />
						<DOI name="OfsMaster" desc="Offset from master">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>n</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="OfsUtc" desc="UtcOffset valid" />
						<DOI name="OfsUtcTms" desc="UtcOffset">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PrntClkId" desc="Master-clock identity" />
						<DOI name="Stepsr" desc="Steps removed" />
						<DOI name="TmSrcVal" desc="Time source" />
						<DOI name="TwoStep" desc="2-step" />
						<DOI name="PrntPortId" desc="Master-port identity" />
						<DOI name="GmClkVar" desc="GmClkVar" />
						<DOI name="ClkVar" desc="Clock variance" />
						<DOI name="ClkPrio1" desc="Clock priority 1">
							<DAI name="setVal">
								<Val>255</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="ClkPrio2" desc="Clock priority 2">
							<DAI name="setVal">
								<Val>255</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="DomainNum" desc="Domain number">
							<DAI name="setVal">
								<Val>0</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="OfsLimTmns" desc="Max. offset from master">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>10000</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>n</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Slave" desc="Slave only">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="PrntPortNum" desc="Master-port identity">
							<DAI name="setVal">
								<Val>0</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PTP_" lnClass="LTTC" inst="1" lnType="SIPROTEC5_LNType_LTTC_IEEE1588HiAcc" desc="IEEE 1588 TC">
						<Private type="Siemens-MasterId">284b4b66-4b19-48ea-b7bd-b9379962345a</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:09</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>(Tr)IEC 61850-90-4:2018A</Val>
							</DAI>
						</DOI>
						<DOI name="DomainNum" desc="Domain number">
							<DAI name="setVal">
								<Val>0</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PTP_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_61850" desc="IEEE 1588 Chan">
						<Private type="Siemens-MasterId">fda6fff9-7a09-4b54-b15f-0c01ecd01ef4</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:09</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
				</LDevice>
				<LDevice desc="E:ETH-BA-2EL" inst="Mod3">
					<Private type="Siemens-MasterId">f3cb95aa-9df0-4605-b96c-63466a30b5cd</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Mod3/LLN0/LLN0">
						<Private type="Siemens-MasterId">dc20fbf1-9dd2-47a4-86db-ca8dbf762bc2</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="E:ETH-BA-2EL_Chan.1" inst="Mod3_Channel1">
					<Private type="Siemens-MasterId">a99e5e48-d9bc-4f7b-b06e-2845d836cc7d</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Mod3_Channel1/LLN0/LLN0">
						<Private type="Siemens-MasterId">9c325fa8-8613-4ee6-96e7-d8534db73a70</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod3</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="Line_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_LineMode" desc="Line Mode">
						<Private type="Siemens-MasterId">bbf9ae8e-dbf2-432a-925e-08f57a8d0515</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
						<DOI name="RedChLiv" desc="Redund. Channel Live" />
					</LN>
				</LDevice>
				<LDevice desc="PTD1" inst="PTD1">
					<Private type="Siemens-MasterId">1c0e4834-4ad2-41e5-a686-0a65a0b1d1b8</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTD1/LLN0/LLN0">
						<Private type="Siemens-MasterId">fd8bd88d-6e0f-4ab1-8aa5-e2c1663f3ab7</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FG_GABC_Without_DirRouting_Op_1_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">b3aa4f68-fd1b-4d79-b8a1-4c58c038d87e</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetBO" desc="Reset LED Group">
						<Private type="Siemens-MasterId">ea9b8d44-27d2-4421-8e58-16be730eda8c</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="PTD1_87T 1" inst="PTD1_87TrafoDiffProt1">
					<Private type="Siemens-MasterId">dac427e0-6501-465a-9659-0660d3d56bec</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTD1_87TrafoDiffProt1/LLN0/LLN0">
						<Private type="Siemens-MasterId">29bc5136-1a6b-43d0-8b0f-52e9f2a323bc</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTD1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="S_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">87249b81-bf06-4239-bf70-909bb2420851</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="TR_" lnClass="PDIF" inst="1" lnType="SIPROTEC5_LNType_TDIFF_Restrained" desc="I-DIFF">
						<Private type="Siemens-MasterId">a69d705e-3670-4083-b7a1-50b2655360e5</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="TRF_" lnClass="PDIF" inst="1" lnType="SIPROTEC5_LNType_TDIFF_Restrained" desc="I-DIFF fast">
						<Private type="Siemens-MasterId">72821de4-2a5b-4bf0-8a3a-7a5699b37db6</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FG_GABC_Without_DirRouting_Op_1_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">c9c02142-eab9-4561-8eba-cf99b43d1404</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
				</LDevice>
				<LDevice desc="400kV T input" inst="PTS1">
					<Private type="Siemens-MasterId">45caf703-4e30-4714-8a02-a62d7e90c44e</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS1/LLN0/LLN0">
						<Private type="Siemens-MasterId">f35cb4d9-2ad5-44de-afb3-714aa06f0272</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="STR_" lnClass="YPTR" inst="1" lnType="SIPROTEC5_LNType_YPTR_FB0_FGTransformerSide" desc="General">
						<Private type="Siemens-MasterId">e29e9d2b-b016-4cc9-9802-b0eec4f923ab</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FG_GABCN_Without_DirRouting_Op_1_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">247bf297-77e6-418d-a321-1470d762dc7a</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetBO" desc="Reset LED Group">
						<Private type="Siemens-MasterId">d17ead8f-81d2-4539-8173-823aaa07033f</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="400kV T input_27 1" inst="PTS1_27Undervoltage1">
					<Private type="Siemens-MasterId">a75cc7dc-62c1-4f1c-b198-e74a4a9e4c84</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS1_27Undervoltage1/LLN0/LLN0">
						<Private type="Siemens-MasterId">1debdc0a-17c3-44da-8553-5494aa85d472</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTS1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">e3f27f14-44c1-4a84-a32b-578b8f65408a</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FN_Str_GABC_Without_DirRouting_Op_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">8508f0e9-a79e-4e55-983c-2547dda1dbcc</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="" lnClass="PTUV" inst="1" lnType="SIPROTEC5_LNType_PTUV" desc="Definite-T 1">
						<Private type="Siemens-MasterId">e8cc6021-7183-4590-9ce9-1eedc15a4b9a</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="" lnClass="PTUV" inst="2" lnType="SIPROTEC5_LNType_PTUV" desc="Definite-T 2">
						<Private type="Siemens-MasterId">23fdcaee-ab5f-4337-a0bb-2cdae0041e84</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
				</LDevice>
				<LDevice desc="400kV T input_51-A1" inst="PTS1_5051OC3phA1">
					<Private type="Siemens-MasterId">74063c4c-763e-47f1-86cc-9a40ba5c1d11</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS1_5051OC3phA1/LLN0/LLN0">
						<Private type="Siemens-MasterId">68bdab9e-43c6-4337-acc1-ab85d9a01414</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTS1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetBO" desc="General">
						<Private type="Siemens-MasterId">f49dbb6d-1185-4df8-9b47-c1dfffa09393</Private>
						<DOI name="Mod" desc="Mode (controllable)">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FG_GABC_Without_DirRouting_Op_1_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">a3c03c04-2f67-4911-8f09-e2f1812518e0</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="ID_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_3ph_DOCP_3pol" desc="Definite-T 1">
						<Private type="Siemens-MasterId">00b5cd93-5f75-4f92-aa4a-abfe07f4f9ca</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="II_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_3ph_DOCP_3pol" desc="Inverse-T 1">
						<Private type="Siemens-MasterId">1260a2a2-0c00-4133-9d3a-90f36228ec58</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
				</LDevice>
				<LDevice desc="400kV T input_59 1" inst="PTS1_59Overvoltage1">
					<Private type="Siemens-MasterId">3beb57d5-305c-496f-8ee7-96e01dd6d780</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS1_59Overvoltage1/LLN0/LLN0">
						<Private type="Siemens-MasterId">d3fa7259-c63f-4e32-a28b-893740a406b0</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTS1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FN_Str_GABC_Without_DirRouting_Op_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">da39cff1-71dd-42d9-95d9-d76ccfd67387</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="" lnClass="PTOV" inst="1" lnType="SIPROTEC5_LNType_PTOV" desc="Definite-T 1">
						<Private type="Siemens-MasterId">0765d1d4-195e-4243-b784-6b61cb02ca8d</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
				</LDevice>
				<LDevice desc="400kV T input_81OB 1" inst="PTS1_81OverfrequB1">
					<Private type="Siemens-MasterId">79604048-40cd-4319-9f51-5d2790fa7ab4</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS1_81OverfrequB1/LLN0/LLN0">
						<Private type="Siemens-MasterId">d0220f3b-0c9b-4c62-8b38-dd72be0ad973</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTS1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="POFB_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">4aa9f8f0-8582-47f2-81d5-edf223c8ac35</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC" desc="Group indicat.">
						<Private type="Siemens-MasterId">d731c791-6daf-4980-b6c7-c804ef462c2c</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="B_" lnClass="PTOF" inst="1" lnType="SIPROTEC5_LNType_PTOF" desc="Stage 1">
						<Private type="Siemens-MasterId">d0c1274b-8767-4ed6-a996-813169d258d1</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="B_" lnClass="PTOF" inst="2" lnType="SIPROTEC5_LNType_PTOF" desc="Stage 2">
						<Private type="Siemens-MasterId">8ef83b65-208b-4b9f-8f4e-4378ee52650c</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
				</LDevice>
				<LDevice desc="400kV T input_81UB 1" inst="PTS1_81UnderfrequB1">
					<Private type="Siemens-MasterId">784a39a9-0a01-4015-b9a9-4e16bd367a5b</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS1_81UnderfrequB1/LLN0/LLN0">
						<Private type="Siemens-MasterId">296fe103-afe4-4d9a-9dcb-7d6406c23621</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTS1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="PUFB_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">ba2a8ded-ed84-437b-9987-c6c868ba2575</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC" desc="Group indicat.">
						<Private type="Siemens-MasterId">7a82a5a3-f811-4f11-a691-305667a717f4</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="B_" lnClass="PTUF" inst="1" lnType="SIPROTEC5_LNType_PTUF" desc="Stage 1">
						<Private type="Siemens-MasterId">3e60a782-6a28-44a5-8ab8-536a92c60e3f</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="B_" lnClass="PTUF" inst="2" lnType="SIPROTEC5_LNType_PTUF" desc="Stage 2">
						<Private type="Siemens-MasterId">cdffb641-c0c5-45fe-a9dd-10d8d847c6db</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
				</LDevice>
				<LDevice desc="400kV T input_FdSym" inst="PTS1_FundSymComp">
					<Private type="Siemens-MasterId">9d776d2f-51c0-463b-8355-9f2560a30f2e</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS1_FundSymComp/LLN0/LLN0">
						<Private type="Siemens-MasterId">6621a228-aefb-497f-a39c-cddf7e032c8b</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTS1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">aaa9278f-8180-4172-9edd-27b9236f76ba</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>400</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>400</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>400</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>230.946884</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>230.946884</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>230.946884</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>230.946884</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>346.410156</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>346.410156</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>346.410156</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>346.410156</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="FPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">0ec78ba0-0bf4-425b-923d-24cfb42134f2</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="XPRE_" lnClass="MSQI" inst="1" lnType="SIPROTEC5_LNType_MSQI_OpMeas_Symm_Pres" desc="Sy.co.">
						<Private type="Siemens-MasterId">3f7f51a8-0e3b-4349-a032-0d9b10b86abd</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="SeqA" desc="Iseq">
							<SDI name="c1" desc="Iseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>346.410156</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Iseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>346.410156</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Iseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>346.410156</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SeqV" desc="Vseq">
							<SDI name="c1" desc="Vseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>230.946884</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Vseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>230.946884</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Vseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>230.946884</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="400kV T input_OMV" inst="PTS1_OperationalValues">
					<Private type="Siemens-MasterId">8718b273-e808-419e-a0a3-9aada03b2b13</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS1_OperationalValues/LLN0/LLN0">
						<Private type="Siemens-MasterId">b99a08b5-053c-48d2-acef-435c082b968a</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTS1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_RMS_3ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">f8e04285-5896-4911-a37e-18a2c5b281e8</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>400</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>400</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>400</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>230.946884</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>230.946884</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>k</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>230.946884</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>230.946884</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>346.410156</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>346.410156</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>346.410156</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>346.410156</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="RPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">404a286e-bb14-4760-990d-812063983222</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Power_3ph_Pres" desc="Power">
						<Private type="Siemens-MasterId">06dfc3fb-26df-43a9-bd34-cd4976152c59</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="TotW" desc="P tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>W</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>M</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>240</Val>
							</DAI>
						</DOI>
						<DOI name="TotVAr" desc="Q tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VAr</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>M</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>240</Val>
							</DAI>
						</DOI>
						<DOI name="TotVA" desc="S tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VA</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>M</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>240</Val>
							</DAI>
						</DOI>
						<DOI name="TotPF" desc="cos φ">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>cos(phi)</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="Hz" desc="f">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>100</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>50</Val>
							</DAI>
						</DOI>
						<DOI name="W" desc="P">
							<SDI name="phsA" desc="P:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>M</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>80</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="P:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>M</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>80</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="P:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>M</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>80</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VAr" desc="Q">
							<SDI name="phsA" desc="Q:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>M</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>80</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Q:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>M</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>80</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Q:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>M</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>80</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VA" desc="S">
							<SDI name="phsA" desc="S:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>M</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>80</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="S:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>M</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>80</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="S:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
									<DAI name="multiplier">
										<Val>M</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>80</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="400kV T input_ProMon" inst="PTS1_ProcessMonitor">
					<Private type="Siemens-MasterId">8b6bdbf6-00e2-4474-97f3-55dbdc667476</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS1_ProcessMonitor/LLN0/LLN0">
						<Private type="Siemens-MasterId">06a0dc8f-36fd-45aa-ab06-9de9b6aafda1</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTS1</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="110kV T Output" inst="PTS2">
					<Private type="Siemens-MasterId">ab4b397e-178e-4bf0-b38c-579bd6574b44</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS2/LLN0/LLN0">
						<Private type="Siemens-MasterId">a96cf2b1-28f3-48dc-bea9-14e1b96765c2</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="STR_" lnClass="YPTR" inst="1" lnType="SIPROTEC5_LNType_YPTR_FB0_FGTransformerSide" desc="General">
						<Private type="Siemens-MasterId">5ebc1463-40a9-4a28-a2fd-187e3d35ecfb</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FG_GABCN_Without_DirRouting_Op_1_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">02129e9d-f263-43e1-b0da-14d6fcaf2f5d</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetBO" desc="Reset LED Group">
						<Private type="Siemens-MasterId">5f1bfda9-d44d-4f92-8603-4b3da41db78c</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PHAR" inst="1" lnType="SIPROTEC5_LNType_PHAR" desc="Inrush detect.">
						<Private type="Siemens-MasterId">6f0a7acd-b330-4d4c-a683-f44de9b745b6</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
				</LDevice>
				<LDevice desc="110kV T Output_51-A1" inst="PTS2_5051OC3phA1">
					<Private type="Siemens-MasterId">0a491c1e-54b4-4b06-b9f9-6a3eaed06dab</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS2_5051OC3phA1/LLN0/LLN0">
						<Private type="Siemens-MasterId">66a41396-1b74-4c29-acc0-1136b06f7245</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTS2</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetBO" desc="General">
						<Private type="Siemens-MasterId">a4cef7a1-9e28-4059-a041-03725ce3a33e</Private>
						<DOI name="Mod" desc="Mode (controllable)">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FG_GABC_Without_DirRouting_Op_1_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">2cea2d8c-a9e4-4b36-9cdd-7443ef5385d5</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="ID_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_3ph_DOCP_3pol" desc="Definite-T 1">
						<Private type="Siemens-MasterId">1e3bc4d3-5eee-4d1d-8aff-b6332d12df81</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
					<LN prefix="II_" lnClass="PTOC" inst="1" lnType="SIPROTEC5_LNType_PTOC_3ph_DOCP_3pol" desc="Inverse-T 1">
						<Private type="Siemens-MasterId">06010ac9-dbff-41da-aa59-cb1c28b8b192</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="Str" desc="Pickup" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block stage" />
					</LN>
				</LDevice>
				<LDevice desc="110kV T Output_FdSym" inst="PTS2_FundSymComp">
					<Private type="Siemens-MasterId">72e76409-4138-4e81-830f-575cda4e81f4</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS2_FundSymComp/LLN0/LLN0">
						<Private type="Siemens-MasterId">c3e855a7-5ebd-4912-8ec4-a909dd3db3ed</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTS2</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">f83452c5-a9f7-4fb6-bb90-ee0dac20fc28</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1259.67334</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1259.67334</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1259.67334</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1259.67334</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="FPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">5503b539-d1da-4611-8d07-4e52b896faae</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="XPRE_" lnClass="MSQI" inst="1" lnType="SIPROTEC5_LNType_MSQI_OpMeas_Symm_Pres" desc="Sy.co.">
						<Private type="Siemens-MasterId">10bc2782-e8ef-41e8-b101-9798c43ea01d</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="SeqA" desc="Iseq">
							<SDI name="c1" desc="Iseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1259.67334</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Iseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1259.67334</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Iseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1259.67334</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SeqV" desc="Vseq">
							<SDI name="c1" desc="Vseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Vseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Vseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="110kV T Output_OMV" inst="PTS2_OperationalValues">
					<Private type="Siemens-MasterId">73639eee-0786-4156-b4e7-32240284e667</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS2_OperationalValues/LLN0/LLN0">
						<Private type="Siemens-MasterId">d2a4b403-2e5a-4288-a617-abd1ff05b156</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTS2</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_RMS_3ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">9a21b2d4-2ac1-41bb-b01b-61c05d8195cf</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1259.67334</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1259.67334</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1259.67334</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1259.67334</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="RPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">8be47487-6c51-4937-b488-6afecff95066</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Power_3ph_Pres" desc="Power">
						<Private type="Siemens-MasterId">62271e8b-da8f-4a36-8b4e-b11cecd93422</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="TotW" desc="P tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>W</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>2.4E+08</Val>
							</DAI>
						</DOI>
						<DOI name="TotVAr" desc="Q tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VAr</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>2.4E+08</Val>
							</DAI>
						</DOI>
						<DOI name="TotVA" desc="S tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VA</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>2.4E+08</Val>
							</DAI>
						</DOI>
						<DOI name="TotPF" desc="cos φ">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>cos(phi)</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="Hz" desc="f">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>100</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>50</Val>
							</DAI>
						</DOI>
						<DOI name="W" desc="P">
							<SDI name="phsA" desc="P:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>8E+07</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="P:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>8E+07</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="P:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>8E+07</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VAr" desc="Q">
							<SDI name="phsA" desc="Q:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>8E+07</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Q:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>8E+07</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Q:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>8E+07</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VA" desc="S">
							<SDI name="phsA" desc="S:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>8E+07</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="S:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>8E+07</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="S:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>8E+07</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="110kV T Output_ProMon" inst="PTS2_ProcessMonitor">
					<Private type="Siemens-MasterId">d90547c8-e1b2-4929-88cf-f42aece9dc09</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PTS2_ProcessMonitor/LLN0/LLN0">
						<Private type="Siemens-MasterId">2c2054da-e1f2-44d9-ab53-b9f4d921c43f</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PTS2</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="PowS" inst="PowS">
					<Private type="Siemens-MasterId">0540ba28-2e49-4b25-a4ba-e907cf88af2b</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PowS/LLN0/LLN0">
						<Private type="Siemens-MasterId">961aab11-7d96-47cf-a54c-add2ffce7a0f</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">547339da-587d-428f-8d05-b24f1af2d555</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="FrGr_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="FrqTrackGrp">
						<Private type="Siemens-MasterId">27ef2a25-7e45-4bb7-b09f-5b97fc1c9900</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="PowS_MP I-3ph 400kV" inst="PowS_MeasPointI3ph1">
					<Private type="Siemens-MasterId">a9ec86ac-aa76-4247-81c9-ee6c860b021a</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PowS_MeasPointI3ph1/LLN0/LLN0">
						<Private type="Siemens-MasterId">b003343a-73e6-4af6-ad54-eb875fbd5005</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PowS</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="CT3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="CT 3-phase">
						<Private type="Siemens-MasterId">493d1183-c87e-4a55-923b-217cfe040de8</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="I01A" lnClass="TCTR" inst="1" lnType="SIPROTEC5_LNType_TCTR" desc="CT 1">
						<Private type="Siemens-MasterId">dce86fab-82df-4ae3-af0f-f02ae5de1f78</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef desc="PowS_MP I-3ph 400kV.CT 1" iedName="C01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01A" lnClass="TCTR" lnInst="1" doName="AmpSv" daName="instMag.i" intAddr="AmpSv;TCTR/AmpSv/instMag.i" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="instMag.i" />
							<ExtRef desc="PowS_MP I-3ph 400kV.CT 1" iedName="C01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01A" lnClass="TCTR" lnInst="1" doName="AmpSv" daName="q" intAddr="AmpSv;TCTR/AmpSv/q" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="q" />
						</Inputs>
					</LN>
					<LN prefix="I01B" lnClass="TCTR" inst="2" lnType="SIPROTEC5_LNType_TCTR" desc="CT 2">
						<Private type="Siemens-MasterId">70b029d4-c65a-4504-af32-762ed1e5c58b</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef desc="PowS_MP I-3ph 400kV.CT 2" iedName="C01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01B" lnClass="TCTR" lnInst="2" doName="AmpSv" daName="instMag.i" intAddr="AmpSv;TCTR/AmpSv/instMag.i" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="instMag.i" />
							<ExtRef desc="PowS_MP I-3ph 400kV.CT 2" iedName="C01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01B" lnClass="TCTR" lnInst="2" doName="AmpSv" daName="q" intAddr="AmpSv;TCTR/AmpSv/q" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="q" />
						</Inputs>
					</LN>
					<LN prefix="I01C" lnClass="TCTR" inst="3" lnType="SIPROTEC5_LNType_TCTR" desc="CT 3">
						<Private type="Siemens-MasterId">8535a804-ca9b-4d31-b103-17535ea79f30</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef desc="PowS_MP I-3ph 400kV.CT 3" iedName="C01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01C" lnClass="TCTR" lnInst="3" doName="AmpSv" daName="instMag.i" intAddr="AmpSv;TCTR/AmpSv/instMag.i" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="instMag.i" />
							<ExtRef desc="PowS_MP I-3ph 400kV.CT 3" iedName="C01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01C" lnClass="TCTR" lnInst="3" doName="AmpSv" daName="q" intAddr="AmpSv;TCTR/AmpSv/q" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="q" />
						</Inputs>
					</LN>
					<LN prefix="I01N" lnClass="TCTR" inst="4" lnType="SIPROTEC5_LNType_TCTR" desc="CT 4">
						<Private type="Siemens-MasterId">8f7cd9ba-ee49-4b82-b67f-c9e12d829ec8</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef desc="PowS_MP I-3ph 400kV.CT 4" iedName="C01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01N" lnClass="TCTR" lnInst="4" doName="AmpSv" daName="instMag.i" intAddr="AmpSv;TCTR/AmpSv/instMag.i" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="instMag.i" />
							<ExtRef desc="PowS_MP I-3ph 400kV.CT 4" iedName="C01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01N" lnClass="TCTR" lnInst="4" doName="AmpSv" daName="q" intAddr="AmpSv;TCTR/AmpSv/q" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="q" />
						</Inputs>
					</LN>
				</LDevice>
				<LDevice desc="PowS_MP I-3ph 110kV" inst="PowS_MeasPointI3ph2">
					<Private type="Siemens-MasterId">830cfdac-8a2a-4365-a5d2-5cd1657b9caa</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PowS_MeasPointI3ph2/LLN0/LLN0">
						<Private type="Siemens-MasterId">0e25ee58-8d9f-4c73-86d4-2d0438d120d0</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PowS</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="CT3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="CT 3-phase">
						<Private type="Siemens-MasterId">3a345ae6-874a-47d3-a024-f19e00d5d810</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="I02A" lnClass="TCTR" inst="1" lnType="SIPROTEC5_LNType_TCTR" desc="CT 1">
						<Private type="Siemens-MasterId">b204eb7b-ca31-42d5-b75b-2b3d0db09062</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef desc="PowS_MP I-3ph 110kV.CT 1" iedName="E01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01A" lnClass="TCTR" lnInst="1" doName="AmpSv" daName="instMag.i" intAddr="AmpSv;TCTR/AmpSv/instMag.i" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="instMag.i" />
							<ExtRef desc="PowS_MP I-3ph 110kV.CT 1" iedName="E01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01A" lnClass="TCTR" lnInst="1" doName="AmpSv" daName="q" intAddr="AmpSv;TCTR/AmpSv/q" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="q" />
						</Inputs>
					</LN>
					<LN prefix="I02B" lnClass="TCTR" inst="2" lnType="SIPROTEC5_LNType_TCTR" desc="CT 2">
						<Private type="Siemens-MasterId">7d39fda3-fa82-4793-9949-2330e4482528</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef desc="PowS_MP I-3ph 110kV.CT 2" iedName="E01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01B" lnClass="TCTR" lnInst="2" doName="AmpSv" daName="instMag.i" intAddr="AmpSv;TCTR/AmpSv/instMag.i" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="instMag.i" />
							<ExtRef desc="PowS_MP I-3ph 110kV.CT 2" iedName="E01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01B" lnClass="TCTR" lnInst="2" doName="AmpSv" daName="q" intAddr="AmpSv;TCTR/AmpSv/q" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="q" />
						</Inputs>
					</LN>
					<LN prefix="I02C" lnClass="TCTR" inst="3" lnType="SIPROTEC5_LNType_TCTR" desc="CT 3">
						<Private type="Siemens-MasterId">604ef683-befa-4674-b123-2ea0db409f3f</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef desc="PowS_MP I-3ph 110kV.CT 3" iedName="E01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01C" lnClass="TCTR" lnInst="3" doName="AmpSv" daName="instMag.i" intAddr="AmpSv;TCTR/AmpSv/instMag.i" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="instMag.i" />
							<ExtRef desc="PowS_MP I-3ph 110kV.CT 3" iedName="E01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01C" lnClass="TCTR" lnInst="3" doName="AmpSv" daName="q" intAddr="AmpSv;TCTR/AmpSv/q" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="q" />
						</Inputs>
					</LN>
					<LN prefix="I02N" lnClass="TCTR" inst="4" lnType="SIPROTEC5_LNType_TCTR" desc="CT 4">
						<Private type="Siemens-MasterId">543ee9c2-75f1-444b-8b80-c6d02c0253bb</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef desc="PowS_MP I-3ph 110kV.CT 4" iedName="E01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01N" lnClass="TCTR" lnInst="4" doName="AmpSv" daName="instMag.i" intAddr="AmpSv;TCTR/AmpSv/instMag.i" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="instMag.i" />
							<ExtRef desc="PowS_MP I-3ph 110kV.CT 4" iedName="E01MU1" ldInst="PowS_MeasPointI3ph1" prefix="I01N" lnClass="TCTR" lnInst="4" doName="AmpSv" daName="q" intAddr="AmpSv;TCTR/AmpSv/q" serviceType="SMV" srcLDInst="Mod2_MU1" srcLNClass="LLN0" srcCBName="MSVCB03" pServT="SMV" pLN="TCTR" pDO="AmpSv" pDA="q" />
						</Inputs>
					</LN>
				</LDevice>
				<LDevice desc="PowS_MPV3p1" inst="PowS_MeasPointV3ph1">
					<Private type="Siemens-MasterId">937216e5-4577-4439-b935-4b3b1448bc37</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PowS_MeasPointV3ph1/LLN0/LLN0">
						<Private type="Siemens-MasterId">32153d6f-4fc9-4e59-917e-26700501aee8</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PowS</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="VT3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="VT 3-phase">
						<Private type="Siemens-MasterId">a1cc00cb-e7cb-41d3-942e-71016f3a6f9a</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="U01A" lnClass="TVTR" inst="1" lnType="SIPROTEC5_LNType_TVTR" desc="VT 1">
						<Private type="Siemens-MasterId">5908d1ee-29d0-49d9-9aef-9713203c00db</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="VolSv" desc="Sampled val. voltage">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VRtg" desc="Rated primary voltage">
							<SDI name="setMag">
								<DAI name="f">
									<Val>230.940109</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>k</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>1200</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>4000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>3.46410155</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5/3P</Val>
							</DAI>
						</DOI>
						<DOI name="NamVRtg" desc="NamVRtg">
							<DAI name="val">
								<Val>173000</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>2</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="U01B" lnClass="TVTR" inst="2" lnType="SIPROTEC5_LNType_TVTR" desc="VT 2">
						<Private type="Siemens-MasterId">82028830-f236-46e7-8d0c-eae4b02f7094</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="VolSv" desc="Sampled val. voltage">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VRtg" desc="Rated primary voltage">
							<SDI name="setMag">
								<DAI name="f">
									<Val>230.940109</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>k</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>1200</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>4000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>3.46410155</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5/3P</Val>
							</DAI>
						</DOI>
						<DOI name="NamVRtg" desc="NamVRtg">
							<DAI name="val">
								<Val>173000</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>2</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="U01C" lnClass="TVTR" inst="3" lnType="SIPROTEC5_LNType_TVTR" desc="VT 3">
						<Private type="Siemens-MasterId">f44474b0-5117-4205-9e31-0987721017ac</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="VolSv" desc="Sampled val. voltage">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VRtg" desc="Rated primary voltage">
							<SDI name="setMag">
								<DAI name="f">
									<Val>230.940109</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>k</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>1200</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>4000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>3.46410155</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5/3P</Val>
							</DAI>
						</DOI>
						<DOI name="NamVRtg" desc="NamVRtg">
							<DAI name="val">
								<Val>173000</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>2</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="U01N" lnClass="TVTR" inst="4" lnType="SIPROTEC5_LNType_TVTR" desc="VT 4">
						<Private type="Siemens-MasterId">4c5107b0-6841-4660-ae36-4afe76ef97a1</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="VolSv" desc="Sampled val. voltage">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VRtg" desc="Rated primary voltage">
							<SDI name="setMag">
								<DAI name="f">
									<Val>230.940109</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>V</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>k</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>1200</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>2312.13867</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>3.46410155</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5/3P</Val>
							</DAI>
						</DOI>
						<DOI name="NamVRtg" desc="NamVRtg">
							<DAI name="val">
								<Val>173000</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>2</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Rec" inst="Rec">
					<Private type="Siemens-MasterId">43d6aff5-6f37-4076-a0b7-003abbb35a53</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Rec/LLN0/LLN0">
						<Private type="Siemens-MasterId">4ab89b58-e7c4-43d2-81a5-ac6d57bcace6</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RCDG_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">6af3ebdb-c2d3-48e0-81fc-544ceb8c55e9</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="GFLG_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="Grnd.-flt log">
						<Private type="Siemens-MasterId">6f138682-64a5-4915-904f-1710e7612b95</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Rec_FltRec" inst="Rec_FaultRecorder">
					<Private type="Siemens-MasterId">99642242-0d2c-481e-a304-2e1c9b750e18</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Rec_FaultRecorder/LLN0/LLN0">
						<Private type="Siemens-MasterId">cd2da2fe-8a53-4596-8e0f-4eda80ee44c4</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Rec</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RCDR_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">1a3961a8-bcfd-41ce-ac1a-a07430ee0e72</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="DEF_" lnClass="RDRE" inst="1" lnType="SIPROTEC5_LNType_RDRE_DEF" desc="Control">
						<Private type="Siemens-MasterId">a5a0da0a-eea3-4bf1-8ee3-91ee7bd09668</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:07:26</Val>
							</DAI>
						</DOI>
						<DOI name="RcdTrg" desc="Start record" />
						<DOI name="MemRs" desc="Reset memory">
							<DAI name="operTimeout">
								<Val>30000</Val>
							</DAI>
						</DOI>
						<DOI name="MemClr" desc="Clear memory">
							<DAI name="operTimeout">
								<Val>30000</Val>
							</DAI>
						</DOI>
						<DOI name="RcdMade" desc="Record made" />
						<DOI name="FltNum" desc="Fault number" />
						<DOI name="RcdStr" desc="Recording started" />
					</LN>
				</LDevice>
				<LDevice desc="User" inst="UD1">
					<Private type="Siemens-MasterId">c7174ea6-48f1-49c7-b5b4-cef7894993b3</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="UD1/LLN0/LLN0">
						<Private type="Siemens-MasterId">2612ef24-fb0d-45f4-b15a-0ac05e00d275</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:52:51</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_FB0BehHealthForFG" desc="General">
						<Private type="Siemens-MasterId">2b73a06f-13cd-4025-80da-2d0e7a7f3fcb</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:52:51</Val>
							</DAI>
						</DOI>
						<DOI name="SPS" desc="Pickup 110kV" />
						<DOI name="SPS1" desc="Trip 110kV" />
						<DOI name="SPS2" desc="Pickup 400kV" />
						<DOI name="SPS3" desc="Trip 400kV" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetBO" desc="Reset LED Group">
						<Private type="Siemens-MasterId">40f0b1e6-1014-446b-87ec-e3c913adb449</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-07-09 08:52:51</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
			</Server>
		</AccessPoint>
	</IED>
	<IED desc="MU 400kV" name="C01MU1" type="6MU85" manufacturer="SIEMENS" configVersion="V09.90.01" originalSclVersion="2007" originalSclRevision="B" owner="IEC station 1" originalSclRelease="4">
		<Private type="Siemens-MasterId">dc95f82a-f62c-44a0-b6a8-a65f4ffd0192</Private>
		<Private type="Siemens-s7ManagerName">MU 400kV</Private>
		<Private type="Siemens-ICD-Language">en-US</Private>
		<Private type="Siemens-Siprotec5-Product-Code">6MU85-????-???-??????-?901?1-13??1A-ABD000-000AC0-CA1BA1</Private>
		<Private type="Siemens-Siprotec5-Application-Template">6MU85_4I</Private>
		<Private type="Siemens-Siprotec5-Communication-Configuration-Version">99001</Private>
		<Private type="Siemens-Siprotec5-Configuration-Version">V09.90.01</Private>
		<Private type="Siemens-IsSiprotec5IED" />
		<Private type="Siemens-IED-Id">dc95f82a-f62c-44a0-b6a8-a65f4ffd0192</Private>
		<Private type="Siemens-ModifiedDate">08/07/2026 02:17:12</Private>
		<Private type="Siemens-ModificationCounter">6</Private>
		<Private type="Siemens-NoOfSmvsConfigured">5</Private>
		<Services nameLength="64">
			<ClientServices goose="true" gsse="false" bufReport="false" unbufReport="false" readLog="false" sv="false" supportsLdName="true" maxGOOSE="128" rGOOSE="true" rSV="false" noIctBinding="false">
				<TimeSyncProt sntp="true" c37_238="false" other="false" iec61850_9_3="true" />
			</ClientServices>
			<DynAssociation max="8" />
			<SettingGroups>
				<SGEdit resvTms="true" />
			</SettingGroups>
			<GetDirectory />
			<GetDataObjectDefinition />
			<DataObjectDirectory />
			<GetDataSetValue />
			<DataSetDirectory />
			<ConfDataSet max="50" maxAttributes="200" modify="true" />
			<DynDataSet max="30" maxAttributes="60" />
			<ReadWrite />
			<ConfReportControl max="60" bufMode="both" bufConf="true" />
			<GetCBValues />
			<ReportSettings cbName="Conf" datSet="Dyn" rptID="Dyn" optFields="Dyn" bufTime="Dyn" trgOps="Dyn" intgPd="Dyn" resvTms="true" owner="true" />
			<GSESettings cbName="Conf" datSet="Conf" appID="Conf" dataLabel="Fix" kdaParticipant="false" />
			<ConfLNs fixPrefix="false" fixLnInst="false" />
			<ConfLdName />
			<GOOSE max="16" fixedOffs="false" goose="true" rGOOSE="true" />
			<FileHandling />
			<SupSubscription maxGo="0" maxSv="0" />
			<ValueHandling setToRO="false" />
			<RedProt hsr="true" prp="true" rstp="true" />
			<CommProt ipv6="false" />
			<SMVSettings cbName="Conf" datSet="Fix" svID="Conf" optFields="Fix" smpRate="Fix" samplesPerSec="true" synchSrcId="true" nofASDU="Fix" kdaParticipant="false">
				<SmpRate>80</SmpRate>
				<SmpRate>256</SmpRate>
				<SamplesPerSec>4000</SamplesPerSec>
				<SamplesPerSec>4800</SamplesPerSec>
				<SamplesPerSec>12800</SamplesPerSec>
				<SamplesPerSec>14400</SamplesPerSec>
				<SamplesPerSec>15360</SamplesPerSec>
			</SMVSettings>
			<SMVsc max="1" delivery="multicast" deliveryConf="false" sv="true" rSV="false" />
		</Services>
		<AccessPoint desc="Port F" name="F" router="false" clock="false">
			<Server timeout="0">
				<Authentication none="true" />
				<LDevice desc="Application" inst="Application">
					<Private type="Siemens-MasterId">2f72402b-60a2-46fb-9da1-81509a644314</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_Application" desc="General">
						<Private type="Siemens-MasterId">22de0fdd-cfb4-4340-8abc-bdfd10b8a0f6</Private>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB" confRev="1" buffered="false" name="A_URCB">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_1" confRev="1" buffered="false" name="A_URCB_1">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_2" confRev="1" buffered="false" name="A_URCB_2">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_3" confRev="1" buffered="false" name="A_URCB_3">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_4" confRev="1" buffered="false" name="A_URCB_4">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_5" confRev="1" buffered="false" name="A_URCB_5">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_6" confRev="1" buffered="false" name="A_URCB_6">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_7" confRev="1" buffered="false" name="A_URCB_7">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_8" confRev="1" buffered="false" name="A_URCB_8">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_9" confRev="1" buffered="false" name="A_URCB_9">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_10" confRev="1" buffered="false" name="A_URCB_10">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_11" confRev="1" buffered="false" name="A_URCB_11">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_12" confRev="1" buffered="false" name="A_URCB_12">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_13" confRev="1" buffered="false" name="A_URCB_13">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_14" confRev="1" buffered="false" name="A_URCB_14">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_15" confRev="1" buffered="false" name="A_URCB_15">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_16" confRev="1" buffered="false" name="A_URCB_16">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_17" confRev="1" buffered="false" name="A_URCB_17">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_18" confRev="1" buffered="false" name="A_URCB_18">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_19" confRev="1" buffered="false" name="A_URCB_19">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_20" confRev="1" buffered="false" name="A_URCB_20">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_21" confRev="1" buffered="false" name="A_URCB_21">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_22" confRev="1" buffered="false" name="A_URCB_22">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_23" confRev="1" buffered="false" name="A_URCB_23">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_24" confRev="1" buffered="false" name="A_URCB_24">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_25" confRev="1" buffered="false" name="A_URCB_25">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_26" confRev="1" buffered="false" name="A_URCB_26">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_27" confRev="1" buffered="false" name="A_URCB_27">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_28" confRev="1" buffered="false" name="A_URCB_28">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$RP$A_URCB_29" confRev="1" buffered="false" name="A_URCB_29">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB" confRev="1" buffered="true" name="A_BRCB">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_1" confRev="1" buffered="true" name="A_BRCB_1">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_2" confRev="1" buffered="true" name="A_BRCB_2">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_3" confRev="1" buffered="true" name="A_BRCB_3">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_4" confRev="1" buffered="true" name="A_BRCB_4">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_5" confRev="1" buffered="true" name="A_BRCB_5">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_6" confRev="1" buffered="true" name="A_BRCB_6">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_7" confRev="1" buffered="true" name="A_BRCB_7">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_8" confRev="1" buffered="true" name="A_BRCB_8">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_9" confRev="1" buffered="true" name="A_BRCB_9">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_10" confRev="1" buffered="true" name="A_BRCB_10">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_11" confRev="1" buffered="true" name="A_BRCB_11">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_12" confRev="1" buffered="true" name="A_BRCB_12">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_13" confRev="1" buffered="true" name="A_BRCB_13">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_14" confRev="1" buffered="true" name="A_BRCB_14">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_15" confRev="1" buffered="true" name="A_BRCB_15">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_16" confRev="1" buffered="true" name="A_BRCB_16">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_17" confRev="1" buffered="true" name="A_BRCB_17">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_18" confRev="1" buffered="true" name="A_BRCB_18">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_19" confRev="1" buffered="true" name="A_BRCB_19">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_20" confRev="1" buffered="true" name="A_BRCB_20">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_21" confRev="1" buffered="true" name="A_BRCB_21">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_22" confRev="1" buffered="true" name="A_BRCB_22">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_23" confRev="1" buffered="true" name="A_BRCB_23">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="C01MU1Application/LLN0$BR$A_BRCB_24" confRev="1" buffered="true" name="A_BRCB_24">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<DOI name="Mod" desc="Application mode" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health (61850 only)" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="LEDRs" desc="LED reset" />
						<DOI name="LocKey" desc="Sw.authority key/set">
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="MltLev" desc="Multiple sw.auth. levels">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<SettingControl numOfSGs="1" actSG="1">
							<Private type="Siemens-MasterId">67a9048d-8e33-4f4d-94d5-4d6456ff9818</Private>
						</SettingControl>
					</LN0>
					<LN prefix="" lnClass="LPHD" inst="1" lnType="SIPROTEC5_LNType_LPHD" desc="Device">
						<Private type="Siemens-MasterId">ec56f8da-65c2-48df-9031-5d11182b51de</Private>
						<DOI name="PhyNam" desc="Physical device name">
							<DAI name="vendor">
								<Val>SIEMENS</Val>
							</DAI>
							<DAI name="hwRev">
								<Val>6MU85-????-???-??????-?901?1-13??1A-ABD000-000AC0-CA1BA1</Val>
							</DAI>
							<DAI name="swRev">
								<Val>V09.90</Val>
							</DAI>
							<DAI name="model">
								<Val>6MU85</Val>
							</DAI>
							<DAI name="d">
								<Val>SIEMENS SIPROTEC 5</Val>
							</DAI>
						</DOI>
						<DOI name="PhyHealth" desc="Physical health" />
						<DOI name="Proxy" desc="Proxy" />
						<DOI name="PwrUp" desc="Device startup" />
						<DOI name="Sim" desc="GOOSE/SV sim.mode" />
						<DOI name="OpTmh" desc="Device operating hours">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>h</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="PrcModIna" desc="Process mode inactive" />
					</LN>
					<LN prefix="" lnClass="CALH" inst="0" lnType="SIPROTEC5_LNType_CALH_Application" desc="Alarm handling">
						<Private type="Siemens-MasterId">a5f2f421-e975-4c11-9162-40d6a4c35bd3</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="GrAlm" desc="Group alarm" />
						<DOI name="GrWrn" desc="Group warning" />
						<DOI name="GrInd" desc="Group indication" />
					</LN>
					<LN prefix="" lnClass="LTIM" inst="0" lnType="SIPROTEC5_LNType_LTIM_Application" desc="Time managem.">
						<Private type="Siemens-MasterId">313796c4-7f41-42c1-856c-7c1c1938310a</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="TmDT" desc="Daylight saving time" />
						<DOI name="TmOfsTmm" desc="Time zone offset to UTC">
							<DAI name="setVal">
								<Val>60</Val>
							</DAI>
							<DAI name="minVal">
								<Val>-720</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>840</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>15</Val>
							</DAI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>min</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmUseDT" desc="Switch daylight sav. time">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="TmChgDT" desc="Start of daylight sav. time">
							<SDI name="setCal">
								<DAI name="occ">
									<Val>0</Val>
								</DAI>
								<DAI name="occType">
									<Val>WeekDay</Val>
								</DAI>
								<DAI name="occPer">
									<Val>Year</Val>
								</DAI>
								<DAI name="weekDay">
									<Val>Sunday</Val>
								</DAI>
								<DAI name="month">
									<Val>March</Val>
								</DAI>
								<DAI name="day">
									<Val>0</Val>
								</DAI>
								<DAI name="hr">
									<Val>2</Val>
								</DAI>
								<DAI name="mn">
									<Val>0</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmChgST" desc="End of daylight sav. time">
							<SDI name="setCal">
								<DAI name="occ">
									<Val>0</Val>
								</DAI>
								<DAI name="occType">
									<Val>WeekDay</Val>
								</DAI>
								<DAI name="occPer">
									<Val>Year</Val>
								</DAI>
								<DAI name="weekDay">
									<Val>Sunday</Val>
								</DAI>
								<DAI name="month">
									<Val>October</Val>
								</DAI>
								<DAI name="day">
									<Val>0</Val>
								</DAI>
								<DAI name="hr">
									<Val>3</Val>
								</DAI>
								<DAI name="mn">
									<Val>0</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="LTMS" inst="0" lnType="SIPROTEC5_LNType_LTMS_Application" desc="Time/Samp.syn.">
						<Private type="Siemens-MasterId">8df0599d-1fca-41b3-b596-6a9ac60f13c7</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrc" desc="Current time source" />
						<DOI name="TmSrcTyp" desc="Type of clock source" />
						<DOI name="TmChSt1" desc="Status time source 1" />
						<DOI name="TmChSt2" desc="Status time source 2" />
					</LN>
					<LN prefix="" lnClass="LTRK" inst="0" lnType="SIPROTEC5_LNType_LTRK_Application" desc="Service track.">
						<Private type="Siemens-MasterId">b5dd23ec-63ea-4b92-b0eb-395cd7d00870</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="GenTrk" desc="Common Tracking" />
						<DOI name="SgcbTrk" desc="Settings grps. access" />
						<DOI name="UrcbTrk" desc="UrcbTrk" />
						<DOI name="BrcbTrk" desc="BrcbTrk" />
						<DOI name="SpcTrk" desc="SPC control tracking" />
						<DOI name="DpcTrk" desc="DPC control tracking" />
						<DOI name="IncTrk" desc="INC control tracking" />
						<DOI name="EncTrk1" desc="ENC1 control tracking" />
						<DOI name="EncTrk2" desc="ENC2 control tracking" />
						<DOI name="EncTrk3" desc="ENC3 control tracking" />
						<DOI name="EncTrk4" desc="ENC4 control tracking" />
						<DOI name="ApcFTrk" desc="APC control tracking">
							<SDI name="ctlVal">
								<DAI name="f" />
							</SDI>
						</DOI>
						<DOI name="BscTrk" desc="BSC control tracking" />
						<DOI name="IscTrk" desc="ISC control tracking" />
						<DOI name="BacTrk" desc="BAC control tracking" />
					</LN>
					<LN prefix="RSBO" lnClass="GAPC" inst="0" lnType="SIPROTEC5_LNType_ResetBO" desc="Res. bin. out.">
						<Private type="Siemens-MasterId">21eeaeeb-079e-42ca-925e-91963d159bc3</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="0" lnType="SIPROTEC5_LNType_ResetBO" desc="LED not in FG">
						<Private type="Siemens-MasterId">3e17acc8-43b1-4a07-992f-cfd4fa3fad55</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Binary IO" inst="BinIO">
					<Private type="Siemens-MasterId">965192f6-4b57-4865-90c9-910e91c78ee9</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="BinIO/LLN0/LLN0">
						<Private type="Siemens-MasterId">42f4b0b3-0869-47f5-9969-56be9c0199b5</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="Binary IO_BI" inst="BinIO_BinaryInputs">
					<Private type="Siemens-MasterId">4c5d5998-1f76-4600-9f6f-1e92b8a51258</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="BinIO_BinaryInputs/LLN0/LLN0">
						<Private type="Siemens-MasterId">80fb1f12-2176-4923-96e1-f5d402842beb</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@BinIO</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="Binary IO_BO" inst="BinIO_BinaryOutputs">
					<Private type="Siemens-MasterId">b1ed3acc-b23d-476d-8930-a142ddf70563</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="BinIO_BinaryOutputs/LLN0/LLN0">
						<Private type="Siemens-MasterId">7f58399f-0ae1-4169-854b-44ad70716a12</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@BinIO</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="400kV CB1" inst="CB1">
					<Private type="Siemens-MasterId">d04ee601-6fa3-4cdc-8d40-5f574bda55b8</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="CB1/LLN0/LLN0">
						<Private type="Siemens-MasterId">5784de3c-cb50-4545-aac1-85c13bdadb0d</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">86e59dec-d037-43e6-9a46-926fa1148d49</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_Trip_3pol" desc="Trip logic">
						<Private type="Siemens-MasterId">1eb1871a-a0d7-4d85-9daa-078166068f4f</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="Tr" desc="Trip indication" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="" lnClass="XCBR" inst="1" lnType="SIPROTEC5_LNType_XCBR_3pol_Ctl" desc="Circuit break.">
						<Private type="Siemens-MasterId">0d392fc5-7e70-4728-9eb9-43320bb01437</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="EEHealth" desc="External health" />
						<DOI name="EEName" desc="External name plate" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>100</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SumSwARs" desc="ΣI Brk.">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="pulsQty">
								<Val>0.001</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="GAPC" inst="2" lnType="SIPROTEC5_LNType_GAPC_ManualClose" desc="Manual close">
						<Private type="Siemens-MasterId">06674d91-6062-4309-92fa-0c961638aa50</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block manual close" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetBO" desc="Reset LED Group">
						<Private type="Siemens-MasterId">adcdb547-fc36-4a3f-8b26-9a57a8f8444c</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="TSCB_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_FB_HSBT_BreakerAdaptor" desc="HSBT interface">
						<Private type="Siemens-MasterId">0e416bdc-acce-4015-9282-3cf2bcbe1de3</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_LNType_CSWI" desc="Control">
						<Private type="Siemens-MasterId">0cfc0b4c-4b31-455b-bc0a-a39f2d52a972</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_LNType_CILO" desc="Interlocking">
						<Private type="Siemens-MasterId">abb15451-f1e9-4381-b98c-1f33c8935d62</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
					</LN>
					<LN prefix="CBT_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="CB test">
						<Private type="Siemens-MasterId">0c17336f-9e54-4bc3-9218-1764ffc42a82</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="400kV CB1_FdOMV" inst="CB1_Fundamental">
					<Private type="Siemens-MasterId">25659ee1-bd93-445e-92a9-71f1e3471e64</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="CB1_Fundamental/LLN0/LLN0">
						<Private type="Siemens-MasterId">00eba93d-db7a-4627-b6e6-ad5464e4abaf</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@CB1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">6d0cb215-994a-4b9f-9a07-e84cb87bcbb3</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="J:Onboard Ethernet" inst="Mod1">
					<Private type="Siemens-MasterId">8c2cadc8-867b-4cf9-9371-ac173598dcc6</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Mod1/LLN0/LLN0">
						<Private type="Siemens-MasterId">b4ff24ea-f5e9-4095-b078-45cdc1ee9b8f</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="J:Onboard Ethernet_Chan.1" inst="Mod1_Channel1">
					<Private type="Siemens-MasterId">5f884e2c-55f6-4dd0-ac7b-b530c9202c1b</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Mod1_Channel1/LLN0/LLN0">
						<Private type="Siemens-MasterId">b5a0e3c9-6c24-414e-b1a5-cc7e12345f35</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod1</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="F:ETH-BD-2FO" inst="Mod2">
					<Private type="Siemens-MasterId">64e67610-e43e-442e-a0b3-89d041ce7690</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Mod2/LLN0/LLN0">
						<Private type="Siemens-MasterId">6e09ffad-27b1-45de-bd0d-91e2f2e2b271</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="F:ETH-BD-2FO_Chan.1" inst="Mod2_Channel1">
					<Private type="Siemens-MasterId">6b81fbef-d530-4e2a-b480-9520933448e4</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Mod2_Channel1/LLN0/LLN0">
						<Private type="Siemens-MasterId">f110d257-0972-41a3-84e3-41ced2795d19</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod2</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="Line_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_LineMode" desc="Line Mode">
						<Private type="Siemens-MasterId">30fecff4-f2fb-4e3c-b101-978b7e34f94a</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
						<DOI name="RedChLiv" desc="Redund. Channel Live" />
					</LN>
					<LN prefix="IEC81_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_61850" desc="IEC 61850-8-1">
						<Private type="Siemens-MasterId">9d5983e2-b65f-4f4d-aab5-8866479ff5cc</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:48</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
					<LN prefix="PBMU_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_61850" desc="9-2 Merg.unit">
						<Private type="Siemens-MasterId">2d3d29b1-eca2-469f-b8c0-433fd15d0bee</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
					<LN prefix="PTP_" lnClass="LTPC" inst="1" lnType="SIPROTEC5_LNType_LTPC_IEEE1588HiAcc" desc="IEEE 1588">
						<Private type="Siemens-MasterId">8e4aa0f2-47d1-469c-b13e-4f56bd1e938f</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>(Tr)IEC 61850-90-4:2018A</Val>
							</DAI>
						</DOI>
						<DOI name="ClkAcc" desc="Clock accuracy" />
						<DOI name="ClkClass" desc="Clock class" />
						<DOI name="ClkId" desc="Clock identity" />
						<DOI name="GmClkClass" desc="GM clock class" />
						<DOI name="GmClkId" desc="GM clock identity" />
						<DOI name="GmClkPrio1" desc="GM clock priority 1" />
						<DOI name="GmClkPrio2" desc="GM clock priority 2" />
						<DOI name="GmClkAcc" desc="GM clock accuracy" />
						<DOI name="MePathDlTmns" desc="Mean path delay" />
						<DOI name="NumPorts" desc="Number of ports" />
						<DOI name="OfsMaster" desc="Offset from master">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>n</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="OfsUtc" desc="UtcOffset valid" />
						<DOI name="OfsUtcTms" desc="UtcOffset">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PrntClkId" desc="Master-clock identity" />
						<DOI name="Stepsr" desc="Steps removed" />
						<DOI name="TmSrcVal" desc="Time source" />
						<DOI name="TwoStep" desc="2-step" />
						<DOI name="PrntPortId" desc="Master-port identity" />
						<DOI name="GmClkVar" desc="GmClkVar" />
						<DOI name="ClkVar" desc="Clock variance" />
						<DOI name="ClkPrio1" desc="Clock priority 1">
							<DAI name="setVal">
								<Val>128</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="ClkPrio2" desc="Clock priority 2">
							<DAI name="setVal">
								<Val>128</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="DomainNum" desc="Domain number">
							<DAI name="setVal">
								<Val>0</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="OfsLimTmns" desc="Max. offset from master">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>10000</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>n</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Slave" desc="Slave only">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
						</DOI>
						<DOI name="PrntPortNum" desc="Master-port identity">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PTP_" lnClass="LTTC" inst="1" lnType="SIPROTEC5_LNType_LTTC_IEEE1588HiAcc" desc="IEEE 1588 TC">
						<Private type="Siemens-MasterId">cd2c9693-9d9b-47a7-9f1c-b7caf5e4b994</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>(Tr)IEC 61850-90-4:2018A</Val>
							</DAI>
						</DOI>
						<DOI name="DomainNum" desc="Domain number">
							<DAI name="setVal">
								<Val>0</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PTP_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_61850" desc="IEEE 1588 Chan">
						<Private type="Siemens-MasterId">19c605d4-114b-429e-8401-0c4008390a97</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
				</LDevice>
				<LDevice desc="F:ETH-BD-2FO_MU 1" inst="Mod2_MU1">
					<Private type="Siemens-MasterId">877a7ecc-915d-44ab-a667-03b211226deb</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Mod2_MU1/LLN0/LLN0">
						<Private type="Siemens-MasterId">9169f535-67d7-4d97-ab02-eef4828c57f2</Private>
						<DataSet name="PhsMeas3">
							<Private type="Siemens-GUID">f64f4e1ab49742a084a526281e577bef</Private>
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01A" lnClass="TCTR" lnInst="1" doName="AmpSv" daName="instMag.i" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01A" lnClass="TCTR" lnInst="1" doName="AmpSv" daName="q" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01B" lnClass="TCTR" lnInst="2" doName="AmpSv" daName="instMag.i" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01B" lnClass="TCTR" lnInst="2" doName="AmpSv" daName="q" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01C" lnClass="TCTR" lnInst="3" doName="AmpSv" daName="instMag.i" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01C" lnClass="TCTR" lnInst="3" doName="AmpSv" daName="q" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01N" lnClass="TCTR" lnInst="4" doName="AmpSv" daName="instMag.i" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01N" lnClass="TCTR" lnInst="4" doName="AmpSv" daName="q" fc="MX" />
						</DataSet>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod2</Val>
							</DAI>
						</DOI>
						<SampledValueControl datSet="PhsMeas3" confRev="10001" smvID="E01MU1Mod2MU103" multicast="true" smpRate="4000" nofASDU="1" smpMod="SmpPerSec" name="MSVCB03">
							<Private type="Siemens-DirectionIN">IN = +3I0</Private>
							<IEDName apRef="F">E0187T</IEDName>
							<SmvOpts refreshTime="false" sampleSynchronized="true" sampleRate="false" dataSet="false" security="false" synchSourceId="true" />
						</SampledValueControl>
					</LN0>
					<LN prefix="" lnClass="LPHD" inst="1" lnType="SIPROTEC5_LNType_LPHD_LD_PBMergingUnit" desc="Device MU">
						<Private type="Siemens-MasterId">5f4e26cd-f313-42ef-9751-298901902235</Private>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="PhyNam" desc="Physical device name">
							<DAI name="vendor">
								<Val>SIEMENS</Val>
							</DAI>
							<DAI name="d">
								<Val>SIEMENS SIPROTEC 5 Merging unit</Val>
							</DAI>
						</DOI>
						<DOI name="PhyHealth" desc="Physical health" />
						<DOI name="Proxy" desc="Proxy" />
						<DOI name="NamVariant" desc="NamVariant">
							<DAI name="val">
								<Val>F4000S1I0-24U0-24;F4800S1-2I0-24U0-24;F12800S8I0-16U0-16;F14400S6I0-24U0-24;F15360S8I0-16U0-16;</Val>
							</DAI>
						</DOI>
						<DOI name="NamHzRtg" desc="NamHzRtg">
							<DAI name="val">
								<Val>50;60</Val>
							</DAI>
						</DOI>
						<DOI name="NamHoldRtg" desc="NamHoldRtg">
							<DAI name="val">
								<Val>0-3600</Val>
							</DAI>
						</DOI>
						<DOI name="NamMaxDlRtg" desc="NamMaxDlRtg">
							<DAI name="val">
								<Val>1300-1500</Val>
							</DAI>
						</DOI>
						<DOI name="MaxDl" desc="Max.delay time of samples">
							<DAI name="setVal">
								<Val>1300</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>µ</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="PowS" inst="PowS">
					<Private type="Siemens-MasterId">876390c9-b02b-48b3-9a5a-810199bbe4e7</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PowS/LLN0/LLN0">
						<Private type="Siemens-MasterId">b7dcc075-8cb0-46d2-98a4-6562cc604034</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">c109e49f-69e9-4bd2-a93f-8e401931e05d</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="FrGr_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="FrqTrackGrp">
						<Private type="Siemens-MasterId">5734e5ee-c738-4ca6-b03a-5465828c98ea</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="PowS_Current m3p 400kV" inst="PowS_MeasPointI3ph1">
					<Private type="Siemens-MasterId">21976589-47e7-420d-b7b2-11f3d094ff2e</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="PowS_MeasPointI3ph1/LLN0/LLN0">
						<Private type="Siemens-MasterId">f73b893d-e37b-459d-9c21-a7bdf56c3443</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PowS</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="CT3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="CT 3-phase">
						<Private type="Siemens-MasterId">11702907-00e9-4ffe-9451-8748d9fe652f</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="I01A" lnClass="TCTR" inst="1" lnType="SIPROTEC5_LNType_TCTR" desc="CT 1">
						<Private type="Siemens-MasterId">e3569aa5-4dfa-4f00-bcc0-cdca62a2d931</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="I01B" lnClass="TCTR" inst="2" lnType="SIPROTEC5_LNType_TCTR" desc="CT 2">
						<Private type="Siemens-MasterId">9f45cb65-a4f9-48db-a932-45de21be7fea</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="I01C" lnClass="TCTR" inst="3" lnType="SIPROTEC5_LNType_TCTR" desc="CT 3">
						<Private type="Siemens-MasterId">ab04c250-b9ef-4902-8bce-e3de7d7b733b</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="I01N" lnClass="TCTR" inst="4" lnType="SIPROTEC5_LNType_TCTR" desc="CT 4">
						<Private type="Siemens-MasterId">ce161d29-6f6e-40c2-8ce8-a7cf1214bdae</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Rec" inst="Rec">
					<Private type="Siemens-MasterId">94c18ae7-e926-44da-8791-7380f4916cb7</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Rec/LLN0/LLN0">
						<Private type="Siemens-MasterId">8f8b5a98-6ffe-49a6-9b41-15d2342e2420</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RCDG_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">9ec8e59a-a038-43e5-ade5-bf67d80b4ca8</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="GFLG_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="Grnd.-flt log">
						<Private type="Siemens-MasterId">02a5250f-766e-4901-892a-25ea211bc381</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Rec_FltRec" inst="Rec_FaultRecorder">
					<Private type="Siemens-MasterId">00d1ada3-9a28-47db-9011-dba6f98973e8</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="Rec_FaultRecorder/LLN0/LLN0">
						<Private type="Siemens-MasterId">86edaafb-40af-4e84-83df-3b5fb53f3592</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Rec</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RCDR_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">a4a4895e-9cea-419e-bedd-209f548aa8c3</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="DEF_" lnClass="RDRE" inst="1" lnType="SIPROTEC5_LNType_RDRE_DEF" desc="Control">
						<Private type="Siemens-MasterId">9e1ac761-3f2f-46c7-97c1-66e5c3c2a3c0</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="RcdTrg" desc="Start record" />
						<DOI name="MemRs" desc="Reset memory">
							<DAI name="operTimeout">
								<Val>30000</Val>
							</DAI>
						</DOI>
						<DOI name="MemClr" desc="Clear memory">
							<DAI name="operTimeout">
								<Val>30000</Val>
							</DAI>
						</DOI>
						<DOI name="RcdMade" desc="Record made" />
						<DOI name="FltNum" desc="Fault number" />
						<DOI name="RcdStr" desc="Recording started" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1" inst="VI3p1">
					<Private type="Siemens-MasterId">57e38438-f511-4510-9185-40ebeb120e08</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="VI3p1/LLN0/LLN0">
						<Private type="Siemens-MasterId">207fc7c9-de57-4b71-971b-293f1fa7ca8c</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="VI3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">2854336e-a467-4f07-ae3b-a25531d03c89</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FG_GABCN_Without_DirRouting_Op_1_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">4518e9b5-2544-4218-a636-ea5c4510afea</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetBO" desc="Reset LED Group">
						<Private type="Siemens-MasterId">73b46d7e-8b5e-4d28-903d-d65881a9033b</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_400kV CB Trip" inst="VI3p1_ExternalTrip1">
					<Private type="Siemens-MasterId">885ccbf5-9108-43a5-b93d-0bae04dbd3c0</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="VI3p1_ExternalTrip1/LLN0/LLN0">
						<Private type="Siemens-MasterId">3f4d60c6-c120-4d84-a79c-a1c7f327c6fb</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="EXT_" lnClass="PSCH" inst="1" lnType="SIPROTEC5_LNType_PSCH_ExtTrip" desc="Stage 1">
						<Private type="Siemens-MasterId">caddd121-730c-44e0-ac34-7eb30953d4c3</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block function" />
						<DOI name="RxExtIn1" desc="RxExtIn1">
							<DAI name="dataNs">
								<Val>SIPROTEC5/userdefined</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef desc="RxExtIn1" iedName="E0187T" ldInst="CB1" lnClass="PTRC" lnInst="1" doName="Op" daName="general" intAddr="RxExtIn1;/Ind/stVal" serviceType="GOOSE" srcLDInst="CB1" srcLNClass="LLN0" srcCBName="Control_DataSet" pServT="GOOSE" pDO="Ind" pDA="stVal" />
							<ExtRef desc="RxExtIn1" iedName="E0187T" ldInst="CB1" lnClass="PTRC" lnInst="1" doName="Op" daName="q" intAddr="RxExtIn1;/Ind/q" serviceType="GOOSE" srcLDInst="CB1" srcLNClass="LLN0" srcCBName="Control_DataSet" pServT="GOOSE" pDO="Ind" pDA="q" />
						</Inputs>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_FdSym" inst="VI3p1_FundSymComp">
					<Private type="Siemens-MasterId">a95c0c2a-5dce-4f3b-ab28-0d4a1d9ce127</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="VI3p1_FundSymComp/LLN0/LLN0">
						<Private type="Siemens-MasterId">5b131b80-5abb-4f44-ba37-9c432dcb1f8e</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">282d7a19-12d4-41f7-b55d-aa32f8f532a7</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="FPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">a729c050-e22d-452f-903c-7a2174eb202a</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="XPRE_" lnClass="MSQI" inst="1" lnType="SIPROTEC5_LNType_MSQI_OpMeas_Symm_Pres" desc="Sy.co.">
						<Private type="Siemens-MasterId">3b674d8d-f7a9-4ca0-8168-126671e91b38</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
						</DOI>
						<DOI name="SeqA" desc="Iseq">
							<SDI name="c1" desc="Iseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Iseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Iseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SeqV" desc="Vseq">
							<SDI name="c1" desc="Vseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Vseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Vseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_OMV" inst="VI3p1_OperationalValues">
					<Private type="Siemens-MasterId">0910a4f3-6430-413e-94d2-f31b50164c21</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="VI3p1_OperationalValues/LLN0/LLN0">
						<Private type="Siemens-MasterId">99008dce-4894-4a2a-9b66-635bd75dbaf8</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_RMS_3ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">e2ee252a-3eed-43d0-bdd6-7099e6e96a6c</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="RPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">a59a4560-afc1-4524-ad4d-b009eeb7bc26</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Power_3ph_Pres" desc="Power">
						<Private type="Siemens-MasterId">8ddf9526-b2a2-4c23-aaa7-f89786f97cef</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
						</DOI>
						<DOI name="TotW" desc="P tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>W</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotVAr" desc="Q tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VAr</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotVA" desc="S tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VA</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotPF" desc="cos φ">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>cos(phi)</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="Hz" desc="f">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>100</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>50</Val>
							</DAI>
						</DOI>
						<DOI name="W" desc="P">
							<SDI name="phsA" desc="P:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="P:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="P:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VAr" desc="Q">
							<SDI name="phsA" desc="Q:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Q:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Q:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VA" desc="S">
							<SDI name="phsA" desc="S:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="S:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="S:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_ProMon" inst="VI3p1_ProcessMonitor">
					<Private type="Siemens-MasterId">627e4bdd-b830-46b3-8ac6-077981969874</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_LNType_LLN0_LDevice_Generic" desc="VI3p1_ProcessMonitor/LLN0/LLN0">
						<Private type="Siemens-MasterId">610dab89-cce3-4e87-acf1-c4f1387f4b99</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:47:16</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
			</Server>
		</AccessPoint>
	</IED>
	<IED desc="MU 110kV" name="E01MU1" type="6MU85" manufacturer="SIEMENS" configVersion="V09.90.01" originalSclVersion="2007" originalSclRevision="B" owner="IEC station 1" originalSclRelease="4">
		<Private type="Siemens-MasterId">9460ea54-368a-4830-a82f-dd22c620f9c0</Private>
		<Private type="Siemens-s7ManagerName">MU 110kV</Private>
		<Private type="Siemens-ICD-Language">en-US</Private>
		<Private type="Siemens-Siprotec5-Product-Code">6MU85-????-???-??????-?901?1-13??1A-ABD000-000AC0-CA1BA1</Private>
		<Private type="Siemens-Siprotec5-Application-Template">6MU85_4I</Private>
		<Private type="Siemens-Siprotec5-Communication-Configuration-Version">99001</Private>
		<Private type="Siemens-Siprotec5-Configuration-Version">V09.90.01</Private>
		<Private type="Siemens-IsSiprotec5IED" />
		<Private type="Siemens-IED-Id">9460ea54-368a-4830-a82f-dd22c620f9c0</Private>
		<Private type="Siemens-ModifiedDate">08/07/2026 02:18:58</Private>
		<Private type="Siemens-ModificationCounter">8</Private>
		<Private type="Siemens-NoOfSmvsConfigured">4</Private>
		<Services nameLength="64">
			<ClientServices goose="true" gsse="false" bufReport="false" unbufReport="false" readLog="false" sv="false" supportsLdName="true" maxGOOSE="128" rGOOSE="true" rSV="false" noIctBinding="false">
				<TimeSyncProt sntp="true" c37_238="false" other="false" iec61850_9_3="true" />
			</ClientServices>
			<DynAssociation max="8" />
			<SettingGroups>
				<SGEdit resvTms="true" />
			</SettingGroups>
			<GetDirectory />
			<GetDataObjectDefinition />
			<DataObjectDirectory />
			<GetDataSetValue />
			<DataSetDirectory />
			<ConfDataSet max="50" maxAttributes="200" modify="true" />
			<DynDataSet max="30" maxAttributes="60" />
			<ReadWrite />
			<ConfReportControl max="60" bufMode="both" bufConf="true" />
			<GetCBValues />
			<ReportSettings cbName="Conf" datSet="Dyn" rptID="Dyn" optFields="Dyn" bufTime="Dyn" trgOps="Dyn" intgPd="Dyn" resvTms="true" owner="true" />
			<GSESettings cbName="Conf" datSet="Conf" appID="Conf" dataLabel="Fix" kdaParticipant="false" />
			<ConfLNs fixPrefix="false" fixLnInst="false" />
			<ConfLdName />
			<GOOSE max="16" fixedOffs="false" goose="true" rGOOSE="true" />
			<FileHandling />
			<SupSubscription maxGo="0" maxSv="0" />
			<ValueHandling setToRO="false" />
			<RedProt hsr="true" prp="true" rstp="true" />
			<CommProt ipv6="false" />
			<SMVSettings cbName="Conf" datSet="Fix" svID="Conf" optFields="Fix" smpRate="Fix" samplesPerSec="true" synchSrcId="true" nofASDU="Fix" kdaParticipant="false">
				<SmpRate>80</SmpRate>
				<SmpRate>256</SmpRate>
				<SamplesPerSec>4000</SamplesPerSec>
				<SamplesPerSec>4800</SamplesPerSec>
				<SamplesPerSec>12800</SamplesPerSec>
				<SamplesPerSec>14400</SamplesPerSec>
				<SamplesPerSec>15360</SamplesPerSec>
			</SMVSettings>
			<SMVsc max="1" delivery="multicast" deliveryConf="false" sv="true" rSV="false" />
		</Services>
		<AccessPoint desc="Port F" name="F" router="false" clock="false">
			<Server timeout="0">
				<Authentication none="true" />
				<LDevice desc="Application" inst="Application">
					<Private type="Siemens-MasterId">f5ba8e93-b9f1-4838-970e-d1554ef6cd50</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1000" desc="General">
						<Private type="Siemens-MasterId">ac372fcb-6236-41de-99dd-21784e420801</Private>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB" confRev="1" buffered="false" name="A_URCB">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_1" confRev="1" buffered="false" name="A_URCB_1">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_2" confRev="1" buffered="false" name="A_URCB_2">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_3" confRev="1" buffered="false" name="A_URCB_3">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_4" confRev="1" buffered="false" name="A_URCB_4">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_5" confRev="1" buffered="false" name="A_URCB_5">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_6" confRev="1" buffered="false" name="A_URCB_6">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_7" confRev="1" buffered="false" name="A_URCB_7">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_8" confRev="1" buffered="false" name="A_URCB_8">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_9" confRev="1" buffered="false" name="A_URCB_9">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_10" confRev="1" buffered="false" name="A_URCB_10">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_11" confRev="1" buffered="false" name="A_URCB_11">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_12" confRev="1" buffered="false" name="A_URCB_12">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_13" confRev="1" buffered="false" name="A_URCB_13">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_14" confRev="1" buffered="false" name="A_URCB_14">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_15" confRev="1" buffered="false" name="A_URCB_15">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_16" confRev="1" buffered="false" name="A_URCB_16">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_17" confRev="1" buffered="false" name="A_URCB_17">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_18" confRev="1" buffered="false" name="A_URCB_18">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_19" confRev="1" buffered="false" name="A_URCB_19">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_20" confRev="1" buffered="false" name="A_URCB_20">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_21" confRev="1" buffered="false" name="A_URCB_21">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_22" confRev="1" buffered="false" name="A_URCB_22">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_23" confRev="1" buffered="false" name="A_URCB_23">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_24" confRev="1" buffered="false" name="A_URCB_24">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_25" confRev="1" buffered="false" name="A_URCB_25">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_26" confRev="1" buffered="false" name="A_URCB_26">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_27" confRev="1" buffered="false" name="A_URCB_27">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_28" confRev="1" buffered="false" name="A_URCB_28">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$RP$A_URCB_29" confRev="1" buffered="false" name="A_URCB_29">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB" confRev="1" buffered="true" name="A_BRCB">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_1" confRev="1" buffered="true" name="A_BRCB_1">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_2" confRev="1" buffered="true" name="A_BRCB_2">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_3" confRev="1" buffered="true" name="A_BRCB_3">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_4" confRev="1" buffered="true" name="A_BRCB_4">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_5" confRev="1" buffered="true" name="A_BRCB_5">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_6" confRev="1" buffered="true" name="A_BRCB_6">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_7" confRev="1" buffered="true" name="A_BRCB_7">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_8" confRev="1" buffered="true" name="A_BRCB_8">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_9" confRev="1" buffered="true" name="A_BRCB_9">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_10" confRev="1" buffered="true" name="A_BRCB_10">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_11" confRev="1" buffered="true" name="A_BRCB_11">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_12" confRev="1" buffered="true" name="A_BRCB_12">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_13" confRev="1" buffered="true" name="A_BRCB_13">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_14" confRev="1" buffered="true" name="A_BRCB_14">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_15" confRev="1" buffered="true" name="A_BRCB_15">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_16" confRev="1" buffered="true" name="A_BRCB_16">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_17" confRev="1" buffered="true" name="A_BRCB_17">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_18" confRev="1" buffered="true" name="A_BRCB_18">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_19" confRev="1" buffered="true" name="A_BRCB_19">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_20" confRev="1" buffered="true" name="A_BRCB_20">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_21" confRev="1" buffered="true" name="A_BRCB_21">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_22" confRev="1" buffered="true" name="A_BRCB_22">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_23" confRev="1" buffered="true" name="A_BRCB_23">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<ReportControl rptID="E01MU1Application/LLN0$BR$A_BRCB_24" confRev="1" buffered="true" name="A_BRCB_24">
							<Private type="Siemens-Siprotec5-IsPredefined" />
							<OptFields />
						</ReportControl>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health (61850 only)" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.authority key/set">
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Application mode" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="LEDRs" desc="LED reset" />
						<DOI name="MltLev" desc="Multiple sw.auth. levels">
							<DAI name="setVal">
								<Val>false</Val>
							</DAI>
							<DAI name="dataNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<SettingControl numOfSGs="1" actSG="1">
							<Private type="Siemens-MasterId">1e20acf0-5f26-4045-90eb-6e5f3d0a5847</Private>
						</SettingControl>
					</LN0>
					<LN prefix="" lnClass="LPHD" inst="1" lnType="SIPROTEC5_LNType_LPHD" desc="Device">
						<Private type="Siemens-MasterId">8072ec1e-6d01-4bce-95b9-5feea8ec7313</Private>
						<DOI name="PhyNam" desc="Physical device name">
							<DAI name="vendor">
								<Val>SIEMENS</Val>
							</DAI>
							<DAI name="hwRev">
								<Val>6MU85-????-???-??????-?901?1-13??1A-ABD000-000AC0-CA1BA1</Val>
							</DAI>
							<DAI name="swRev">
								<Val>V09.90</Val>
							</DAI>
							<DAI name="model">
								<Val>6MU85</Val>
							</DAI>
							<DAI name="d">
								<Val>SIEMENS SIPROTEC 5</Val>
							</DAI>
						</DOI>
						<DOI name="PhyHealth" desc="Physical health" />
						<DOI name="Proxy" desc="Proxy" />
						<DOI name="PwrUp" desc="Device startup" />
						<DOI name="Sim" desc="GOOSE/SV sim.mode" />
						<DOI name="OpTmh" desc="Device operating hours">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>h</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="PrcModIna" desc="Process mode inactive" />
					</LN>
					<LN prefix="" lnClass="CALH" inst="0" lnType="SIPROTEC5_LNType_CALH_Application" desc="Alarm handling">
						<Private type="Siemens-MasterId">3400f632-fa7e-46ec-bcda-6a3abbaee462</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="GrAlm" desc="Group alarm" />
						<DOI name="GrWrn" desc="Group warning" />
						<DOI name="GrInd" desc="Group indication" />
					</LN>
					<LN prefix="" lnClass="LTIM" inst="0" lnType="SIPROTEC5_LNType_LTIM_Application" desc="Time managem.">
						<Private type="Siemens-MasterId">7f646fcf-cc9a-4f4c-b5f6-eb12f4cd2b68</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="TmDT" desc="Daylight saving time" />
						<DOI name="TmOfsTmm" desc="Time zone offset to UTC">
							<DAI name="setVal">
								<Val>60</Val>
							</DAI>
							<DAI name="minVal">
								<Val>-720</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>840</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>15</Val>
							</DAI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>min</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmUseDT" desc="Switch daylight sav. time">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="TmChgDT" desc="Start of daylight sav. time">
							<SDI name="setCal">
								<DAI name="occ">
									<Val>0</Val>
								</DAI>
								<DAI name="occType">
									<Val>WeekDay</Val>
								</DAI>
								<DAI name="occPer">
									<Val>Year</Val>
								</DAI>
								<DAI name="weekDay">
									<Val>Sunday</Val>
								</DAI>
								<DAI name="month">
									<Val>March</Val>
								</DAI>
								<DAI name="day">
									<Val>0</Val>
								</DAI>
								<DAI name="hr">
									<Val>2</Val>
								</DAI>
								<DAI name="mn">
									<Val>0</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="TmChgST" desc="End of daylight sav. time">
							<SDI name="setCal">
								<DAI name="occ">
									<Val>0</Val>
								</DAI>
								<DAI name="occType">
									<Val>WeekDay</Val>
								</DAI>
								<DAI name="occPer">
									<Val>Year</Val>
								</DAI>
								<DAI name="weekDay">
									<Val>Sunday</Val>
								</DAI>
								<DAI name="month">
									<Val>October</Val>
								</DAI>
								<DAI name="day">
									<Val>0</Val>
								</DAI>
								<DAI name="hr">
									<Val>3</Val>
								</DAI>
								<DAI name="mn">
									<Val>0</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="LTMS" inst="0" lnType="SIPROTEC5_LNType_LTMS_Application" desc="Time/Samp.syn.">
						<Private type="Siemens-MasterId">a3019a3c-a5a1-4c17-85fc-66c549083021</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="TmSrc" desc="Current time source" />
						<DOI name="TmSrcTyp" desc="Type of clock source" />
						<DOI name="TmChSt1" desc="Status time source 1" />
						<DOI name="TmChSt2" desc="Status time source 2" />
					</LN>
					<LN prefix="" lnClass="LTRK" inst="0" lnType="SIPROTEC5_LNType_LTRK_Application" desc="Service track.">
						<Private type="Siemens-MasterId">68b9cf42-c4a9-4918-a1c9-b4def8ee07b9</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="GenTrk" desc="Common Tracking" />
						<DOI name="SgcbTrk" desc="Settings grps. access" />
						<DOI name="UrcbTrk" desc="UrcbTrk" />
						<DOI name="BrcbTrk" desc="BrcbTrk" />
						<DOI name="SpcTrk" desc="SPC control tracking" />
						<DOI name="DpcTrk" desc="DPC control tracking" />
						<DOI name="IncTrk" desc="INC control tracking" />
						<DOI name="EncTrk1" desc="ENC1 control tracking" />
						<DOI name="EncTrk2" desc="ENC2 control tracking" />
						<DOI name="EncTrk3" desc="ENC3 control tracking" />
						<DOI name="EncTrk4" desc="ENC4 control tracking" />
						<DOI name="ApcFTrk" desc="APC control tracking">
							<SDI name="ctlVal">
								<DAI name="f" />
							</SDI>
						</DOI>
						<DOI name="BscTrk" desc="BSC control tracking" />
						<DOI name="IscTrk" desc="ISC control tracking" />
						<DOI name="BacTrk" desc="BAC control tracking" />
					</LN>
					<LN prefix="RSBO" lnClass="GAPC" inst="0" lnType="SIPROTEC5_LNType_ResetBO" desc="Res. bin. out.">
						<Private type="Siemens-MasterId">66b11021-569c-4563-845b-1900fe8ee2ba</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="0" lnType="SIPROTEC5_LNType_ResetBO" desc="LED not in FG">
						<Private type="Siemens-MasterId">dc65a597-5a33-434d-9f5e-87ed1d265f88</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Binary IO" inst="BinIO">
					<Private type="Siemens-MasterId">e6388d92-ac1b-4e7e-958c-bbf30c1a44c9</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="BinIO/LLN0/LLN0">
						<Private type="Siemens-MasterId">5208ffb5-8051-4a61-b5a2-3737a748c68a</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="Binary IO_BI" inst="BinIO_BinaryInputs">
					<Private type="Siemens-MasterId">fb0a1ac3-0368-4355-97d3-2813bb6644ab</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="BinIO_BinaryInputs/LLN0/LLN0">
						<Private type="Siemens-MasterId">7f276cd3-3aa9-4dfd-87ad-c7f11d907fb0</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@BinIO</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="Binary IO_BO" inst="BinIO_BinaryOutputs">
					<Private type="Siemens-MasterId">323f6bd0-6a79-47e6-9f21-f61d51b19e6c</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="BinIO_BinaryOutputs/LLN0/LLN0">
						<Private type="Siemens-MasterId">06474acd-0d46-416e-86b3-9a5eaf7adae9</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@BinIO</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="110kV CB1" inst="CB1">
					<Private type="Siemens-MasterId">87301fdd-c02c-40b8-8ea8-65a17b0b3769</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="CB1/LLN0/LLN0">
						<Private type="Siemens-MasterId">dcd668ed-f5e8-4598-ab72-ede94d825140</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">6d0bfea6-307c-4c42-96fe-b9491cae0d35</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_Trip_3pol" desc="Trip logic">
						<Private type="Siemens-MasterId">d11c24d4-ea46-4db3-864c-68bf9915270c</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="Tr" desc="Trip indication" />
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="" lnClass="XCBR" inst="1" lnType="SIPROTEC5_LNType_XCBR_3pol_Ctl" desc="Circuit break.">
						<Private type="Siemens-MasterId">eef0b2f0-0cf2-4680-a9ef-cc7105b866c3</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="EEHealth" desc="External health" />
						<DOI name="EEName" desc="External name plate" />
						<DOI name="OpCnt" desc="Op.ct." />
						<DOI name="Pos" desc="Position">
							<SDI name="pulseConfig">
								<DAI name="cmdQual">
									<Val>pulse</Val>
								</DAI>
								<DAI name="onDur">
									<Val>100</Val>
								</DAI>
								<DAI name="offDur">
									<Val>0</Val>
								</DAI>
								<DAI name="numPls">
									<Val>1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="BlkOpn" desc="Block opening" />
						<DOI name="BlkCls" desc="Block closing" />
						<DOI name="SumSwARs" desc="ΣI Brk.">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<DAI name="pulsQty">
								<Val>0.001</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="GAPC" inst="2" lnType="SIPROTEC5_LNType_GAPC_ManualClose" desc="Manual close">
						<Private type="Siemens-MasterId">9e395f48-c4c1-4846-b45e-44b13700fb81</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="Blk" desc="&gt;Block manual close" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetBO" desc="Reset LED Group">
						<Private type="Siemens-MasterId">49f65a3d-8b1e-483f-a626-5fd5073ce3c3</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="TSCB_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_FB_HSBT_BreakerAdaptor" desc="HSBT interface">
						<Private type="Siemens-MasterId">0811209a-09a5-4c44-8518-f654dba14143</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CSWI" inst="1" lnType="SIPROTEC5_LNType_CSWI" desc="Control">
						<Private type="Siemens-MasterId">269d2fb5-7a08-4717-8f72-7a0901427e2a</Private>
						<Private type="Siemens-LN-Dependency" />
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="Loc" desc="Switching auth. local" />
						<DOI name="Pos" desc="Cmd. with feedback">
							<DAI name="ctlModel">
								<Val>sbo-with-enhanced-security</Val>
							</DAI>
							<DAI name="sboTimeout">
								<Val>30000</Val>
							</DAI>
							<DAI name="operTimeout">
								<Val>1000</Val>
							</DAI>
						</DOI>
						<DOI name="LocKey" desc="Sw.author. key switch" />
						<DOI name="LocSta" desc="Switching auth. station">
							<DAI name="ctlModel">
								<Val>status-only</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="CILO" inst="1" lnType="SIPROTEC5_LNType_CILO" desc="Interlocking">
						<Private type="Siemens-MasterId">96d74654-9524-4519-8f7d-5a9d408ae164</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="EnaOpn" desc="&gt;Enable opening" />
						<DOI name="EnaCls" desc="&gt;Enable closing" />
					</LN>
					<LN prefix="CBT_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="CB test">
						<Private type="Siemens-MasterId">6fc30a3b-4250-4d34-84e6-3c6dce2a3231</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="110kV CB1_FdOMV" inst="CB1_Fundamental">
					<Private type="Siemens-MasterId">fb764cdc-c09f-43b4-ac8c-6d0be884547c</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="CB1_Fundamental/LLN0/LLN0">
						<Private type="Siemens-MasterId">da950164-6475-4b82-82c4-fb42ceb94857</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@CB1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">3ea7eec7-e8a6-421f-81d7-6b7086504289</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="J:Onboard Ethernet" inst="Mod1">
					<Private type="Siemens-MasterId">cb04b502-f757-48d6-b355-9bddf75739a2</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="Mod1/LLN0/LLN0">
						<Private type="Siemens-MasterId">220a278b-6394-4e73-8b52-e36b071a1d55</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="J:Onboard Ethernet_Chan.1" inst="Mod1_Channel1">
					<Private type="Siemens-MasterId">aac8aa30-f6eb-479b-982b-2d7cb5f0e9dd</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="Mod1_Channel1/LLN0/LLN0">
						<Private type="Siemens-MasterId">4216b74f-e9f6-450c-b173-2253978da33e</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod1</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="F:ETH-BD-2FO" inst="Mod2">
					<Private type="Siemens-MasterId">88ec7128-8964-4b1e-b4b5-526b11719b05</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="Mod2/LLN0/LLN0">
						<Private type="Siemens-MasterId">48174d90-73eb-4781-8d37-9bf7a2a05ef3</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
				<LDevice desc="F:ETH-BD-2FO_Chan.1" inst="Mod2_Channel1">
					<Private type="Siemens-MasterId">3c01f725-1ebc-4369-ab21-13d72243a491</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="Mod2_Channel1/LLN0/LLN0">
						<Private type="Siemens-MasterId">54047824-ddad-47a1-b9fe-ba278b401a17</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod2</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="Line_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_LineMode" desc="Line Mode">
						<Private type="Siemens-MasterId">f11213a5-603a-441f-9d15-63705064ff82</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
						<DOI name="RedChLiv" desc="Redund. Channel Live" />
					</LN>
					<LN prefix="IEC81_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_61850" desc="IEC 61850-8-1">
						<Private type="Siemens-MasterId">1f8482d2-7d8c-499a-8f5d-952c679bea41</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:48</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
					<LN prefix="PBMU_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_61850" desc="9-2 Merg.unit">
						<Private type="Siemens-MasterId">c1afcebf-7eea-4e8f-a69d-48ccc0a6353a</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
					<LN prefix="PTP_" lnClass="LTPC" inst="1" lnType="SIPROTEC5_LNType_LTPC_IEEE1588HiAcc" desc="IEEE 1588">
						<Private type="Siemens-MasterId">9c4168aa-134f-4b69-8bde-5b12186f2444</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>(Tr)IEC 61850-90-4:2018A</Val>
							</DAI>
						</DOI>
						<DOI name="ClkAcc" desc="Clock accuracy" />
						<DOI name="ClkClass" desc="Clock class" />
						<DOI name="ClkId" desc="Clock identity" />
						<DOI name="GmClkClass" desc="GM clock class" />
						<DOI name="GmClkId" desc="GM clock identity" />
						<DOI name="GmClkPrio1" desc="GM clock priority 1" />
						<DOI name="GmClkPrio2" desc="GM clock priority 2" />
						<DOI name="GmClkAcc" desc="GM clock accuracy" />
						<DOI name="MePathDlTmns" desc="Mean path delay" />
						<DOI name="NumPorts" desc="Number of ports" />
						<DOI name="OfsMaster" desc="Offset from master">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>n</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="OfsUtc" desc="UtcOffset valid" />
						<DOI name="OfsUtcTms" desc="UtcOffset">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PrntClkId" desc="Master-clock identity" />
						<DOI name="Stepsr" desc="Steps removed" />
						<DOI name="TmSrcVal" desc="Time source" />
						<DOI name="TwoStep" desc="2-step" />
						<DOI name="PrntPortId" desc="Master-port identity" />
						<DOI name="GmClkVar" desc="GmClkVar" />
						<DOI name="ClkVar" desc="Clock variance" />
						<DOI name="ClkPrio1" desc="Clock priority 1">
							<DAI name="setVal">
								<Val>255</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="ClkPrio2" desc="Clock priority 2">
							<DAI name="setVal">
								<Val>255</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="DomainNum" desc="Domain number">
							<DAI name="setVal">
								<Val>0</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="OfsLimTmns" desc="Max. offset from master">
							<DAI name="setVal">
								<Val>1000</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>10000</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>n</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Slave" desc="Slave only">
							<DAI name="setVal">
								<Val>true</Val>
							</DAI>
						</DOI>
						<DOI name="PrntPortNum" desc="Master-port identity">
							<DAI name="setVal">
								<Val>0</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PTP_" lnClass="LTTC" inst="1" lnType="SIPROTEC5_LNType_LTTC_IEEE1588HiAcc" desc="IEEE 1588 TC">
						<Private type="Siemens-MasterId">fc162698-86d3-4fea-bfcf-0fc44f19832a</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>(Tr)IEC 61850-90-4:2018A</Val>
							</DAI>
						</DOI>
						<DOI name="DomainNum" desc="Domain number">
							<DAI name="setVal">
								<Val>0</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>255</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PTP_" lnClass="LCCH" inst="1" lnType="SIPROTEC5_LNType_LCCH_61850" desc="IEEE 1588 Chan">
						<Private type="Siemens-MasterId">9fcfec39-b95a-4e59-ba67-088896996dc9</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
						</DOI>
						<DOI name="ChLiv" desc="Channel Live" />
					</LN>
				</LDevice>
				<LDevice desc="F:ETH-BD-2FO_MU 1" inst="Mod2_MU1">
					<Private type="Siemens-MasterId">f92f200b-c727-4b77-b67d-a48f68ffb29e</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="Mod2_MU1/LLN0/LLN0">
						<Private type="Siemens-MasterId">8600fb66-97b8-4d97-8f96-fd99e597f184</Private>
						<DataSet name="PhsMeas3">
							<Private type="Siemens-GUID">8223c0d3c7e14f20b23f9edd6b84610a</Private>
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01A" lnClass="TCTR" lnInst="1" doName="AmpSv" daName="instMag.i" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01A" lnClass="TCTR" lnInst="1" doName="AmpSv" daName="q" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01B" lnClass="TCTR" lnInst="2" doName="AmpSv" daName="instMag.i" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01B" lnClass="TCTR" lnInst="2" doName="AmpSv" daName="q" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01C" lnClass="TCTR" lnInst="3" doName="AmpSv" daName="instMag.i" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01C" lnClass="TCTR" lnInst="3" doName="AmpSv" daName="q" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01N" lnClass="TCTR" lnInst="4" doName="AmpSv" daName="instMag.i" fc="MX" />
							<FCDA ldInst="PowS_MeasPointI3ph1" prefix="I01N" lnClass="TCTR" lnInst="4" doName="AmpSv" daName="q" fc="MX" />
						</DataSet>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Mod2</Val>
							</DAI>
						</DOI>
						<SampledValueControl datSet="PhsMeas3" confRev="10001" smvID="SIPMod2MU103" multicast="true" smpRate="4000" nofASDU="1" smpMod="SmpPerSec" name="MSVCB03">
							<Private type="Siemens-DirectionIN">IN = +3I0</Private>
							<IEDName apRef="F">E0187T</IEDName>
							<IEDName apRef="F">E0187T</IEDName>
							<SmvOpts refreshTime="false" sampleSynchronized="true" sampleRate="false" dataSet="false" security="false" synchSourceId="true" />
						</SampledValueControl>
					</LN0>
					<LN prefix="" lnClass="LPHD" inst="1" lnType="SIPROTEC5_LNType_LPHD_LD_PBMergingUnit" desc="Device MU">
						<Private type="Siemens-MasterId">5673cf88-1191-485b-bdf1-0aaff98cd50f</Private>
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="PhyNam" desc="Physical device name">
							<DAI name="vendor">
								<Val>SIEMENS</Val>
							</DAI>
							<DAI name="d">
								<Val>SIEMENS SIPROTEC 5 Merging unit</Val>
							</DAI>
						</DOI>
						<DOI name="PhyHealth" desc="Physical health" />
						<DOI name="Proxy" desc="Proxy" />
						<DOI name="NamVariant" desc="NamVariant">
							<DAI name="val">
								<Val>F4000S1I0-24U0-24;F4800S1-2I0-24U0-24;F12800S8I0-16U0-16;F14400S6I0-24U0-24;F15360S8I0-16U0-16;</Val>
							</DAI>
						</DOI>
						<DOI name="NamHzRtg" desc="NamHzRtg">
							<DAI name="val">
								<Val>50;60</Val>
							</DAI>
						</DOI>
						<DOI name="NamHoldRtg" desc="NamHoldRtg">
							<DAI name="val">
								<Val>0-3600</Val>
							</DAI>
						</DOI>
						<DOI name="NamMaxDlRtg" desc="NamMaxDlRtg">
							<DAI name="val">
								<Val>1300-1500</Val>
							</DAI>
						</DOI>
						<DOI name="MaxDl" desc="Max.delay time of samples">
							<DAI name="setVal">
								<Val>1300</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
							<DAI name="stepSize">
								<Val>1</Val>
							</DAI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>s</Val>
								</DAI>
								<DAI name="multiplier">
									<Val>µ</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="PowS" inst="PowS">
					<Private type="Siemens-MasterId">6f78f85b-a969-455b-b6a9-76a3f1ed315a</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="PowS/LLN0/LLN0">
						<Private type="Siemens-MasterId">a5d143b5-3583-47f8-aec4-051766b29fc1</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">dbc92e93-1f8e-4312-bb83-28e136996564</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="FrGr_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="FrqTrackGrp">
						<Private type="Siemens-MasterId">2cf16f0a-1e75-426b-84f7-7b32464aceee</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="PowS_Current m3p 400kV" inst="PowS_MeasPointI3ph1">
					<Private type="Siemens-MasterId">bef04c19-dfa5-43a6-8e9b-14ac89e33776</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="PowS_MeasPointI3ph1/LLN0/LLN0">
						<Private type="Siemens-MasterId">2b759a78-aafd-45a3-a600-6b3605d95413</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@PowS</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="CT3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="CT 3-phase">
						<Private type="Siemens-MasterId">431b4521-4b12-4959-b2b1-6b346d84a1b0</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="I01A" lnClass="TCTR" inst="1" lnType="SIPROTEC5_LNType_TCTR" desc="CT 1">
						<Private type="Siemens-MasterId">1f7c7a0c-f581-426e-91ce-5ff2b8c8cb6c</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="I01B" lnClass="TCTR" inst="2" lnType="SIPROTEC5_LNType_TCTR" desc="CT 2">
						<Private type="Siemens-MasterId">81fe76cd-d990-42e0-91ee-3156f7791227</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="I01C" lnClass="TCTR" inst="3" lnType="SIPROTEC5_LNType_TCTR" desc="CT 3">
						<Private type="Siemens-MasterId">0fd66e10-c239-44f7-90df-5d0b8d8a4c07</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="I01N" lnClass="TCTR" inst="4" lnType="SIPROTEC5_LNType_TCTR" desc="CT 4">
						<Private type="Siemens-MasterId">0ceab135-674a-483c-9e51-912731c0e9d8</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="lnNs">
								<Val>IEC 61869-9:2016A</Val>
							</DAI>
						</DOI>
						<DOI name="ARtg" desc="Rated primary current">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Rat" desc="Rat">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.1</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="HzRtg" desc="Rated frequency">
							<SDI name="setMag">
								<DAI name="f">
									<Val>50</Val>
								</DAI>
							</SDI>
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>16.67</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>60</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Cor" desc="Magnitude correction">
							<SDI name="setMag">
								<DAI name="f">
									<Val>1</Val>
								</DAI>
							</SDI>
							<SDI name="minVal">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>10</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>1E-05</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AmpSv" desc="Sampled val. current">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>A</Val>
								</DAI>
							</SDI>
							<SDI name="sVC">
								<DAI name="scaleFactor">
									<Val>0.001</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="Trp" desc="Transient perform. class">
							<DAI name="setVal">
								<Val>TPM</Val>
							</DAI>
						</DOI>
						<DOI name="ScndTmms" desc="Second. loop time const.">
							<DAI name="setVal">
								<Val>210</Val>
							</DAI>
							<DAI name="minVal">
								<Val>1</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>2147483647</Val>
							</DAI>
						</DOI>
						<DOI name="Clip" desc="Ratio of clipping limit">
							<SDI name="setMag">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="maxVal">
								<DAI name="f">
									<Val>100</Val>
								</DAI>
							</SDI>
							<SDI name="stepSize">
								<DAI name="f">
									<Val>0.01</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="AccMeas" desc="Meas. accuracy class">
							<DAI name="setVal">
								<Val>0.2S</Val>
							</DAI>
						</DOI>
						<DOI name="AccPro" desc="Prot. accuracy class">
							<DAI name="setVal">
								<Val>1</Val>
							</DAI>
						</DOI>
						<DOI name="HoldTmms" desc="Holdover time">
							<DAI name="setVal">
								<Val>5000</Val>
							</DAI>
							<DAI name="minVal">
								<Val>500</Val>
							</DAI>
							<DAI name="maxVal">
								<Val>90000</Val>
							</DAI>
						</DOI>
						<DOI name="NamAccRtg" desc="NamAccRtg">
							<DAI name="val">
								<Val>0,5S/5P20</Val>
							</DAI>
						</DOI>
						<DOI name="NamARtg" desc="NamARtg">
							<DAI name="val">
								<Val>200;400;800</Val>
							</DAI>
						</DOI>
						<DOI name="NamClipRtg" desc="NamClipRtg">
							<DAI name="val">
								<Val>20</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Rec" inst="Rec">
					<Private type="Siemens-MasterId">04c3d0c0-f289-4110-a35f-a32f362017a6</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="Rec/LLN0/LLN0">
						<Private type="Siemens-MasterId">4817ad95-9217-4930-ba35-5d496f010834</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RCDG_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">5d1b4786-8ee0-4a98-8b0c-7c6fe70a8c00</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="GFLG_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="Grnd.-flt log">
						<Private type="Siemens-MasterId">a4929773-3c88-48e5-9aec-0f1e88994de3</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="Rec_FltRec" inst="Rec_FaultRecorder">
					<Private type="Siemens-MasterId">046b38a2-9ce2-4f0f-9f64-3628b8fe7515</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="Rec_FaultRecorder/LLN0/LLN0">
						<Private type="Siemens-MasterId">1d878e36-b520-436a-9b1d-03fcf95dae0d</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Rec</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RCDR_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">fe164dd7-ccb4-442c-b279-6b1b30b31c47</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="DEF_" lnClass="RDRE" inst="1" lnType="SIPROTEC5_LNType_RDRE_DEF" desc="Control">
						<Private type="Siemens-MasterId">53cc9436-d4d0-4cd7-b2bc-ae1faabede41</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 05:51:39</Val>
							</DAI>
						</DOI>
						<DOI name="RcdTrg" desc="Start record" />
						<DOI name="MemRs" desc="Reset memory">
							<DAI name="operTimeout">
								<Val>30000</Val>
							</DAI>
						</DOI>
						<DOI name="MemClr" desc="Clear memory">
							<DAI name="operTimeout">
								<Val>30000</Val>
							</DAI>
						</DOI>
						<DOI name="RcdMade" desc="Record made" />
						<DOI name="FltNum" desc="Fault number" />
						<DOI name="RcdStr" desc="Recording started" />
					</LN>
				</LDevice>
				<LDevice desc="VI3p1" inst="VI3p1">
					<Private type="Siemens-MasterId">3de6bab6-20ab-4519-b916-7331de488705</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="VI3p1/LLN0/LLN0">
						<Private type="Siemens-MasterId">268ff9d6-19d2-423e-920b-d03fca2e360f</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@Application</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="VI3P_" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" desc="General">
						<Private type="Siemens-MasterId">616bc9e5-9ae2-4357-8a36-a1807e664412</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="" lnClass="PTRC" inst="1" lnType="SIPROTEC5_LNType_PTRC_FG_GABCN_Without_DirRouting_Op_1_3pol" desc="Group indicat.">
						<Private type="Siemens-MasterId">b2c67356-eb3a-4dac-8461-223c60a55b5c</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Str" desc="Pickup" />
					</LN>
					<LN prefix="RSLED" lnClass="GAPC" inst="1" lnType="SIPROTEC5_LNType_ResetBO" desc="Reset LED Group">
						<Private type="Siemens-MasterId">d50cd670-719e-449d-933c-f50b07a75c43</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_110kV CB Trip" inst="VI3p1_ExternalTrip1">
					<Private type="Siemens-MasterId">b500bf73-6f61-4f48-9bbe-83874b071f6a</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="VI3p1_ExternalTrip1/LLN0/LLN0">
						<Private type="Siemens-MasterId">2a6ff97e-adbd-46fd-84ac-a9e14755914d</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="EXT_" lnClass="PSCH" inst="1" lnType="SIPROTEC5_LNType_PSCH_ExtTrip" desc="Stage 1">
						<Private type="Siemens-MasterId">b6dc40d3-1471-41d3-ab2e-404b01a770e2</Private>
						<DOI name="Mod" desc="Mode (controllable)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
						</DOI>
						<DOI name="Op" desc="Operate" />
						<DOI name="Blk" desc="&gt;Block function" />
						<DOI name="RxExtIn1" desc="RxExtIn1">
							<DAI name="dataNs">
								<Val>SIPROTEC5/userdefined</Val>
							</DAI>
						</DOI>
						<Inputs>
							<ExtRef desc="RxExtIn1" iedName="E0187T" ldInst="CB2" lnClass="PTRC" lnInst="1" doName="Op" daName="general" intAddr="RxExtIn1;/Ind/stVal" serviceType="GOOSE" srcLDInst="CB2" srcLNClass="LLN0" srcCBName="Control_DataSet" pServT="GOOSE" pDO="Ind" pDA="stVal" />
							<ExtRef desc="RxExtIn1" iedName="E0187T" ldInst="CB2" lnClass="PTRC" lnInst="1" doName="Op" daName="q" intAddr="RxExtIn1;/Ind/q" serviceType="GOOSE" srcLDInst="CB2" srcLNClass="LLN0" srcCBName="Control_DataSet" pServT="GOOSE" pDO="Ind" pDA="q" />
						</Inputs>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_FdSym" inst="VI3p1_FundSymComp">
					<Private type="Siemens-MasterId">dd79e161-76ed-4865-a1c4-57bad01ae58c</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="VI3p1_FundSymComp/LLN0/LLN0">
						<Private type="Siemens-MasterId">39e6c9ad-186b-473d-abc2-509006daf66a</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="FPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">c3e4650a-9a0f-4b71-b3a9-8bc95063d555</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="FPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" desc="Fundam">
						<Private type="Siemens-MasterId">f8fe5170-88cf-46c1-8160-a3f8daa39fd8</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="XPRE_" lnClass="MSQI" inst="1" lnType="SIPROTEC5_LNType_MSQI_OpMeas_Symm_Pres" desc="Sy.co.">
						<Private type="Siemens-MasterId">efbcb495-ded5-4a6a-afd2-d94faa38115c</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
						</DOI>
						<DOI name="SeqA" desc="Iseq">
							<SDI name="c1" desc="Iseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Iseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Iseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="SeqV" desc="Vseq">
							<SDI name="c1" desc="Vseq:1">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="c2" desc="Vseq:2">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="c3" desc="Vseq:0">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_OMV" inst="VI3p1_OperationalValues">
					<Private type="Siemens-MasterId">8e09f4f9-51a7-49d3-ba78-dc803c6025ea</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="VI3p1_OperationalValues/LLN0/LLN0">
						<Private type="Siemens-MasterId">5551ede0-df09-4676-81b0-0de7a0ec2c0a</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
					<LN prefix="RPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_RMS_3ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">825b03d2-8eda-4da6-9c1b-3d2d76e22fc0</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
						</DOI>
						<DOI name="PPV" desc="Vpp">
							<SDI name="phsAB" desc="Vpp:AB">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsBC" desc="Vpp:BC">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsCA" desc="Vpp:CA">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="PhV" desc="Vph">
							<SDI name="phsA" desc="Vph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Vph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Vph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>2000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Vph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>V</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>20000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="A" desc="Iph">
							<SDI name="phsA" desc="Iph:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Iph:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Iph:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
							<SDI name="res" desc="Iph:res">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>A</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>100000</Val>
								</DAI>
								<DAI name="dbRef">
									<Val>1000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
					<LN prefix="RPRE_" lnClass="MMXN" inst="1" lnType="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" desc="RMS">
						<Private type="Siemens-MasterId">f536ae72-1b29-45a2-b980-bd1b367013f3</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
						</DOI>
					</LN>
					<LN prefix="PPRE_" lnClass="MMXU" inst="1" lnType="SIPROTEC5_LNType_MMXU_OpMeas_Power_3ph_Pres" desc="Power">
						<Private type="Siemens-MasterId">215e3c22-fefe-495b-9eba-ae7ac2b558ad</Private>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
						</DOI>
						<DOI name="TotW" desc="P tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>W</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotVAr" desc="Q tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VAr</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotVA" desc="S tot">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>VA</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="TotPF" desc="cos φ">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>cos(phi)</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>10000</Val>
							</DAI>
						</DOI>
						<DOI name="Hz" desc="f">
							<SDI name="units">
								<DAI name="SIUnit">
									<Val>Hz</Val>
								</DAI>
							</SDI>
							<DAI name="db">
								<Val>100</Val>
							</DAI>
							<DAI name="dbRef">
								<Val>50</Val>
							</DAI>
						</DOI>
						<DOI name="W" desc="P">
							<SDI name="phsA" desc="P:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="P:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="P:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>W</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VAr" desc="Q">
							<SDI name="phsA" desc="Q:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="Q:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="Q:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VAr</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
						<DOI name="VA" desc="S">
							<SDI name="phsA" desc="S:A">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsB" desc="S:B">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
							<SDI name="phsC" desc="S:C">
								<SDI name="units">
									<DAI name="SIUnit">
										<Val>VA</Val>
									</DAI>
								</SDI>
								<DAI name="db">
									<Val>10000</Val>
								</DAI>
							</SDI>
						</DOI>
					</LN>
				</LDevice>
				<LDevice desc="VI3p1_ProMon" inst="VI3p1_ProcessMonitor">
					<Private type="Siemens-MasterId">a5611fd6-4b79-4016-b7a0-8fd64de460fd</Private>
					<LN0 lnClass="LLN0" inst="" lnType="SIPROTEC5_1001" desc="VI3p1_ProcessMonitor/LLN0/LLN0">
						<Private type="Siemens-MasterId">c64aad35-6fbc-49ed-8478-691d683d5cf8</Private>
						<DOI name="Beh" desc="Behavior" />
						<DOI name="Health" desc="Health" />
						<DOI name="NamPlt" desc="Name plate">
							<DAI name="configRev">
								<Val>2026-08-06 06:38:58</Val>
							</DAI>
							<DAI name="ldNs">
								<Val>IEC 61850-7-4:2007B</Val>
							</DAI>
						</DOI>
						<DOI name="Mod" desc="Mode (status only)" />
						<DOI name="GrRef" desc="GrRef">
							<DAI name="setSrcRef">
								<Val>@VI3p1</Val>
							</DAI>
						</DOI>
					</LN0>
				</LDevice>
			</Server>
		</AccessPoint>
	</IED>
	<DataTypeTemplates>
		<LNodeType id="SIPROTEC5_LNType_LLN0_Application" lnClass="LLN0">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_OnBlockedTestTestBlocked_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_LLN0_V09.90.01_V09.90.01" />
			<DO name="LEDRs" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_V09.90.01_V09.90.01" />
			<DO name="LocKey" type="SIPROTEC5_DOType_SPS_with_dataNs_V09.90.01_V09.90.01" />
			<DO name="LocSta" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_FnKey_toggle_on_off_with_InitVal_and_dataNs_V09.90.01_V09.90.01" />
			<DO name="MltLev" type="SIPROTEC5_DOType_SPG_readOnly_with_dataNs_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LPHD" lnClass="LPHD">
			<DO name="PhyNam" type="SIPROTEC5_DOType_DPL_V09.90.01_V09.90.01" />
			<DO name="PhyHealth" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="Proxy" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="PwrUp" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="Sim" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_V09.90.01_V09.90.01" />
			<DO name="OpTmh" type="SIPROTEC5_DOType_INS_INT32_with_units_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="PrcModIna" type="SIPROTEC5_DOType_SPS_UDEF_with_dataNs_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_CALH_Application" lnClass="CALH">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="GrAlm" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="GrWrn" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="GrInd" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LTIM_Application" lnClass="LTIM">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="TmDT" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="TmOfsTmm" type="SIPROTEC5_DOType_ING_INT32_edit_V09.90.01_V09.90.01" />
			<DO name="TmUseDT" type="SIPROTEC5_DOType_SPG_edit_V09.90.01_V09.90.01" />
			<DO name="TmChgDT" type="SIPROTEC5_DOType_TSG_V09.90.01_V09.90.01" />
			<DO name="TmChgST" type="SIPROTEC5_DOType_TSG_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LTMS_Application" lnClass="LTMS">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="TmSrc" type="SIPROTEC5_DOType_VSS_V09.90.01_V09.90.01" />
			<DO name="TmSrcTyp" type="SIPROTEC5_DOType_ENS_TmSrcTyp_V09.90.01_V09.90.01" />
			<DO name="TmChSt1" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="TmChSt2" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LTRK_Application" lnClass="LTRK">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="GenTrk" type="SIPROTEC5_DOType_CST_V09.90.01_V09.90.01" />
			<DO name="SgcbTrk" type="SIPROTEC5_DOType_STS_V09.90.01_V09.90.01" />
			<DO name="UrcbTrk" type="SIPROTEC5_DOType_UTS_V09.90.01_V09.90.01" />
			<DO name="BrcbTrk" type="SIPROTEC5_DOType_BTS_V09.90.01_V09.90.01" />
			<DO name="SpcTrk" type="SIPROTEC5_DOType_CTS_BOOLEAN_V09.90.01_V09.90.01" />
			<DO name="DpcTrk" type="SIPROTEC5_DOType_CTS_BOOLEAN_V09.90.01_V09.90.01" />
			<DO name="IncTrk" type="SIPROTEC5_DOType_CTS_INT32_V09.90.01_V09.90.01" />
			<DO name="EncTrk1" type="SIPROTEC5_DOType_CTS_ENUM_Behavior_V09.90.01_V09.90.01" />
			<DO name="EncTrk2" type="SIPROTEC5_DOType_CTS_ENUM_Behavior_OnBlockedTestTestBlocked_V09.90.01_V09.90.01" />
			<DO name="EncTrk3" type="SIPROTEC5_DOType_CTS_ENUM_Behavior_OnOff_V09.90.01_V09.90.01" />
			<DO name="EncTrk4" type="SIPROTEC5_DOType_CTS_ENUM_RedMod_V09.90.01_V09.90.01" />
			<DO name="ApcFTrk" type="SIPROTEC5_DOType_CTS_Analog_V09.90.01_V09.90.01" />
			<DO name="BscTrk" type="SIPROTEC5_DOType_CTS_TCMD_V09.90.01_V09.90.01" />
			<DO name="IscTrk" type="SIPROTEC5_DOType_CTS_INT8_V09.90.01_V09.90.01" />
			<DO name="BacTrk" type="SIPROTEC5_DOType_CTS_TCMD_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_ResetBO" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LLN0_LDevice_Generic" lnClass="LLN0">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_LLN0_V09.90.01_V09.90.01" />
			<DO name="GrRef" type="SIPROTEC5_DOType_ORG_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_GAPC_FB0_FGBreaker_3pol" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTRC_Trip_3pol" lnClass="PTRC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V09.90.01_V09.90.01" />
			<DO name="Tr" type="SIPROTEC5_DOType_ACT_3pol_V09.90.01_V09.90.01" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V09.90.01_V09.90.01" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABCN_Without_DirRouting_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_XCBR_3pol_Ctl" lnClass="XCBR">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="Loc" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="EEHealth" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="EEName" type="SIPROTEC5_DOType_DPL_ENamPlt_V09.90.01_V09.90.01" />
			<DO name="OpCnt" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="Pos" type="SIPROTEC5_DOType_DPC_XCBR_Pos_V09.90.01_V09.90.01" />
			<DO name="BlkOpn" type="SIPROTEC5_DOType_SPC_status_only_V09.90.01_V09.90.01" />
			<DO name="BlkCls" type="SIPROTEC5_DOType_SPC_status_only_V09.90.01_V09.90.01" />
			<DO name="SumSwARs" type="SIPROTEC5_DOType_BCR_noFreeze_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_GAPC_ManualClose" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_FB_HSBT_BreakerAdaptor" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_CSWI" lnClass="CSWI">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="Loc" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="Pos" type="SIPROTEC5_DOType_DPC_CSWI_Pos_V09.90.01_V09.90.01" />
			<DO name="LocKey" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="LocSta" type="SIPROTEC5_DOType_SPC_statusOnly_and_dir_with_nor_sec_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_CILO" lnClass="CILO">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V09.90.01_V09.90.01" />
			<DO name="EnaOpn" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="EnaCls" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_MMXU_OpMeas_Fund_3ph_Pres" lnClass="MMXU">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="PPV" type="SIPROTEC5_DOType_DEL_V09.90.01_V09.90.01" />
			<DO name="PhV" type="SIPROTEC5_DOType_WYE_ABCRes_V09.90.01_V09.90.01" />
			<DO name="A" type="SIPROTEC5_DOType_WYE_ABCRes_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_CALH_LSVS" lnClass="CALH">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="GrAlm" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="GrInd" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LSVS" lnClass="LSVS">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_OnOff_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="St" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="SimSt" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="ConfRevNum" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="SvCBRef" type="SIPROTEC5_DOType_ORG_external_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LCCH_LineMode" lnClass="LCCH">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="ChLiv" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="RedChLiv" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LCCH_61850" lnClass="LCCH">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="ChLiv" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LTPC_IEEE1588HiAcc" lnClass="LTPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="ClkAcc" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="ClkClass" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="ClkId" type="SIPROTEC5_DOType_VSS_V09.90.01_V09.90.01" />
			<DO name="GmClkClass" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="GmClkId" type="SIPROTEC5_DOType_VSS_V09.90.01_V09.90.01" />
			<DO name="GmClkPrio1" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="GmClkPrio2" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="GmClkAcc" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="MePathDlTmns" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="NumPorts" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="OfsMaster" type="SIPROTEC5_DOType_INS_INT32_with_units_V09.90.01_V09.90.01" />
			<DO name="OfsUtc" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="OfsUtcTms" type="SIPROTEC5_DOType_INS_INT32_with_units_V09.90.01_V09.90.01" />
			<DO name="PrntClkId" type="SIPROTEC5_DOType_VSS_V09.90.01_V09.90.01" />
			<DO name="Stepsr" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="TmSrcVal" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="TwoStep" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="PrntPortId" type="SIPROTEC5_DOType_VSS_V09.90.01_V09.90.01" />
			<DO name="GmClkVar" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="ClkVar" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="ClkPrio1" type="SIPROTEC5_DOType_ING_INT32_edit_V09.90.01_V09.90.01" />
			<DO name="ClkPrio2" type="SIPROTEC5_DOType_ING_INT32_edit_V09.90.01_V09.90.01" />
			<DO name="DomainNum" type="SIPROTEC5_DOType_ING_INT32_edit_V09.90.01_V09.90.01" />
			<DO name="OfsLimTmns" type="SIPROTEC5_DOType_ING_INT32_readOnly_V09.90.01_V09.91.01" />
			<DO name="Slave" type="SIPROTEC5_DOType_SPG_edit_V09.90.01_V09.90.01" />
			<DO name="PrntPortNum" type="SIPROTEC5_DOType_ING_INT32_edit_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LTTC_IEEE1588HiAcc" lnClass="LTTC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="DomainNum" type="SIPROTEC5_DOType_ING_INT32_edit_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTRC_FG_GABC_Without_DirRouting_Op_1_3pol" lnClass="PTRC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V09.90.01_V09.90.01" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_1_3pol_GABC_simpleConversions_V09.90.01_V09.90.01" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABC_Without_DirRouting_and_PhaseRouting_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_TDIFF_Restrained" lnClass="PDIF">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABC_Without_DirRouting_and_PhaseRouting_V09.90.01_V09.90.01" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_1_3pol_GABC_simpleConversions_V09.90.01_V09.90.01" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_YPTR_FB0_FGTransformerSide" lnClass="YPTR">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTRC_FG_GABCN_Without_DirRouting_Op_1_3pol" lnClass="PTRC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V09.90.01_V09.90.01" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_1_3pol_GABC_simpleConversions_V09.90.01_V09.90.01" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABCN_Without_DirRouting_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTRC_FN_Str_GABC_Without_DirRouting_Op_3pol" lnClass="PTRC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V09.90.01_V09.90.01" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V09.90.01_V09.90.01" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABC_Without_DirRouting_and_PhaseRouting_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTUV" lnClass="PTUV">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABC_Without_DirRouting_and_PhaseRouting_V09.90.01_V09.90.01" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V09.90.01_V09.90.01" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTOC_3ph_DOCP_3pol" lnClass="PTOC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABC_Without_DirRouting_and_PhaseRouting_V09.90.01_V09.90.01" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_1_3pol_GABC_simpleConversions_V09.90.01_V09.90.01" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTOV" lnClass="PTOV">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABC_Without_DirRouting_and_PhaseRouting_V09.90.01_V09.90.01" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V09.90.01_V09.90.01" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTRC" lnClass="PTRC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V09.90.01_V09.90.01" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V09.90.01_V09.90.01" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_NonPhsSel_Without_DirRouting_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTOF" lnClass="PTOF">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_NonPhsSel_Without_DirRouting_V09.90.01_V09.90.01" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V09.90.01_V09.90.01" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PTUF" lnClass="PTUF">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_NonPhsSel_Without_DirRouting_V09.90.01_V09.90.01" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V09.90.01_V09.90.01" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_MMXN_OpMeas_Fund_1ph_Pres" lnClass="MMXN">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_MSQI_OpMeas_Symm_Pres" lnClass="MSQI">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="SeqA" type="SIPROTEC5_DOType_SEQ_V09.90.01_V09.90.01" />
			<DO name="SeqV" type="SIPROTEC5_DOType_SEQ_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_MMXU_OpMeas_RMS_3ph_Pres" lnClass="MMXU">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="PPV" type="SIPROTEC5_DOType_DEL_mag_V09.90.01_V09.90.01" />
			<DO name="PhV" type="SIPROTEC5_DOType_WYE_ABCRes_mag_V09.90.01_V09.90.01" />
			<DO name="A" type="SIPROTEC5_DOType_WYE_ABCRes_mag_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_MMXU_OpMeas_Power_3ph_Pres" lnClass="MMXU">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="TotW" type="SIPROTEC5_DOType_MV_Float_V09.90.01_V09.90.01" />
			<DO name="TotVAr" type="SIPROTEC5_DOType_MV_Float_V09.90.01_V09.90.01" />
			<DO name="TotVA" type="SIPROTEC5_DOType_MV_Float_V09.90.01_V09.90.01" />
			<DO name="TotPF" type="SIPROTEC5_DOType_MV_Float_V09.90.01_V09.90.01" />
			<DO name="Hz" type="SIPROTEC5_DOType_MV_Float_V09.90.01_V09.90.01" />
			<DO name="W" type="SIPROTEC5_DOType_WYE_ABC_mag_V09.90.01_V09.90.01" />
			<DO name="VAr" type="SIPROTEC5_DOType_WYE_ABC_mag_V09.90.01_V09.90.01" />
			<DO name="VA" type="SIPROTEC5_DOType_WYE_ABC_mag_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PHAR" lnClass="PHAR">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="Str" type="SIPROTEC5_DOType_ACD_PhsSel_GABCN_Without_DirRouting_V09.90.01_V09.90.01" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_TCTR" lnClass="TCTR">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="ARtg" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V09.90.01_V09.90.01" />
			<DO name="Rat" type="SIPROTEC5_DOType_ASG_FLOAT32_readOnly_V09.90.01_V09.90.01" />
			<DO name="HzRtg" type="SIPROTEC5_DOType_ASG_FLOAT32_readOnly_V09.90.01_V09.90.01" />
			<DO name="Cor" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V09.90.01_V09.90.01" />
			<DO name="AmpSv" type="SIPROTEC5_DOType_SAV_VDEWChannelNumber_V09.90.01_V09.90.01" />
			<DO name="Trp" type="SIPROTEC5_DOType_ENG_TextList_Trp_edit_V09.90.01_V09.90.01" />
			<DO name="ScndTmms" type="SIPROTEC5_DOType_ING_INT32_div_readOnly_V09.90.01_V09.90.01" />
			<DO name="Clip" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V09.90.01_V09.90.01" />
			<DO name="AccMeas" type="SIPROTEC5_DOType_ENG_TextList_AccMeas_edit_V09.90.01_V09.90.01" />
			<DO name="AccPro" type="SIPROTEC5_DOType_ENG_TextList_AccPro_edit_V09.90.01_V09.90.01" />
			<DO name="HoldTmms" type="SIPROTEC5_DOType_ING_INT32_div_readOnly_V09.90.01_V09.90.01" />
			<DO name="NamAccRtg" type="SIPROTEC5_DOType_VSD_readOnly_V09.90.01_V09.90.01" />
			<DO name="NamARtg" type="SIPROTEC5_DOType_VSD_readOnly_V09.90.01_V09.90.01" />
			<DO name="NamClipRtg" type="SIPROTEC5_DOType_VSD_readOnly_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_TVTR" lnClass="TVTR">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="VolSv" type="SIPROTEC5_DOType_SAV_VDEWChannelNumber_V09.90.01_V09.90.01" />
			<DO name="VRtg" type="SIPROTEC5_DOType_ASG_FLOAT32_readOnly_V09.90.01_V09.90.01" />
			<DO name="HzRtg" type="SIPROTEC5_DOType_ASG_FLOAT32_readOnly_V09.90.01_V09.90.01" />
			<DO name="Rat" type="SIPROTEC5_DOType_ASG_FLOAT32_readOnly_V09.90.01_V09.90.01" />
			<DO name="Cor" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V09.90.01_V09.90.01" />
			<DO name="Clip" type="SIPROTEC5_DOType_ASG_FLOAT32_edit_V09.90.01_V09.90.01" />
			<DO name="AccMeas" type="SIPROTEC5_DOType_ENG_TextList_AccMeas_edit_V09.90.01_V09.90.01" />
			<DO name="AccPro" type="SIPROTEC5_DOType_ENG_TextList_AccPro_edit_V09.90.01_V09.90.01" />
			<DO name="HoldTmms" type="SIPROTEC5_DOType_ING_INT32_div_readOnly_V09.90.01_V09.90.01" />
			<DO name="NamAccRtg" type="SIPROTEC5_DOType_VSD_readOnly_V09.90.01_V09.90.01" />
			<DO name="NamVRtg" type="SIPROTEC5_DOType_VSD_readOnly_V09.90.01_V09.90.01" />
			<DO name="NamClipRtg" type="SIPROTEC5_DOType_VSD_readOnly_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_RDRE_DEF" lnClass="RDRE">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_V09.90.01_V09.90.01" />
			<DO name="RcdTrg" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_V09.90.01_V09.90.01" />
			<DO name="MemRs" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_FnKey_on_V09.90.01_V09.90.01" />
			<DO name="MemClr" type="SIPROTEC5_DOType_SPC_dir_with_enh_sec_FnKey_on_V09.90.01_V09.90.01" />
			<DO name="RcdMade" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="FltNum" type="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" />
			<DO name="RcdStr" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_FB0BehHealthForFG" lnClass="GAPC">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="SPS" type="SIPROTEC5_DOType_SPS_UDEF_with_dataNs_V09.90.01_V09.90.01" />
			<DO name="SPS1" type="SIPROTEC5_DOType_SPS_UDEF_with_dataNs_V09.90.01_V09.90.01" />
			<DO name="SPS2" type="SIPROTEC5_DOType_SPS_UDEF_with_dataNs_V09.90.01_V09.90.01" />
			<DO name="SPS3" type="SIPROTEC5_DOType_SPS_UDEF_with_dataNs_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_LPHD_LD_PBMergingUnit" lnClass="LPHD">
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="PhyNam" type="SIPROTEC5_DOType_DPL_V09.90.01_V09.90.01" />
			<DO name="PhyHealth" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="Proxy" type="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" />
			<DO name="NamVariant" type="SIPROTEC5_DOType_VSD_readOnly_V09.90.01_V09.90.01" />
			<DO name="NamHzRtg" type="SIPROTEC5_DOType_VSD_readOnly_V09.90.01_V09.90.01" />
			<DO name="NamHoldRtg" type="SIPROTEC5_DOType_VSD_readOnly_V09.90.01_V09.90.01" />
			<DO name="NamMaxDlRtg" type="SIPROTEC5_DOType_VSD_readOnly_V09.90.01_V09.90.01" />
			<DO name="MaxDl" type="SIPROTEC5_DOType_ING_INT32_edit_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_LNType_PSCH_ExtTrip" lnClass="PSCH">
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" />
			<DO name="Op" type="SIPROTEC5_DOType_ACT_3pol_V09.90.01_V09.90.01" />
			<DO name="Blk" type="SIPROTEC5_DOType_SPS_for_Input_V09.90.01_V09.90.01" />
			<DO name="RxExtIn1" type="SIPROTEC5_DOType_SPS_with_dataNs_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1000" lnClass="LLN0">
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_LLN0_V09.90.01_V09.90.01" />
			<DO name="LocKey" type="SIPROTEC5_DOType_SPS_with_dataNs_V09.90.01_V09.90.01" />
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_controllable_OnBlockedTestTestBlocked_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="LocSta" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_FnKey_toggle_on_off_with_InitVal_and_dataNs_V09.90.01_V09.90.01" />
			<DO name="LEDRs" type="SIPROTEC5_DOType_SPC_dir_with_nor_sec_V09.90.01_V09.90.01" />
			<DO name="MltLev" type="SIPROTEC5_DOType_SPG_readOnly_with_dataNs_V09.90.01_V09.90.01" />
		</LNodeType>
		<LNodeType id="SIPROTEC5_1001" lnClass="LLN0">
			<DO name="Beh" type="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" />
			<DO name="Health" type="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" />
			<DO name="NamPlt" type="SIPROTEC5_DOType_LPL_NamPlt_for_LLN0_V09.90.01_V09.90.01" />
			<DO name="Mod" type="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" />
			<DO name="GrRef" type="SIPROTEC5_DOType_ORG_V09.90.01_V09.90.01" />
		</LNodeType>
		<DOType id="SIPROTEC5_DOType_SPG_readOnly_with_dataNs_V09.90.01_V09.90.01" cdc="SPG">
			<DA fc="SE" name="setVal" bType="BOOLEAN" valKind="RO" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPC_dir_with_nor_sec_FnKey_toggle_on_off_with_InitVal_and_dataNs_V09.90.01_V09.90.01" cdc="SPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="OR" name="opRcvd" bType="BOOLEAN" />
			<DA dchg="true" fc="OR" name="opOk" bType="BOOLEAN" />
			<DA fc="OR" name="tOpOk" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_dir_with_nor_sec_V09.90.01_V09.90.01">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPS_with_dataNs_V09.90.01_V09.90.01" cdc="SPS">
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPC_dir_with_nor_sec_V09.90.01_V09.90.01" cdc="SPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="OR" name="opRcvd" bType="BOOLEAN" />
			<DA dchg="true" fc="OR" name="opOk" bType="BOOLEAN" />
			<DA fc="OR" name="tOpOk" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_dir_with_nor_sec_V09.90.01_V09.90.01">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_LPL_NamPlt_for_LLN0_V09.90.01_V09.90.01" cdc="LPL">
			<DA fc="DC" name="vendor" bType="VisString255" valKind="RO">
				<Val>SIEMENS</Val>
			</DA>
			<DA fc="DC" name="swRev" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="d" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="configRev" bType="VisString255" valKind="RO" />
			<DA fc="EX" name="ldNs" bType="VisString255" valKind="RO" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_Health_V09.90.01_V09.90.01" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_Health_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_Behavior_V09.90.01_V09.90.01" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_Mod_controllable_OnBlockedTestTestBlocked_with_InitVal_V09.90.01_V09.90.01" cdc="ENC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_OnBlockedTestTestBlocked_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_dir_with_nor_sec_V09.90.01_V09.90.01">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Mod_OnBlockedTestTestBlocked_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPS_UDEF_with_dataNs_V09.90.01_V09.90.01" cdc="SPS">
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="SV" name="subEna" bType="BOOLEAN" />
			<DA fc="SV" name="subVal" bType="BOOLEAN" />
			<DA fc="SV" name="subQ" bType="Quality" />
			<DA fc="SV" name="subID" bType="VisString64" />
			<DA fc="BL" name="blkEna" bType="BOOLEAN" />
			<DA fc="EX" name="dataNs" bType="VisString255" valKind="RO">
				<Val>SIPROTEC5/userdefined</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_LPL_NamPlt_for_Ed2_LN_V09.90.01_V09.90.01" cdc="LPL">
			<DA fc="DC" name="vendor" bType="VisString255" valKind="RO">
				<Val>SIEMENS</Val>
			</DA>
			<DA fc="DC" name="swRev" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="d" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="configRev" bType="VisString255" valKind="RO" />
			<DA fc="EX" name="lnNs" bType="VisString255" valKind="RO">
				<Val>IEC 61850-7-4:2007B</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_INS_INT32_with_units_V09.90.01_V09.90.01" cdc="INS">
			<DA dchg="true" fc="ST" name="stVal" bType="INT32" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPS_V09.90.01_V09.90.01" cdc="SPS">
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_DPL_V09.90.01_V09.90.01" cdc="DPL">
			<DA fc="DC" name="vendor" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="hwRev" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="swRev" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="serNum" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="model" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="location" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="owner" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="d" bType="VisString255" valKind="RO" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_Mod_status_only_with_InitVal_V09.90.01_V09.90.01" cdc="ENC">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_V09.90.01_V09.90.01">
				<Val>on</Val>
			</DA>
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_status_only_V09.90.01_V09.90.01">
				<Val>status-only</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_TSG_V09.90.01_V09.90.01" cdc="TSG">
			<DA fc="SE" name="setCal" bType="Struct" type="SIPROTEC5_DAType_CalendarTime_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPG_edit_V09.90.01_V09.90.01" cdc="SPG">
			<DA fc="SE" name="setVal" bType="BOOLEAN" valKind="Set" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ING_INT32_edit_V09.90.01_V09.90.01" cdc="ING">
			<DA fc="SE" name="setVal" bType="INT32" valKind="Set" />
			<DA dchg="true" fc="CF" name="minVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="maxVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="stepSize" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENS_TmSrcTyp_V09.90.01_V09.90.01" cdc="ENS">
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_TmSrcTyp_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_VSS_V09.90.01_V09.90.01" cdc="VSS">
			<DA dchg="true" fc="ST" name="stVal" bType="VisString255" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CTS_TCMD_V09.90.01_V09.90.01" cdc="CTS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="ctlVal" bType="Tcmd" />
			<DA fc="SR" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="SR" name="ctlNum" bType="INT8U" />
			<DA fc="SR" name="T" bType="Timestamp" />
			<DA fc="SR" name="Test" bType="BOOLEAN" />
			<DA fc="SR" name="Check" bType="Check" />
			<DA fc="SR" name="respAddCause" bType="Enum" type="SIPROTEC5_Textlist_AddCause_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CTS_INT8_V09.90.01_V09.90.01" cdc="CTS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="ctlVal" bType="INT8" />
			<DA fc="SR" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="SR" name="ctlNum" bType="INT8U" />
			<DA fc="SR" name="T" bType="Timestamp" />
			<DA fc="SR" name="Test" bType="BOOLEAN" />
			<DA fc="SR" name="Check" bType="Check" />
			<DA fc="SR" name="respAddCause" bType="Enum" type="SIPROTEC5_Textlist_AddCause_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CTS_Analog_V09.90.01_V09.90.01" cdc="CTS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="ctlVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V09.90.01_V09.90.01" />
			<DA fc="SR" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="SR" name="ctlNum" bType="INT8U" />
			<DA fc="SR" name="T" bType="Timestamp" />
			<DA fc="SR" name="Test" bType="BOOLEAN" />
			<DA fc="SR" name="Check" bType="Check" />
			<DA fc="SR" name="respAddCause" bType="Enum" type="SIPROTEC5_Textlist_AddCause_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CTS_ENUM_RedMod_V09.90.01_V09.90.01" cdc="CTS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="ctlVal" bType="Enum" type="SIPROTEC5_Textlist_RedMode_V09.90.01_V09.90.01" />
			<DA fc="SR" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="SR" name="ctlNum" bType="INT8U" />
			<DA fc="SR" name="T" bType="Timestamp" />
			<DA fc="SR" name="Test" bType="BOOLEAN" />
			<DA fc="SR" name="Check" bType="Check" />
			<DA fc="SR" name="respAddCause" bType="Enum" type="SIPROTEC5_Textlist_AddCause_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CTS_ENUM_Behavior_OnOff_V09.90.01_V09.90.01" cdc="CTS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="ctlVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_OnOff_V09.90.01_V09.90.01" />
			<DA fc="SR" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="SR" name="ctlNum" bType="INT8U" />
			<DA fc="SR" name="T" bType="Timestamp" />
			<DA fc="SR" name="Test" bType="BOOLEAN" />
			<DA fc="SR" name="Check" bType="Check" />
			<DA fc="SR" name="respAddCause" bType="Enum" type="SIPROTEC5_Textlist_AddCause_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CTS_ENUM_Behavior_OnBlockedTestTestBlocked_V09.90.01_V09.90.01" cdc="CTS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="ctlVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_OnBlockedTestTestBlocked_V09.90.01_V09.90.01" />
			<DA fc="SR" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="SR" name="ctlNum" bType="INT8U" />
			<DA fc="SR" name="T" bType="Timestamp" />
			<DA fc="SR" name="Test" bType="BOOLEAN" />
			<DA fc="SR" name="Check" bType="Check" />
			<DA fc="SR" name="respAddCause" bType="Enum" type="SIPROTEC5_Textlist_AddCause_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CTS_ENUM_Behavior_V09.90.01_V09.90.01" cdc="CTS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="ctlVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_V09.90.01_V09.90.01" />
			<DA fc="SR" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="SR" name="ctlNum" bType="INT8U" />
			<DA fc="SR" name="T" bType="Timestamp" />
			<DA fc="SR" name="Test" bType="BOOLEAN" />
			<DA fc="SR" name="Check" bType="Check" />
			<DA fc="SR" name="respAddCause" bType="Enum" type="SIPROTEC5_Textlist_AddCause_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CTS_INT32_V09.90.01_V09.90.01" cdc="CTS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="ctlVal" bType="INT32" />
			<DA fc="SR" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="SR" name="ctlNum" bType="INT8U" />
			<DA fc="SR" name="T" bType="Timestamp" />
			<DA fc="SR" name="Test" bType="BOOLEAN" />
			<DA fc="SR" name="Check" bType="Check" />
			<DA fc="SR" name="respAddCause" bType="Enum" type="SIPROTEC5_Textlist_AddCause_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CTS_BOOLEAN_V09.90.01_V09.90.01" cdc="CTS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="ctlVal" bType="BOOLEAN" />
			<DA fc="SR" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="SR" name="ctlNum" bType="INT8U" />
			<DA fc="SR" name="T" bType="Timestamp" />
			<DA fc="SR" name="Test" bType="BOOLEAN" />
			<DA fc="SR" name="Check" bType="Check" />
			<DA fc="SR" name="respAddCause" bType="Enum" type="SIPROTEC5_Textlist_AddCause_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_BTS_V09.90.01_V09.90.01" cdc="BTS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="rptID" bType="VisString129" />
			<DA fc="SR" name="rptEna" bType="BOOLEAN" />
			<DA fc="SR" name="datSet" bType="ObjRef" />
			<DA fc="SR" name="confRev" bType="INT32U" />
			<DA fc="SR" name="optFlds" bType="OptFlds" />
			<DA fc="SR" name="bufTm" bType="INT32U" />
			<DA fc="SR" name="sqNum" bType="INT16U" />
			<DA fc="SR" name="trgOps" bType="TrgOps" />
			<DA fc="SR" name="intgPd" bType="INT32U" />
			<DA fc="SR" name="gi" bType="BOOLEAN" />
			<DA fc="SR" name="purgeBuf" bType="BOOLEAN" />
			<DA fc="SR" name="entryID" bType="EntryID" />
			<DA fc="SR" name="timeOfEntry" bType="EntryTime" />
			<DA fc="SR" name="resvTms" bType="INT16" />
			<DA fc="SR" name="owner" bType="Octet64" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_UTS_V09.90.01_V09.90.01" cdc="UTS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="rptID" bType="VisString129" />
			<DA fc="SR" name="rptEna" bType="BOOLEAN" />
			<DA fc="SR" name="resv" bType="BOOLEAN" />
			<DA fc="SR" name="datSet" bType="ObjRef" />
			<DA fc="SR" name="confRev" bType="INT32U" />
			<DA fc="SR" name="optFlds" bType="OptFlds" />
			<DA fc="SR" name="bufTm" bType="INT32U" />
			<DA fc="SR" name="sqNum" bType="INT8U" />
			<DA fc="SR" name="trgOps" bType="TrgOps" />
			<DA fc="SR" name="intgPd" bType="INT32U" />
			<DA fc="SR" name="gi" bType="BOOLEAN" />
			<DA fc="SR" name="owner" bType="Octet64" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_STS_V09.90.01_V09.90.01" cdc="STS">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
			<DA fc="SR" name="numOfSG" bType="INT8U" />
			<DA fc="SR" name="actSG" bType="INT8U" />
			<DA fc="SR" name="editSG" bType="INT8U" />
			<DA fc="SR" name="cnfEdit" bType="BOOLEAN" />
			<DA fc="SR" name="lActTm" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CST_V09.90.01_V09.90.01" cdc="CST">
			<DA dupd="true" fc="SR" name="objRef" bType="ObjRef" />
			<DA fc="SR" name="serviceType" bType="Enum" type="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01" />
			<DA fc="SR" name="errorCode" bType="Enum" type="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01" />
			<DA fc="SR" name="originatorID" bType="Octet64" />
			<DA fc="SR" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_Mod_controllable_with_InitVal_V09.90.01_V09.90.01" cdc="ENC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_status_only_and_dir_with_nor_sec_V09.90.01_V09.90.01">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Mod_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ORG_V09.90.01_V09.90.01" cdc="ORG">
			<DA dchg="true" fc="SP" name="setSrcRef" bType="ObjRef" valKind="RO" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ACD_PhsSel_GABCN_Without_DirRouting_V09.90.01_V09.90.01" cdc="ACD">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirGeneral" bType="Enum" type="SIPROTEC5_Textlist_DirectionGeneral_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="ST" name="phsA" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirPhsA" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="ST" name="phsB" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirPhsB" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="ST" name="phsC" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirPhsC" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="ST" name="neut" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirNeut" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ACT_3pol_V09.90.01_V09.90.01" cdc="ACT">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_LPL_NamPlt_V09.90.01_V09.90.01" cdc="LPL">
			<DA fc="DC" name="vendor" bType="VisString255" valKind="RO">
				<Val>SIEMENS</Val>
			</DA>
			<DA fc="DC" name="swRev" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="d" bType="VisString255" valKind="RO" />
			<DA fc="DC" name="configRev" bType="VisString255" valKind="RO" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_BCR_noFreeze_V09.90.01_V09.90.01" cdc="BCR">
			<DA dchg="true" fc="ST" name="actVal" bType="INT64" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="pulsQty" bType="FLOAT32" valKind="RO">
				<Val>1</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPC_status_only_V09.90.01_V09.90.01" cdc="SPC">
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="OR" name="opRcvd" bType="BOOLEAN" />
			<DA dchg="true" fc="OR" name="opOk" bType="BOOLEAN" />
			<DA fc="OR" name="tOpOk" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_status_only_V09.90.01_V09.90.01">
				<Val>status-only</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_DPC_XCBR_Pos_V09.90.01_V09.90.01" cdc="DPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="Dbpos" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="ST" name="stSeld" bType="BOOLEAN" />
			<DA dchg="true" fc="OR" name="opRcvd" bType="BOOLEAN" />
			<DA dchg="true" fc="OR" name="opOk" bType="BOOLEAN" />
			<DA fc="OR" name="tOpOk" bType="Timestamp" />
			<DA fc="SV" name="subEna" bType="BOOLEAN" />
			<DA fc="SV" name="subVal" bType="Dbpos" />
			<DA fc="SV" name="subQ" bType="Quality" />
			<DA fc="SV" name="subID" bType="VisString64" />
			<DA fc="BL" name="blkEna" bType="BOOLEAN" />
			<DA dchg="true" fc="CF" name="pulseConfig" bType="Struct" type="SIPROTEC5_DAType_PulseConfig_XCBR_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_status_only_V09.90.01_V09.90.01">
				<Val>status-only</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_INS_INT32_V09.90.01_V09.90.01" cdc="INS">
			<DA dchg="true" fc="ST" name="stVal" bType="INT32" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_DPL_ENamPlt_V09.90.01_V09.90.01" cdc="DPL">
			<DA fc="DC" name="vendor" bType="VisString255" valKind="RO" valImport="true" />
			<DA fc="DC" name="hwRev" bType="VisString255" valKind="RO" valImport="true" />
			<DA fc="DC" name="swRev" bType="VisString255" valKind="RO" valImport="true" />
			<DA fc="DC" name="serNum" bType="VisString255" valKind="RO" valImport="true" />
			<DA fc="DC" name="model" bType="VisString255" valKind="RO" valImport="true" />
			<DA fc="DC" name="location" bType="VisString255" valKind="RO" valImport="true" />
			<DA fc="DC" name="name" bType="VisString64" valKind="RO" valImport="true" />
			<DA fc="DC" name="owner" bType="VisString255" valKind="RO" valImport="true" />
			<DA fc="DC" name="ePSName" bType="VisString255" valKind="RO" valImport="true" />
			<DA fc="DC" name="primeOper" bType="VisString255" valKind="RO" valImport="true" />
			<DA fc="DC" name="secondOper" bType="VisString255" valKind="RO" valImport="true" />
			<DA fc="DC" name="latitude" bType="FLOAT32" valKind="RO" valImport="true" />
			<DA fc="DC" name="longitude" bType="FLOAT32" valKind="RO" valImport="true" />
			<DA fc="DC" name="altitude" bType="FLOAT32" valKind="RO" valImport="true" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPS_for_Input_V09.90.01_V09.90.01" cdc="SPS">
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA fc="SV" name="subEna" bType="BOOLEAN" />
			<DA fc="SV" name="subVal" bType="BOOLEAN" />
			<DA fc="SV" name="subQ" bType="Quality" />
			<DA fc="SV" name="subID" bType="VisString64" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPC_statusOnly_and_dir_with_nor_sec_V09.90.01_V09.90.01" cdc="SPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="OR" name="opRcvd" bType="BOOLEAN" />
			<DA dchg="true" fc="OR" name="opOk" bType="BOOLEAN" />
			<DA fc="OR" name="tOpOk" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_status_only_and_dir_with_nor_sec_V09.90.01_V09.90.01">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_DPC_CSWI_Pos_V09.90.01_V09.90.01" cdc="DPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="Dbpos" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="ST" name="stSeld" bType="BOOLEAN" />
			<DA dchg="true" fc="OR" name="opRcvd" bType="BOOLEAN" />
			<DA dchg="true" fc="OR" name="opOk" bType="BOOLEAN" />
			<DA fc="OR" name="tOpOk" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_V09.90.01_V09.90.01">
				<Val>status-only</Val>
			</DA>
			<DA dchg="true" fc="CF" name="sboTimeout" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="operTimeout" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA fc="CO" name="SBO" bType="VisString129">
				<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
			</DA>
			<DA fc="CO" name="SBOw" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V09.90.01_V09.90.01" />
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V09.90.01_V09.90.01" />
			<DA fc="CO" name="Cancel" bType="Struct" type="SIPROTEC5_DAType_Cancel_Boolean_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_WYE_ABCRes_V09.90.01_V09.90.01" cdc="WYE">
			<SDO name="phsA" type="SIPROTEC5_DOType_CMV_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="phsB" type="SIPROTEC5_DOType_CMV_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="phsC" type="SIPROTEC5_DOType_CMV_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="res" type="SIPROTEC5_DOType_CMV_without_convertions_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CMV_without_convertions_V09.90.01_V09.90.01" cdc="CMV">
			<DA fc="MX" name="instCVal" bType="Struct" type="SIPROTEC5_DAType_Vector_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="MX" name="cVal" bType="Struct" type="SIPROTEC5_DAType_Vector_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="MX" name="q" bType="Quality" />
			<DA fc="MX" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="db" bType="INT32U" valKind="Set">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbAng" bType="INT32U" valKind="Set">
				<Val>333</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbRef" bType="FLOAT32" valKind="Set">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbAngRef" bType="FLOAT32" valKind="Set">
				<Val>360</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_DEL_V09.90.01_V09.90.01" cdc="DEL">
			<SDO name="phsAB" type="SIPROTEC5_DOType_CMV_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="phsBC" type="SIPROTEC5_DOType_CMV_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="phsCA" type="SIPROTEC5_DOType_CMV_without_convertions_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ORG_external_V09.90.01_V09.90.01" cdc="ORG">
			<DA dchg="true" fc="SP" name="setSrcRef" bType="ObjRef" valKind="RO" valImport="true" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_Mod_controllable_OnOff_with_InitVal_V09.90.01_V09.90.01" cdc="ENC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_OnOff_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_status_only_and_dir_with_nor_sec_V09.90.01_V09.90.01">
				<Val>direct-with-normal-security</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Mod_OnOff_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ING_INT32_readOnly_V09.90.01_V09.91.01" cdc="ING">
			<DA fc="SE" name="setVal" bType="INT32" valKind="RO" />
			<DA dchg="true" fc="CF" name="minVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="maxVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="stepSize" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ACD_PhsSel_GABC_Without_DirRouting_and_PhaseRouting_V09.90.01_V09.90.01" cdc="ACD">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirGeneral" bType="Enum" type="SIPROTEC5_Textlist_DirectionGeneral_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="ST" name="phsA" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirPhsA" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="ST" name="phsB" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirPhsB" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="ST" name="phsC" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirPhsC" bType="Enum" type="SIPROTEC5_Textlist_DirectionPhase_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ACT_1_3pol_GABC_simpleConversions_V09.90.01_V09.90.01" cdc="ACT">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="phsA" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="phsB" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="phsC" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ACD_NonPhsSel_Without_DirRouting_V09.90.01_V09.90.01" cdc="ACD">
			<DA dchg="true" fc="ST" name="general" bType="BOOLEAN" />
			<DA dchg="true" fc="ST" name="dirGeneral" bType="Enum" type="SIPROTEC5_Textlist_DirectionGeneral_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SEQ_V09.90.01_V09.90.01" cdc="SEQ">
			<SDO name="c1" type="SIPROTEC5_DOType_CMV_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="c2" type="SIPROTEC5_DOType_CMV_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="c3" type="SIPROTEC5_DOType_CMV_without_convertions_V09.90.01_V09.90.01" />
			<DA fc="MX" name="seqT" bType="Enum" type="SIPROTEC5_Textlist_SEQtype_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_WYE_ABCRes_mag_V09.90.01_V09.90.01" cdc="WYE">
			<SDO name="phsA" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="phsB" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="phsC" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="res" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_CMV_mag_without_convertions_V09.90.01_V09.90.01" cdc="CMV">
			<DA fc="MX" name="instCVal" bType="Struct" type="SIPROTEC5_DAType_Vector_mag_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="MX" name="cVal" bType="Struct" type="SIPROTEC5_DAType_Vector_mag_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="MX" name="q" bType="Quality" />
			<DA fc="MX" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="db" bType="INT32U" valKind="Set">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbRef" bType="FLOAT32" valKind="Set">
				<Val>0</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_DEL_mag_V09.90.01_V09.90.01" cdc="DEL">
			<SDO name="phsAB" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="phsBC" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="phsCA" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_WYE_ABC_mag_V09.90.01_V09.90.01" cdc="WYE">
			<SDO name="phsA" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="phsB" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V09.90.01_V09.90.01" />
			<SDO name="phsC" type="SIPROTEC5_DOType_CMV_mag_without_convertions_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_MV_Float_V09.90.01_V09.90.01" cdc="MV">
			<DA fc="MX" name="instMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="MX" name="mag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="MX" name="q" bType="Quality" />
			<DA fc="MX" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="db" bType="INT32U" valKind="Set">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="dbRef" bType="FLOAT32" valKind="Set">
				<Val>0</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_VSD_readOnly_V09.90.01_V09.90.01" cdc="VSD">
			<DA fc="DC" name="val" bType="VisString255" valKind="RO" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ING_INT32_div_readOnly_V09.90.01_V09.90.01" cdc="ING">
			<DA fc="SE" name="setVal" bType="INT32" valKind="RO" />
			<DA dchg="true" fc="CF" name="minVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="maxVal" bType="INT32" valKind="RO">
				<Val>0</Val>
			</DA>
			<DA dchg="true" fc="CF" name="stepSize" bType="INT32U" valKind="RO">
				<Val>0</Val>
			</DA>
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_AccPro_edit_V09.90.01_V09.90.01" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_EnType_InstrumentTransformerProtectionRatingKind_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_AccMeas_edit_V09.90.01_V09.90.01" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_EnType_InstrumentTransformerMeasurementRatingKind_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ASG_FLOAT32_edit_V09.90.01_V09.90.01" cdc="ASG">
			<DA fc="SE" name="setMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="minVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="maxVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="stepSize" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ENG_TextList_Trp_edit_V09.90.01_V09.90.01" cdc="ENG">
			<DA fc="SE" name="setVal" bType="Enum" valKind="Set" type="SIPROTEC5_Textlist_Trp_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SAV_VDEWChannelNumber_V09.90.01_V09.90.01" cdc="SAV">
			<DA fc="MX" name="instMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_INT32_V09.90.01_V09.90.01" />
			<DA qchg="true" fc="MX" name="q" bType="Quality" />
			<DA fc="MX" name="t" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="sVC" bType="Struct" type="SIPROTEC5_DAType_ScaledValueConfig_readOnly_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_ASG_FLOAT32_readOnly_V09.90.01_V09.90.01" cdc="ASG">
			<DA fc="SE" name="setMag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="units" bType="Struct" type="SIPROTEC5_DAType_Units_1_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="minVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="maxVal" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V09.90.01_V09.90.01" />
			<DA dchg="true" fc="CF" name="stepSize" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V09.90.01_V09.90.01" />
		</DOType>
		<DOType id="SIPROTEC5_DOType_SPC_dir_with_enh_sec_FnKey_on_V09.90.01_V09.90.01" cdc="SPC">
			<DA fc="ST" name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<DA fc="ST" name="ctlNum" bType="INT8U" />
			<DA dchg="true" fc="ST" name="stVal" bType="BOOLEAN" />
			<DA qchg="true" fc="ST" name="q" bType="Quality" />
			<DA fc="ST" name="t" bType="Timestamp" />
			<DA dchg="true" fc="OR" name="opRcvd" bType="BOOLEAN" />
			<DA dchg="true" fc="OR" name="opOk" bType="BOOLEAN" />
			<DA fc="OR" name="tOpOk" bType="Timestamp" />
			<DA dchg="true" fc="CF" name="ctlModel" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_ctlModel_dir_with_enh_sec_V09.90.01_V09.90.01">
				<Val>direct-with-enhanced-security</Val>
			</DA>
			<DA dchg="true" fc="CF" name="operTimeout" bType="INT32U">
				<Val>0</Val>
			</DA>
			<DA fc="CO" name="Oper" bType="Struct" type="SIPROTEC5_DAType_Oper_Boolean_V09.90.01_V09.90.01" />
		</DOType>
		<DAType id="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01">
			<BDA name="orCat" bType="Enum" type="SIPROTEC5_Textlist_orCategory_V09.90.01_V09.90.01" />
			<BDA name="orIdent" bType="Octet64" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_Oper_Boolean_V09.90.01_V09.90.01">
			<BDA name="ctlVal" bType="BOOLEAN" />
			<BDA name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<BDA name="ctlNum" bType="INT8U" />
			<BDA name="T" bType="Timestamp" />
			<BDA name="Test" bType="BOOLEAN" />
			<BDA name="Check" bType="Check" />
			<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
		</DAType>
		<DAType id="SIPROTEC5_DAType_Oper_Mod_OnBlockedTestTestBlocked_V09.90.01_V09.90.01">
			<BDA name="ctlVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_OnBlockedTestTestBlocked_V09.90.01_V09.90.01" />
			<BDA name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<BDA name="ctlNum" bType="INT8U" />
			<BDA name="T" bType="Timestamp" />
			<BDA name="Test" bType="BOOLEAN" />
			<BDA name="Check" bType="Check" />
			<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
		</DAType>
		<DAType id="SIPROTEC5_DAType_Units_1_V09.90.01_V09.90.01">
			<BDA name="SIUnit" bType="Enum" valKind="RO" type="SIPROTEC5_EnType_SIUnit_V09.90.01_V09.90.01" />
			<BDA name="multiplier" bType="Enum" valKind="RO" type="SIPROTEC5_EnType_Multiplier_V09.90.01_V09.90.01" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_CalendarTime_V09.90.01_V09.90.01">
			<BDA name="occ" bType="INT16U" />
			<BDA name="occType" bType="Enum" type="SIPROTEC5_EnType_Cal_Occ_Type_V09.90.01_V09.90.01" />
			<BDA name="occPer" bType="Enum" type="SIPROTEC5_EnType_Cal_Occ_Period_V09.90.01_V09.90.01" />
			<BDA name="weekDay" bType="Enum" type="SIPROTEC5_EnType_Cal_WeekDay_V09.90.01_V09.90.01" />
			<BDA name="month" bType="Enum" type="SIPROTEC5_EnType_Cal_Month_V09.90.01_V09.90.01" />
			<BDA name="day" bType="INT8U" />
			<BDA name="hr" bType="INT8U" />
			<BDA name="mn" bType="INT8U" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_AnalogValue_FLOAT32_V09.90.01_V09.90.01">
			<BDA name="f" bType="FLOAT32" valKind="Set">
				<Val>0</Val>
			</BDA>
		</DAType>
		<DAType id="SIPROTEC5_DAType_Oper_Mod_V09.90.01_V09.90.01">
			<BDA name="ctlVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_V09.90.01_V09.90.01" />
			<BDA name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<BDA name="ctlNum" bType="INT8U" />
			<BDA name="T" bType="Timestamp" />
			<BDA name="Test" bType="BOOLEAN" />
			<BDA name="Check" bType="Check" />
			<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
		</DAType>
		<DAType id="SIPROTEC5_DAType_PulseConfig_XCBR_V09.90.01_V09.90.01">
			<BDA name="cmdQual" bType="Enum" valKind="RO" type="SIPROTEC5_Textlist_PulseConfigCmdQual_V09.90.01_V09.90.01" />
			<BDA name="onDur" bType="INT32U" valKind="RO" />
			<BDA name="offDur" bType="INT32U" valKind="RO" />
			<BDA name="numPls" bType="INT32U" valKind="RO" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_Cancel_Boolean_V09.90.01_V09.90.01">
			<BDA name="ctlVal" bType="BOOLEAN" />
			<BDA name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<BDA name="ctlNum" bType="INT8U" />
			<BDA name="T" bType="Timestamp" />
			<BDA name="Test" bType="BOOLEAN" />
			<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
		</DAType>
		<DAType id="SIPROTEC5_DAType_Vector_V09.90.01_V09.90.01">
			<BDA name="mag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V09.90.01_V09.90.01" />
			<BDA name="ang" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V09.90.01_V09.90.01" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_Oper_Mod_OnOff_V09.90.01_V09.90.01">
			<BDA name="ctlVal" bType="Enum" type="SIPROTEC5_Textlist_Behavior_OnOff_V09.90.01_V09.90.01" />
			<BDA name="origin" bType="Struct" type="SIPROTEC5_DAType_origin_V09.90.01_V09.90.01" />
			<BDA name="ctlNum" bType="INT8U" />
			<BDA name="T" bType="Timestamp" />
			<BDA name="Test" bType="BOOLEAN" />
			<BDA name="Check" bType="Check" />
			<ProtNs type="8-MMS">IEC 61850-8-1:2003</ProtNs>
		</DAType>
		<DAType id="SIPROTEC5_DAType_Vector_mag_V09.90.01_V09.90.01">
			<BDA name="mag" bType="Struct" type="SIPROTEC5_DAType_AnalogValue_FLOAT32_V09.90.01_V09.90.01" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_AnalogValue_FLOAT32_readOnly_V09.90.01_V09.90.01">
			<BDA name="f" bType="FLOAT32" valKind="RO">
				<Val>0</Val>
			</BDA>
		</DAType>
		<DAType id="SIPROTEC5_DAType_AnalogValue_INT32_V09.90.01_V09.90.01">
			<BDA name="i" bType="INT32" />
		</DAType>
		<DAType id="SIPROTEC5_DAType_ScaledValueConfig_readOnly_V09.90.01_V09.90.01">
			<BDA name="scaleFactor" bType="FLOAT32" valKind="RO">
				<Val>1</Val>
			</BDA>
			<BDA name="offset" bType="FLOAT32" valKind="RO">
				<Val>0</Val>
			</BDA>
		</DAType>
		<EnumType id="SIPROTEC5_Textlist_orCategory_V09.90.01_V09.90.01">
			<EnumVal ord="0">not-supported</EnumVal>
			<EnumVal ord="1">bay-control</EnumVal>
			<EnumVal ord="2">station-control</EnumVal>
			<EnumVal ord="3">remote-control</EnumVal>
			<EnumVal ord="4">automatic-bay</EnumVal>
			<EnumVal ord="5">automatic-station</EnumVal>
			<EnumVal ord="6">automatic-remote</EnumVal>
			<EnumVal ord="7">maintenance</EnumVal>
			<EnumVal ord="8">process</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ctlModel_dir_with_nor_sec_V09.90.01_V09.90.01">
			<EnumVal ord="1">direct-with-normal-security</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Health_V09.90.01_V09.90.01">
			<EnumVal ord="1">Ok</EnumVal>
			<EnumVal ord="2">Warning</EnumVal>
			<EnumVal ord="3">Alarm</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Behavior_V09.90.01_V09.90.01">
			<EnumVal ord="1">on</EnumVal>
			<EnumVal ord="2">blocked</EnumVal>
			<EnumVal ord="3">test</EnumVal>
			<EnumVal ord="4">test/blocked</EnumVal>
			<EnumVal ord="5">off</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Behavior_OnBlockedTestTestBlocked_V09.90.01_V09.90.01">
			<EnumVal ord="1">on</EnumVal>
			<EnumVal ord="2">blocked</EnumVal>
			<EnumVal ord="3">test</EnumVal>
			<EnumVal ord="4">test/blocked</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_SIUnit_V09.90.01_V09.90.01">
			<EnumVal ord="-42">A/s</EnumVal>
			<EnumVal ord="-41">p.u./s</EnumVal>
			<EnumVal ord="-40">ns</EnumVal>
			<EnumVal ord="-39">'</EnumVal>
			<EnumVal ord="-38">kV/mA</EnumVal>
			<EnumVal ord="-37">kA/V</EnumVal>
			<EnumVal ord="-36">ohm/m</EnumVal>
			<EnumVal ord="-35">ppm/°C</EnumVal>
			<EnumVal ord="-34">F/m</EnumVal>
			<EnumVal ord="-33">H/m</EnumVal>
			<EnumVal ord="-32">ms/kPa</EnumVal>
			<EnumVal ord="-31">kPa</EnumVal>
			<EnumVal ord="-30">ms/V</EnumVal>
			<EnumVal ord="-29">ms/K</EnumVal>
			<EnumVal ord="-28">V/s</EnumVal>
			<EnumVal ord="-27">I/Ir*s</EnumVal>
			<EnumVal ord="-26">1/week</EnumVal>
			<EnumVal ord="-25">1/d</EnumVal>
			<EnumVal ord="-24">1/h</EnumVal>
			<EnumVal ord="-23">1/min</EnumVal>
			<EnumVal ord="-22">periods</EnumVal>
			<EnumVal ord="-21">GB</EnumVal>
			<EnumVal ord="-20">dF</EnumVal>
			<EnumVal ord="-19">cycle</EnumVal>
			<EnumVal ord="-18">mile</EnumVal>
			<EnumVal ord="-17">inch</EnumVal>
			<EnumVal ord="-16">°F</EnumVal>
			<EnumVal ord="-15">I/IrObj</EnumVal>
			<EnumVal ord="-14">MB</EnumVal>
			<EnumVal ord="-13">KB</EnumVal>
			<EnumVal ord="-12">Bytes</EnumVal>
			<EnumVal ord="-11">p.u.</EnumVal>
			<EnumVal ord="-10">day(s)</EnumVal>
			<EnumVal ord="-7">%</EnumVal>
			<EnumVal ord="-4">F/mi</EnumVal>
			<EnumVal ord="-3">ohm/mi</EnumVal>
			<EnumVal ord="-2">F/km</EnumVal>
			<EnumVal ord="-1">ohm/km</EnumVal>
			<EnumVal ord="1" />
			<EnumVal ord="2">m</EnumVal>
			<EnumVal ord="3">kg</EnumVal>
			<EnumVal ord="4">s</EnumVal>
			<EnumVal ord="5">A</EnumVal>
			<EnumVal ord="6">K</EnumVal>
			<EnumVal ord="7">mol</EnumVal>
			<EnumVal ord="8">cd</EnumVal>
			<EnumVal ord="9">deg</EnumVal>
			<EnumVal ord="10">rad</EnumVal>
			<EnumVal ord="11">sr</EnumVal>
			<EnumVal ord="21">Gy</EnumVal>
			<EnumVal ord="23">°C</EnumVal>
			<EnumVal ord="24">Sv</EnumVal>
			<EnumVal ord="25">F</EnumVal>
			<EnumVal ord="26">C</EnumVal>
			<EnumVal ord="27">S</EnumVal>
			<EnumVal ord="28">H</EnumVal>
			<EnumVal ord="29">V</EnumVal>
			<EnumVal ord="30">ohm</EnumVal>
			<EnumVal ord="31">J</EnumVal>
			<EnumVal ord="32">N</EnumVal>
			<EnumVal ord="33">Hz</EnumVal>
			<EnumVal ord="34">lx</EnumVal>
			<EnumVal ord="35">Lm</EnumVal>
			<EnumVal ord="36">Wb</EnumVal>
			<EnumVal ord="37">T</EnumVal>
			<EnumVal ord="38">W</EnumVal>
			<EnumVal ord="39">Pa</EnumVal>
			<EnumVal ord="41">m²</EnumVal>
			<EnumVal ord="42">m³</EnumVal>
			<EnumVal ord="43">m/s</EnumVal>
			<EnumVal ord="44">m/s²</EnumVal>
			<EnumVal ord="45">m³/s</EnumVal>
			<EnumVal ord="46">m/m³</EnumVal>
			<EnumVal ord="47">M</EnumVal>
			<EnumVal ord="48">kg/m³</EnumVal>
			<EnumVal ord="49">m²/s</EnumVal>
			<EnumVal ord="50">W/m K</EnumVal>
			<EnumVal ord="51">J/K</EnumVal>
			<EnumVal ord="52">ppm</EnumVal>
			<EnumVal ord="53">1/s</EnumVal>
			<EnumVal ord="54">rad/s</EnumVal>
			<EnumVal ord="55">W/m²</EnumVal>
			<EnumVal ord="56">J/m²</EnumVal>
			<EnumVal ord="57">S/m</EnumVal>
			<EnumVal ord="58">K/s</EnumVal>
			<EnumVal ord="59">Pa/s</EnumVal>
			<EnumVal ord="60">J/kg K</EnumVal>
			<EnumVal ord="61">VA</EnumVal>
			<EnumVal ord="63">VAr</EnumVal>
			<EnumVal ord="64">phi</EnumVal>
			<EnumVal ord="65">cos(phi)</EnumVal>
			<EnumVal ord="66">Vs</EnumVal>
			<EnumVal ord="67">V²</EnumVal>
			<EnumVal ord="68">As</EnumVal>
			<EnumVal ord="69">A²</EnumVal>
			<EnumVal ord="70">A²t</EnumVal>
			<EnumVal ord="71">VAh</EnumVal>
			<EnumVal ord="72">Wh</EnumVal>
			<EnumVal ord="73">VArh</EnumVal>
			<EnumVal ord="74">V/Hz</EnumVal>
			<EnumVal ord="75">Hz/s</EnumVal>
			<EnumVal ord="76">char</EnumVal>
			<EnumVal ord="77">char/s</EnumVal>
			<EnumVal ord="78">kgm²</EnumVal>
			<EnumVal ord="79">dB</EnumVal>
			<EnumVal ord="80">J/Wh</EnumVal>
			<EnumVal ord="81">W/s</EnumVal>
			<EnumVal ord="82">l/s</EnumVal>
			<EnumVal ord="83">dBm</EnumVal>
			<EnumVal ord="84">h</EnumVal>
			<EnumVal ord="85">min</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_Multiplier_V09.90.01_V09.90.01">
			<EnumVal ord="-24">y</EnumVal>
			<EnumVal ord="-21">z</EnumVal>
			<EnumVal ord="-18">a</EnumVal>
			<EnumVal ord="-15">f</EnumVal>
			<EnumVal ord="-12">p</EnumVal>
			<EnumVal ord="-9">n</EnumVal>
			<EnumVal ord="-6">µ</EnumVal>
			<EnumVal ord="-3">m</EnumVal>
			<EnumVal ord="-2">c</EnumVal>
			<EnumVal ord="-1">d</EnumVal>
			<EnumVal ord="0" />
			<EnumVal ord="1">da</EnumVal>
			<EnumVal ord="2">h</EnumVal>
			<EnumVal ord="3">k</EnumVal>
			<EnumVal ord="6">M</EnumVal>
			<EnumVal ord="9">G</EnumVal>
			<EnumVal ord="12">T</EnumVal>
			<EnumVal ord="15">P</EnumVal>
			<EnumVal ord="18">E</EnumVal>
			<EnumVal ord="21">Z</EnumVal>
			<EnumVal ord="24">Y</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ctlModel_status_only_V09.90.01_V09.90.01">
			<EnumVal ord="0">status-only</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_Cal_Occ_Type_V09.90.01_V09.90.01">
			<EnumVal ord="0">Time</EnumVal>
			<EnumVal ord="1">WeekDay</EnumVal>
			<EnumVal ord="2">WeekOfYear</EnumVal>
			<EnumVal ord="3">DayOfMonth</EnumVal>
			<EnumVal ord="4">DayOfYear</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_Cal_Occ_Period_V09.90.01_V09.90.01">
			<EnumVal ord="0">Hour</EnumVal>
			<EnumVal ord="1">Day</EnumVal>
			<EnumVal ord="2">Week</EnumVal>
			<EnumVal ord="3">Month</EnumVal>
			<EnumVal ord="4">Year</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_Cal_WeekDay_V09.90.01_V09.90.01">
			<EnumVal ord="1">Monday</EnumVal>
			<EnumVal ord="2">Tuesday</EnumVal>
			<EnumVal ord="3">Wednesday</EnumVal>
			<EnumVal ord="4">Thursday</EnumVal>
			<EnumVal ord="5">Friday</EnumVal>
			<EnumVal ord="6">Saturday</EnumVal>
			<EnumVal ord="7">Sunday</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_Cal_Month_V09.90.01_V09.90.01">
			<EnumVal ord="1">January</EnumVal>
			<EnumVal ord="2">February</EnumVal>
			<EnumVal ord="3">March</EnumVal>
			<EnumVal ord="4">April</EnumVal>
			<EnumVal ord="5">May</EnumVal>
			<EnumVal ord="6">June</EnumVal>
			<EnumVal ord="7">July</EnumVal>
			<EnumVal ord="8">August</EnumVal>
			<EnumVal ord="9">September</EnumVal>
			<EnumVal ord="10">October</EnumVal>
			<EnumVal ord="11">November</EnumVal>
			<EnumVal ord="12">December</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_TmSrcTyp_V09.90.01_V09.90.01">
			<EnumVal ord="-15">ERR</EnumVal>
			<EnumVal ord="-14">T104</EnumVal>
			<EnumVal ord="-13">T103</EnumVal>
			<EnumVal ord="-12">RTC</EnumVal>
			<EnumVal ord="-11">IEEE1588</EnumVal>
			<EnumVal ord="-10">EXTERN_SIPROTEC</EnumVal>
			<EnumVal ord="-9">MINUTE_PULS</EnumVal>
			<EnumVal ord="-8">DNP30</EnumVal>
			<EnumVal ord="-7">MODBUS</EnumVal>
			<EnumVal ord="-6">PROFIBUS</EnumVal>
			<EnumVal ord="-5">GALILEO</EnumVal>
			<EnumVal ord="-4">SYNC_BOX</EnumVal>
			<EnumVal ord="-3">DCF77</EnumVal>
			<EnumVal ord="-2">GPS</EnumVal>
			<EnumVal ord="-1">HMI</EnumVal>
			<EnumVal ord="1">Unknown</EnumVal>
			<EnumVal ord="2">SNTP</EnumVal>
			<EnumVal ord="3">PTP</EnumVal>
			<EnumVal ord="4">IRIG-B</EnumVal>
			<EnumVal ord="5">Substation internal</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ServiceType_V09.90.01_V09.90.01">
			<EnumVal ord="-3">CancelEditSG</EnumVal>
			<EnumVal ord="-2">None</EnumVal>
			<EnumVal ord="-1">Deprecated</EnumVal>
			<EnumVal ord="0">Unknown</EnumVal>
			<EnumVal ord="1">Associate</EnumVal>
			<EnumVal ord="2">Abort</EnumVal>
			<EnumVal ord="3">Release</EnumVal>
			<EnumVal ord="4">GetServerDirectory</EnumVal>
			<EnumVal ord="5">GetLogicalDeviceDirectory</EnumVal>
			<EnumVal ord="6">GetAllDataValues</EnumVal>
			<EnumVal ord="7">GetDataValues</EnumVal>
			<EnumVal ord="8">SetDataValues</EnumVal>
			<EnumVal ord="9">GetDataDirectory</EnumVal>
			<EnumVal ord="10">GetDataDefinition</EnumVal>
			<EnumVal ord="11">GetDataSetValues</EnumVal>
			<EnumVal ord="12">SetDataSetValues</EnumVal>
			<EnumVal ord="13">CreateDataSet</EnumVal>
			<EnumVal ord="14">DeleteDataSet</EnumVal>
			<EnumVal ord="15">GetDataSetDirectory</EnumVal>
			<EnumVal ord="16">SelectActiveSG</EnumVal>
			<EnumVal ord="17">SelectEditSG</EnumVal>
			<EnumVal ord="18">SetEditSGValue</EnumVal>
			<EnumVal ord="19">ConfirmEditSGValues</EnumVal>
			<EnumVal ord="20">GetEditSGValue</EnumVal>
			<EnumVal ord="21">GetSGCBValues</EnumVal>
			<EnumVal ord="22">Report</EnumVal>
			<EnumVal ord="23">GetBRCBValues</EnumVal>
			<EnumVal ord="24">SetBRCBValues</EnumVal>
			<EnumVal ord="25">GetURCBValues</EnumVal>
			<EnumVal ord="26">SetURCBValues</EnumVal>
			<EnumVal ord="27">GetLCBValues</EnumVal>
			<EnumVal ord="28">SetLCBValues</EnumVal>
			<EnumVal ord="29">QueryLogByTime</EnumVal>
			<EnumVal ord="30">QueryLogAfter</EnumVal>
			<EnumVal ord="31">GetLogStatusValues</EnumVal>
			<EnumVal ord="32">SendGOOSEMessage</EnumVal>
			<EnumVal ord="33">GetGoCBValues</EnumVal>
			<EnumVal ord="34">SetGoCBValues</EnumVal>
			<EnumVal ord="35">GetGoReference</EnumVal>
			<EnumVal ord="36">GetGOOSEElementNumber</EnumVal>
			<EnumVal ord="37">SendMSVMessage</EnumVal>
			<EnumVal ord="38">GetMSVCBValues</EnumVal>
			<EnumVal ord="39">SetMSVCBValues</EnumVal>
			<EnumVal ord="40">SendUSVMessage</EnumVal>
			<EnumVal ord="41">GetUSVCBValues</EnumVal>
			<EnumVal ord="42">SetUSVCBValues</EnumVal>
			<EnumVal ord="43">Select</EnumVal>
			<EnumVal ord="44">SelectWithValue</EnumVal>
			<EnumVal ord="45">Cancel</EnumVal>
			<EnumVal ord="46">Operate</EnumVal>
			<EnumVal ord="47">CommandTermination</EnumVal>
			<EnumVal ord="48">TimeActivatedOperate</EnumVal>
			<EnumVal ord="49">GetFile</EnumVal>
			<EnumVal ord="50">SetFile</EnumVal>
			<EnumVal ord="51">DeleteFile</EnumVal>
			<EnumVal ord="52">GetFileAttributeValues</EnumVal>
			<EnumVal ord="53">TimeSynchronization</EnumVal>
			<EnumVal ord="54">InternalChange</EnumVal>
			<EnumVal ord="55">GetLogicalNodeDirectory</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ServiceError_V09.90.01_V09.90.01">
			<EnumVal ord="0">no-error</EnumVal>
			<EnumVal ord="1">instance-not-available</EnumVal>
			<EnumVal ord="2">instance-in-use</EnumVal>
			<EnumVal ord="3">access-violation</EnumVal>
			<EnumVal ord="4">access-not-allowed-in-current-state</EnumVal>
			<EnumVal ord="5">parameter-value-inappropriate</EnumVal>
			<EnumVal ord="6">parameter-value-inconsistent</EnumVal>
			<EnumVal ord="7">class-not-supported</EnumVal>
			<EnumVal ord="8">instance-locked-by-other-client</EnumVal>
			<EnumVal ord="9">control-must-be-selected</EnumVal>
			<EnumVal ord="10">type-conflict</EnumVal>
			<EnumVal ord="11">failed-due-to-communications-constraint</EnumVal>
			<EnumVal ord="12">failed-due-to-server-constraint</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_AddCause_V09.90.01_V09.90.01">
			<EnumVal ord="-15">Current-criterion</EnumVal>
			<EnumVal ord="-14">LineDiff-Protection-in-test</EnumVal>
			<EnumVal ord="-13">FLO-is-pendingt</EnumVal>
			<EnumVal ord="-12">Topology-not-stable</EnumVal>
			<EnumVal ord="-11">COM-will-be-disconnected</EnumVal>
			<EnumVal ord="-10">Circuit-breaker-not-open</EnumVal>
			<EnumVal ord="-9">CB-test-in-progress</EnumVal>
			<EnumVal ord="-8">CB-stayed-closed</EnumVal>
			<EnumVal ord="-7">CB-not-ready</EnumVal>
			<EnumVal ord="-6">CB-not-closed</EnumVal>
			<EnumVal ord="-5">Fault-occured</EnumVal>
			<EnumVal ord="-4">Blocked-by-protection</EnumVal>
			<EnumVal ord="-3">Close-command-active</EnumVal>
			<EnumVal ord="-2">Trip-command-active</EnumVal>
			<EnumVal ord="-1">SEL-time-out</EnumVal>
			<EnumVal ord="0">Unknown</EnumVal>
			<EnumVal ord="1">Not-supported</EnumVal>
			<EnumVal ord="2">Blocked-by-switching-hierarchy</EnumVal>
			<EnumVal ord="3">Select-failed</EnumVal>
			<EnumVal ord="4">Invalid-position</EnumVal>
			<EnumVal ord="5">Position-reached</EnumVal>
			<EnumVal ord="6">Parameter-change-in-execution</EnumVal>
			<EnumVal ord="7">Step-limit</EnumVal>
			<EnumVal ord="8">Blocked-by-Mode</EnumVal>
			<EnumVal ord="9">Blocked-by-process</EnumVal>
			<EnumVal ord="10">Blocked-by-interlocking</EnumVal>
			<EnumVal ord="11">Blocked-by-synchrocheck</EnumVal>
			<EnumVal ord="12">Command-already-in-execution</EnumVal>
			<EnumVal ord="13">Blocked-by-health</EnumVal>
			<EnumVal ord="14">1-of-n-control</EnumVal>
			<EnumVal ord="15">Abortion-by-cancel</EnumVal>
			<EnumVal ord="16">Time-limit-over</EnumVal>
			<EnumVal ord="17">Abortion-by-trip</EnumVal>
			<EnumVal ord="18">Object-not-selected</EnumVal>
			<EnumVal ord="19">Object-already-selected</EnumVal>
			<EnumVal ord="20">No-access-authority</EnumVal>
			<EnumVal ord="21">Ended-with-overshoot</EnumVal>
			<EnumVal ord="22">Abortion-due-to-deviation</EnumVal>
			<EnumVal ord="23">Abortion-by-communication-loss</EnumVal>
			<EnumVal ord="24">Blocked-by-command</EnumVal>
			<EnumVal ord="25">None</EnumVal>
			<EnumVal ord="26">Inconsistent-parameters</EnumVal>
			<EnumVal ord="27">Locked-by-other-client</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_RedMode_V09.90.01_V09.90.01">
			<EnumVal ord="1">AutoMode</EnumVal>
			<EnumVal ord="2">AutoMode Main</EnumVal>
			<EnumVal ord="3">ManMode Main</EnumVal>
			<EnumVal ord="4">ManMode Red</EnumVal>
			<EnumVal ord="5">Autolock Main</EnumVal>
			<EnumVal ord="6">Autolock Red</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Behavior_OnOff_V09.90.01_V09.90.01">
			<EnumVal ord="1">on</EnumVal>
			<EnumVal ord="5">off</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ctlModel_status_only_and_dir_with_nor_sec_V09.90.01_V09.90.01">
			<EnumVal ord="0">status-only</EnumVal>
			<EnumVal ord="1">direct-with-normal-security</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_DirectionGeneral_V09.90.01_V09.90.01">
			<EnumVal ord="0">unknown</EnumVal>
			<EnumVal ord="1">forward</EnumVal>
			<EnumVal ord="2">backward</EnumVal>
			<EnumVal ord="3">both</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_DirectionPhase_V09.90.01_V09.90.01">
			<EnumVal ord="0">unknown</EnumVal>
			<EnumVal ord="1">forward</EnumVal>
			<EnumVal ord="2">backward</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_PulseConfigCmdQual_V09.90.01_V09.90.01">
			<EnumVal ord="0">pulse</EnumVal>
			<EnumVal ord="1">persistent</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ctlModel_V09.90.01_V09.90.01">
			<EnumVal ord="0">status-only</EnumVal>
			<EnumVal ord="1">direct-with-normal-security</EnumVal>
			<EnumVal ord="2">sbo-with-normal-security</EnumVal>
			<EnumVal ord="3">direct-with-enhanced-security</EnumVal>
			<EnumVal ord="4">sbo-with-enhanced-security</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_SEQtype_V09.90.01_V09.90.01">
			<EnumVal ord="0">pos-neg-zero</EnumVal>
			<EnumVal ord="1">dir-quad-zero</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_InstrumentTransformerProtectionRatingKind_V09.90.01_V09.90.01">
			<EnumVal ord="1">1</EnumVal>
			<EnumVal ord="2">2</EnumVal>
			<EnumVal ord="3">3</EnumVal>
			<EnumVal ord="4">5</EnumVal>
			<EnumVal ord="5">6</EnumVal>
			<EnumVal ord="6">10</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_EnType_InstrumentTransformerMeasurementRatingKind_V09.90.01_V09.90.01">
			<EnumVal ord="1">0.05</EnumVal>
			<EnumVal ord="2">0.1</EnumVal>
			<EnumVal ord="3">0.2</EnumVal>
			<EnumVal ord="4">0.2S</EnumVal>
			<EnumVal ord="5">0.5</EnumVal>
			<EnumVal ord="6">0.5S</EnumVal>
			<EnumVal ord="7">1</EnumVal>
			<EnumVal ord="8">3</EnumVal>
			<EnumVal ord="9">5</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_Trp_V09.90.01_V09.90.01">
			<EnumVal ord="1">Unknown</EnumVal>
			<EnumVal ord="2">P</EnumVal>
			<EnumVal ord="3">PR</EnumVal>
			<EnumVal ord="4">PX</EnumVal>
			<EnumVal ord="5">PXR</EnumVal>
			<EnumVal ord="6">TPX</EnumVal>
			<EnumVal ord="7">TPY</EnumVal>
			<EnumVal ord="8">TPZ</EnumVal>
			<EnumVal ord="9">TPE</EnumVal>
			<EnumVal ord="10">TPS</EnumVal>
			<EnumVal ord="11">TPM</EnumVal>
		</EnumType>
		<EnumType id="SIPROTEC5_Textlist_ctlModel_dir_with_enh_sec_V09.90.01_V09.90.01">
			<EnumVal ord="3">direct-with-enhanced-security</EnumVal>
		</EnumType>
	</DataTypeTemplates>
</SCL>