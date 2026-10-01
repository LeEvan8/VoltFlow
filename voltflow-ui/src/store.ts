import { create } from 'zustand';
import { applyNodeChanges } from 'reactflow';
import type { NodeChange } from 'reactflow';
import { layoutGraph } from './layout';

// Backend base URL; override with VITE_API_URL (see .env.example).
export const API_BASE: string = import.meta.env.VITE_API_URL ?? 'http://localhost:8000';

export interface IEDNode {
  id: string;
  type: string;
  data: {
    label: string;
    file: string;                 // authoritative file for this IED
    source_pinned: boolean;       // true when the user chose `file`; false = latest upload wins
    copies: string[];             // every uploaded file containing this IED, newest first
    manufacturer: string | null;
    unused_cbs: UnusedControlBlock[];
  };
  position: { x: number; y: number };
}

export interface UnusedControlBlock {
  ld_inst: string;
  cb_name: string;
  status: 'UNUSED_CB';
  reason: string;
}

export interface WireField { field: string; wire: string | null; configured: string | null; ok: boolean }
export interface WireSubscriberCheck { field: string; wire: string | null; expected: string | null; ok: boolean }
export interface WireInfo {
  state: 'ok' | 'mismatch' | 'not-seen' | 'ied-silent';
  // present when the stream was seen
  capture?: string;
  matched_via?: 'gocbRef' | 'GoID';
  frames?: number;
  first_seen?: string | null;
  last_seen?: string | null;
  src_mac?: string;
  vlan_visible?: boolean;
  simulation?: boolean;
  fields?: WireField[];
  subscriber_checks?: WireSubscriberCheck[];
  type_problems?: string[];
  timing?: {
    max_steady_gap_ms: number | null; max_gap_ms: number | null; max_time_ms: string | null; min_time_ms: string | null;
    tals_ms: number[]; first_retransmission_ms: number[]; interruptions: number; frames_lost: number; st_resets: number; events: number;
    clock_offset_s: number | null;  // IED clock minus capture clock, from state changes seen live
  };
  values?: [string, string][];
  value_time?: string | null;
}

export interface CaptureSummary {
  name: string;
  order: number;
  frames: number;
  goose_frames: number;
  decode_errors: number;
  streams: number;
  start: string | null;
  end: string | null;
  duration_s: number | null;
}

export type ExpectedParam = 'conf_rev' | 'appid' | 'mac' | 'go_id' | 'dataset' | 'vlan_id' | 'vlan_priority';

export interface EdgeFlags {
  rev_mismatch: boolean;
  appid_mismatch: boolean;
  mac_mismatch: boolean;
  goid_mismatch: boolean;
  vlan_mismatch: boolean;
  dataset_mismatch: boolean;
  type_mismatch: boolean;
  appid_collision: boolean;
}

export interface GOOSEControlDetails {
  id: string;
  source: string;
  target: string;
  type: string;
  selected?: boolean;
  data: {
    color_state: 'GREEN' | 'YELLOW' | 'RED' | 'AMBER';
    // 'VALID' (every required parameter compared and matching), 'UNVERIFIED' (nothing wrong found, but some
    // required parameter is not declared by the subscriber), or the flag of the most severe finding.
    status: string;
    label: string;
    edge_index: number;
    is_self_loop: boolean;
    is_orphan_stub: boolean;
    // Dangling inbound stub: the subscriber expects data from a control block that is missing or deleted.
    is_unresolved_stub: boolean;
    unresolved_publisher: string | null;
    network_details: {
      dataset: string | null;
      cb_name: string | null;
      ld_inst: string | null;
      go_id: string | null;
      appid: string | null;
      mac_address: string | null;
      vlan_id: string | null;
      vlan_priority: string | null;
      pub_rev: string | null;
      min_time: string | null;
      max_time: string | null;
      // Subscriber-side expectations; null when the subscriber declares nothing for that parameter.
      sub_rev: string | null;
      sub_appid: string | null;
      sub_vlan: string | null;
      sub_pri: string | null;
      sub_mac: string | null;
      sub_dataset: string | null;
      sub_goid: string | null;
      // parameter -> where the expected value came from (vendor record or the subscriber's own file)
      expected_sources: Partial<Record<ExpectedParam, string>>;
      not_declared: ExpectedParam[];
      fully_verified: boolean;
      wire: WireInfo | null;  // what a loaded network capture shows for this control block (null: no capture)
      match_method: 'standard' | 'dataset' | null;
      flags: EdgeFlags;
    };
  };
}

