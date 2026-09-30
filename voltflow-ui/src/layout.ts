import type { ELK as ElkEngine, ElkNode } from 'elkjs/lib/elk-api';

// ELK is large; load it on first layout so it stays out of the initial bundle.
let elkPromise: Promise<ElkEngine> | null = null;
function getElk(): Promise<ElkEngine> {
  elkPromise ??= import('elkjs/lib/elk.bundled.js').then(({ default: ELK }) => new ELK());
  return elkPromise;
}

// Matches the rendered size of React Flow's default node closely enough for spacing.
export const NODE_WIDTH = 170;
export const NODE_HEIGHT = 44;

/**
 * Layered top-to-bottom layout: publishers above their subscribers, which matches the default node
 * handles (source at the bottom, target at the top). Self-edges (orphan/unresolved stubs) are not
 * passed to ELK; the generous layer spacing leaves room for them.
 */
export async function layoutGraph(
  nodeIds: string[],
  links: { source: string; target: string }[],
): Promise<Record<string, { x: number; y: number }>> {
  const seen = new Set<string>();
  const edges = links
    .filter(l => l.source !== l.target)
    .filter(l => {
      const key = `${l.source}->${l.target}`;
      if (seen.has(key)) return false;
      seen.add(key);
      return true;
    })
    .map((l, i) => ({ id: `l${i}`, sources: [l.source], targets: [l.target] }));

  const graph: ElkNode = {
    id: 'root',
    layoutOptions: {
      'elk.algorithm': 'layered',
      'elk.direction': 'DOWN',
      'elk.spacing.nodeNode': '140',
      'elk.layered.spacing.nodeNodeBetweenLayers': '180',
      'elk.spacing.componentComponent': '160',
      'elk.layered.nodePlacement.strategy': 'BRANDES_KOEPF',
    },
    children: nodeIds.map(id => ({ id, width: NODE_WIDTH, height: NODE_HEIGHT })),
    edges,
  };

  const result = await (await getElk()).layout(graph);
  return Object.fromEntries((result.children ?? []).map(c => [c.id, { x: c.x ?? 0, y: c.y ?? 0 }]));
}
