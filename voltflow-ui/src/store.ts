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
      // Connects directly to the Phase 1 Integration API Route
      const res = await fetch('http://localhost:8000/api/v1/graph-data');
      if (!res.ok) throw new Error("Backend server unreachable");
      const data = await res.json();

      // Auto-layout grid algorithm mapping nodes to discrete coordinate rows
      const arrangedNodes = data.nodes.map((node: any, index: number) => ({
        id: node.name,
        type: 'default',
        data: { label: node.name, subnetwork: node.subnetwork, type: node.type },
        position: { x: 100 + (index % 3) * 320, y: 150 + Math.floor(index / 3) * 220 }
      }));

      // Map backend links seamlessly to React Flow edge parameters
      const mappedEdges = data.edges.map((edge: any) => ({
        id: `e-${edge.id}`,
        source: edge.publisher,
        target: edge.subscriber,
        animated: true,
        label: edge.app_id,
        style: { stroke: '#38bdf8', strokeWidth: 2 } // Phase 2 default: Active Sky Blue wires
      }));

      // Pull active error logging array lists from the parser engine concurrently
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
      // Clear selection filters, return wires to standard operational state
      set({
        edges: edges.map(e => ({ ...e, style: { stroke: '#38bdf8', strokeWidth: 2 }, animated: true }))
      });
      return;
    }

    // Dynamic Isolation Layer: Brighten connected flows, dim unrelated paths
    set({
      edges: edges.map(edge => {
        const involvesIED = edge.source === iedId || edge.target === iedId;
        return {
          ...edge,
          animated: involvesIED,
          style: involvesIED 
            ? { stroke: '#f43f5e', strokeWidth: 3.5 } // Highlight dependencies during error review (Rose)
            : { stroke: '#475569', opacity: 0.15, strokeWidth: 1 } // Dimmed background links
        };
      })
    });
  },

  jumpToLine: async (xpath) => {
    const { currentFilename } = get();
    try {
      // Phase 3 Key Dependency: Pointing toward our indexed document cache destination
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
        // Reset full local frontend state variables to fresh baselines
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