export interface ValidationError {
  id: number;
  ied_name: string;
  severity: 'ERROR' | 'WARNING' | 'INFO';
  rule_type: string;
  message: string;
  xpath: string;
  target_ied: string;
  reference: string | null;  // clause of the IEC 61850 standard the rule is based on
}

export interface WorkspaceFile {
  name: string;
  order: number;   // upload order; by default the latest file containing an IED is authoritative
  ieds: string[];
}

export interface UploadResult {
  file: string;
  ok: boolean;
  message: string;
}

type Position = { x: number; y: number };

interface VoltFlowUIState {
  nodes: IEDNode[];
  edges: GOOSEControlDetails[];
  errors: ValidationError[];
  files: WorkspaceFile[];
  captures: CaptureSummary[];
  manualPositions: Record<string, Position>;  // nodes the user dragged keep their place across refreshes
  selectedIED: string | null;
  selectedEdgeId: string | null;
  loading: boolean;
  fetchTopology: () => Promise<void>;
  uploadFiles: (files: File[]) => Promise<UploadResult[]>;
  removeFile: (name: string) => Promise<void>;
  removeCapture: (name: string) => Promise<void>;
  setIedSource: (ied: string, sourceFile: string | null) => Promise<void>;
  onNodesChange: (changes: NodeChange[]) => void;
  relayout: () => Promise<void>;
  setSelectedIED: (iedId: string | null) => void;
  setSelectedEdgeId: (edgeId: string | null) => void;
  clearWorkspace: () => Promise<void>;
}

async function errorDetail(res: Response): Promise<string> {
  const body = await res.json().catch(() => null);
  return body?.detail ?? res.statusText;
}

