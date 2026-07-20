import { create } from 'zustand';

export interface IEDNode {
  id: string;
  type: string;
  data: { label: string; file: string };
  position: { x: number; y: number };
}

export interface GOOSEControlDetails {
  id: string;
  source: string;
  target: string;
  type: string;
  selected?: boolean;
  data: {
    color_state: 'GREEN' | 'YELLOW' | 'RED';
    label: string;
    edge_index: number;
    network_details: {
      dataset: string;
      cb_name: string;
      appid: string;
      mac_address: string;
      vlan_id: string;
      vlan_priority: string;
      pub_rev: string;
      min_time: string;
      max_time: string;
      sub_rev: string;
      sub_appid: string;
      sub_vlan: string;
      sub_pri: string;
      sub_mac: string;
    };
  };
}

export interface ValidationError {
  id: number;
  ied_name: string;
  severity: string;
  rule_type: string;
  message: string;
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
      if (!res.ok) throw new Error("Backend offline");
      const data = await res.json();

      const arrangedNodes = data.nodes.map((node: any, idx: number) => ({
        id: node.name,
        type: 'default',
        data: { label: node.name, file: node.subnetwork },
        position: { x: 150 + (idx % 2) * 480, y: 150 + Math.floor(idx / 2) * 260 }
      }));

      const mappedWires = data.edges.map((edge: any) => ({
        id: `e-${edge.id}`,
        source: edge.publisher,
        target: edge.subscriber,
        type: 'directionalWire',
        data: {
          color_state: edge.color_state,
          label: edge.app_id,
          edge_index: edge.edge_index,
          network_details: edge.network_details
        }
      }));

      const errRes = await fetch('http://localhost:8000/api/v1/errors');
      const errorsData = await errRes.json();
      
      set({ nodes: arrangedNodes, edges: mappedWires, errors: errorsData });
    } catch (err) {
      console.error(err);
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