import { create } from 'zustand';

export interface IEDNode {
  id: string;
  type: string;
  data: { label: string; file: string; manufacturer: string | null; unused_cbs: UnusedControlBlock[] };
  position: { x: number; y: number };
}

export interface UnusedControlBlock {
  ld_inst: string;
  cb_name: string;
  status: 'UNUSED_CB';
  reason: string;
}

export type ExpectedParam = 'conf_rev' | 'appid' | 'mac' | 'go_id' | 'dataset' | 'vlan_id' | 'vlan_priority';

export interface EdgeFlags {
  rev_mismatch: boolean;
  appid_mismatch: boolean;
  mac_mismatch: boolean;
  goid_mismatch: boolean;
  vlan_mismatch: boolean;
  dataset_mismatch: boolean;
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
}

interface VoltFlowUIState {
  nodes: IEDNode[];
  edges: GOOSEControlDetails[];
  errors: ValidationError[];
  selectedIED: string | null;
  selectedEdgeId: string | null;
  loading: boolean;
  fetchTopology: () => Promise<void>;
  setSelectedIED: (iedId: string | null) => void;
  setSelectedEdgeId: (edgeId: string | null) => void;
  clearWorkspace: () => Promise<void>;
}

export const useVoltFlowStore = create<VoltFlowUIState>((set) => ({
  nodes: [],
  edges: [],
  errors: [],
  selectedIED: null,
  selectedEdgeId: null,
  loading: false,

  fetchTopology: async () => {
    set({ loading: true });
    try {
      const res = await fetch('http://localhost:8000/api/v1/graph-data');
      if (!res.ok) throw new Error("Backend infrastructure offline");
      const data = await res.json();

      const arrangedNodes = data.nodes.map((node: any, idx: number) => ({
        id: node.name,
        type: 'default',
        data: { label: node.name, file: node.source_file, manufacturer: node.manufacturer, unused_cbs: node.unused_cbs },
        position: { x: 220 + (idx % 2) * 450, y: 180 + Math.floor(idx / 2) * 260 }
      }));

      const mappedWires = data.edges.map((edge: any) => ({
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

      const errRes = await fetch('http://localhost:8000/api/v1/errors');
      const errorsData = await errRes.json();
      
      set({ nodes: arrangedNodes, edges: mappedWires, errors: errorsData });
    } catch (err) {
      console.error("[Workspace State Error]", err);
    } finally {
      set({ loading: false });
    }
  },

  setSelectedIED: (iedId) => set({ selectedIED: iedId, selectedEdgeId: null }),
  setSelectedEdgeId: (edgeId) => set({ selectedEdgeId: edgeId, selectedIED: null }),

  clearWorkspace: async () => {
    try {
      await fetch('http://localhost:8000/api/v1/reset', { method: 'DELETE' });
      set({ nodes: [], edges: [], errors: [], selectedIED: null, selectedEdgeId: null });
    } catch (err) {}
  }
}));