export const useVoltFlowStore = create<VoltFlowUIState>((set, get) => ({
  nodes: [],
  edges: [],
  errors: [],
  files: [],
  captures: [],
  manualPositions: {},
  selectedIED: null,
  selectedEdgeId: null,
  loading: false,

  fetchTopology: async () => {
    set({ loading: true });
    try {
      const [graphRes, errRes, filesRes, capRes] = await Promise.all([
        fetch(`${API_BASE}/api/v1/graph-data`),
        fetch(`${API_BASE}/api/v1/errors`),
        fetch(`${API_BASE}/api/v1/files`),
        fetch(`${API_BASE}/api/v1/captures`),
      ]);
      if (!graphRes.ok || !errRes.ok || !filesRes.ok || !capRes.ok) throw new Error("Backend infrastructure offline");
      const [data, errorsData, filesData, capData] = await Promise.all([graphRes.json(), errRes.json(), filesRes.json(), capRes.json()]);

      const mappedWires: GOOSEControlDetails[] = data.edges.map((edge: any) => ({
        id: `e-${edge.id}`,
        source: edge.publisher,
        target: edge.subscriber,
        type: 'directionalWire',
        data: {
          color_state: edge.color_state,
          status: edge.status,
          label: edge.app_id,
          edge_index: edge.edge_index,
          is_self_loop: false,
          is_orphan_stub: edge.is_orphan_stub,
          is_unresolved_stub: edge.is_unresolved_stub,
          unresolved_publisher: edge.unresolved_publisher,
          network_details: edge.network_details
        }
      }));

      const layout = await layoutGraph(data.nodes.map((n: any) => n.name), mappedWires);
      const { manualPositions, selectedIED, selectedEdgeId } = get();
      const arrangedNodes: IEDNode[] = data.nodes.map((node: any) => ({
        id: node.name,
        type: 'default',
        data: {
          label: node.name, file: node.source_file, source_pinned: node.source_pinned, copies: node.copies,
          manufacturer: node.manufacturer, unused_cbs: node.unused_cbs,
        },
        position: manualPositions[node.name] ?? layout[node.name] ?? { x: 0, y: 0 },
      }));

      set({
        nodes: arrangedNodes, edges: mappedWires, errors: errorsData, files: filesData, captures: capData,
        // drop selections that no longer exist (e.g. after removing a file)
        selectedIED: arrangedNodes.some(n => n.id === selectedIED) ? selectedIED : null,
        selectedEdgeId: mappedWires.some(e => e.id === selectedEdgeId) ? selectedEdgeId : null,
      });
    } catch (err) {
      console.error("[Workspace State Error]", err);
    } finally {
      set({ loading: false });
    }
  },

  uploadFiles: async (files) => {
    // Sequential on purpose: upload order decides which copy of an IED is authoritative by default.
    const results: UploadResult[] = [];
    for (const file of files) {
      const formData = new FormData();
      formData.append('file', file);
      // Wireshark captures go to the capture endpoint; everything else is an SCL file.
      const endpoint = /\.(pcap|pcapng|cap)$/i.test(file.name) ? 'captures' : 'upload';
      try {
        const res = await fetch(`${API_BASE}/api/v1/${endpoint}`, { method: 'POST', body: formData });
        results.push(res.ok
          ? { file: file.name, ok: true, message: 'uploaded' }
          : { file: file.name, ok: false, message: await errorDetail(res) });
      } catch {
        results.push({ file: file.name, ok: false, message: 'backend unreachable' });
      }
    }
    await get().fetchTopology();
    return results;
  },

  removeFile: async (name) => {
    try {
      const res = await fetch(`${API_BASE}/api/v1/files/${encodeURIComponent(name)}`, { method: 'DELETE' });
      if (!res.ok) throw new Error(await errorDetail(res));
    } catch (err) {
      console.error("[File Removal Error]", err);
      alert(`Could not remove ${name}: ${err instanceof Error ? err.message : err}`);
    }
    await get().fetchTopology();
  },

  removeCapture: async (name) => {
    try {
      const res = await fetch(`${API_BASE}/api/v1/captures/${encodeURIComponent(name)}`, { method: 'DELETE' });
      if (!res.ok) throw new Error(await errorDetail(res));
    } catch (err) {
      console.error("[Capture Removal Error]", err);
      alert(`Could not remove ${name}: ${err instanceof Error ? err.message : err}`);
    }
    await get().fetchTopology();
  },

  setIedSource: async (ied, sourceFile) => {
    try {
      const res = await fetch(`${API_BASE}/api/v1/ieds/${encodeURIComponent(ied)}/source`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ source_file: sourceFile }),
      });
      if (!res.ok) throw new Error(await errorDetail(res));
    } catch (err) {
      console.error("[IED Source Error]", err);
      alert(`Could not change the authoritative file for ${ied}: ${err instanceof Error ? err.message : err}`);
    }
    await get().fetchTopology();
  },

  onNodesChange: (changes) => {
    const manualPositions = { ...get().manualPositions };
    for (const change of changes) {
      if (change.type === 'position' && change.position) manualPositions[change.id] = change.position;
    }
    set({ nodes: applyNodeChanges(changes, get().nodes) as IEDNode[], manualPositions });
  },

  relayout: async () => {
    set({ manualPositions: {} });
    await get().fetchTopology();
  },

  setSelectedIED: (iedId) => set({ selectedIED: iedId, selectedEdgeId: null }),
  setSelectedEdgeId: (edgeId) => set({ selectedEdgeId: edgeId, selectedIED: null }),

  clearWorkspace: async () => {
    try {
      await fetch(`${API_BASE}/api/v1/reset`, { method: 'DELETE' });
      set({ nodes: [], edges: [], errors: [], files: [], captures: [], manualPositions: {}, selectedIED: null, selectedEdgeId: null });
    } catch (err) {
      console.error("[Workspace Reset Error]", err);
    }
  }
}));
