import { create } from 'zustand';

export interface IEDNode {
  id: string;
  type: string;
  data: { label: string; subnetwork: string; type: string };
  position: { x: number; y: number };
}

export interface GOOSEEdge {
  id: string;
  source: string;
  target: string;
  animated: boolean;
  label?: string;
  style?: object;
  network_details?: {
    vlan_id: string;
    vlan_priority: string;
    mac_address: string;
    appid: string;
    pub_rev: string;
    sub_rev: string;
  };
}

export interface ValidationError {
  id: number;
  ied_name: string;
  severity: 'ERROR' | 'WARNING';
  rule_type: string;
  message: string;
  xpath: string;
}

interface VoltFlowUIState {
  nodes: IEDNode[];
  edges: GOOSEEdge[];
  errors: ValidationError[];
  selectedIED: string | null;
  activeErrorLine: number | null;
  selectedXpath: string | null;
  currentFilename: string | null;
  loading: boolean;
  setFilename: (filename: string) => void;
  fetchTopology: () => Promise<void>;
  setSelectedIED: (iedId: string | null) => void;
  jumpToLine: (xpath: string) => Promise<void>;
  clearWorkspace: () => Promise<void>;
}

export const useVoltFlowStore = create<VoltFlowUIState>((set, get) => ({
  nodes: [],
  edges: [],
  errors: [],
  selectedIED: null,
  activeErrorLine: null,
  selectedXpath: null,
  currentFilename: null,
  loading: false,

  setFilename: (filename) => set({ currentFilename: filename }),

  fetchTopology: async () => {
    set({ loading: true });
    try {
      const res = await fetch('http://localhost:8000/api/v1/graph-data');
      if (!res.ok) throw new Error("Backend server unreachable");
      const data = await res.json();

      const arrangedNodes = data.nodes.map((node: any, index: number) => ({
        id: node.name,
        type: 'default',
        data: { label: node.name, subnetwork: node.subnetwork, type: node.type },
        position: { x: 100 + (index % 3) * 320, y: 150 + Math.floor(index / 3) * 220 }
      }));

      const mappedEdges = data.edges.map((edge: any) => ({
        id: `e-${edge.id}`,
        source: edge.publisher,
        target: edge.subscriber,
        animated: true,
        label: edge.app_id,
        network_details: edge.network_details,
        style: { stroke: '#38bdf8', strokeWidth: 2 }
      }));

      const errRes = await fetch('http://localhost:8000/api/v1/errors');
      const errorsData = await errRes.json();

      set({ nodes: arrangedNodes, edges: mappedEdges, errors: errorsData });
    } catch (err) {
      console.error("Failed syncing backend topologies:", err);
    } finally {
      set({ loading: false });
    }
  },

  setSelectedIED: (iedId) => {
    const { edges } = get();
    set({ selectedIED: iedId });

    if (!iedId) {
      set({
        edges: edges.map(e => ({ ...e, style: { stroke: '#38bdf8', strokeWidth: 2 }, animated: true }))
      });
      return;
    }

    set({
      edges: edges.map(edge => {
        const involvesIED = edge.source === iedId || edge.target === iedId;
        return {
          ...edge,
          animated: involvesIED,
          style: involvesIED 
            ? { stroke: '#f43f5e', strokeWidth: 3.5 } 
            : { stroke: '#475569', opacity: 0.15, strokeWidth: 1 } 
        };
      })
    });
  },

  jumpToLine: async (xpath) => {
    const { currentFilename } = get();
    try {
      const url = `http://localhost:8000/api/v1/line-index?xpath=${encodeURIComponent(xpath)}&filename=${encodeURIComponent(currentFilename || '')}`;
      const res = await fetch(url);
      if (!res.ok) return;
      const data = await res.json();
      set({ activeErrorLine: data.line_number, selectedXpath: xpath });
    } catch (err) {
      console.error("Failed resolving line pointer target context:", err);
    }
  },

  clearWorkspace: async () => {
    try {
      const res = await fetch('http://localhost:8000/api/v1/reset', { method: 'DELETE' });
      if (res.ok) {
        set({
          nodes: [],
          edges: [],
          errors: [],
          selectedIED: null,
          activeErrorLine: null,
          selectedXpath: null,
          currentFilename: null
        });
      }
    } catch (err) {
      console.error("Failed clearing working engine cache:", err);
    }
  }
}));