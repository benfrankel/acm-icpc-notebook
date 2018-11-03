% Edmonds-Karp

<div class="no-stretch">
|           |                   |
|-----------|-------------------|
| __Time__  | $|V|\cdot{|E|}^2$ |
| __Space__ | $|V|$             |
</div>

## Data Structures
| Name       | Type                                 | Initial Value      |
|:----------:|:------------------------------------:|:------------------:|
| `residual` | `Map<Vertex, Map<Vertex, Capacity>>` | `G + E{v: {u: 0}}` |

## Algorithm
```c++
Flow flow = 0;
for (;;) {
    // Find an augmenting path
    // PathBFS skips (u → v) where residual[u][v] == 0 (and stops at sink)
    Map<Vertex, Vertex> prev;
    if (!PathBFS(residual, source, sink, &prev) break;
    
    // Find the bottleneck capacity of the augmenting path
    Capacity cap = INF;
    for (Vertex v = sink, u = v; prev.has(u); v = u) {
        u = prev[u];
        cap = min(cap, residual[u][v]);
    }
    
    // Send flow down the augmenting path
    for (Vertex v = sink, u = v; prev.has(u); v = u) {
        u = prev[u];
        residual[u][v] -= cap;
        residual[v][u] += cap;
    }
    
    flow += cap;
}
```

## Results
- `flow` is the maximum flow from `source` to `sink`.
- `residual[v][u]` is the flow through `u → v` in **some** maximum flow.

## Notes
- Fails on graphs with self-loops, parallel edges, and bidirectional edges.
- Can be fixed for those graphs by defining `struct Edge { Vertex to, Capacity, Flow, Edge *rev }`.
