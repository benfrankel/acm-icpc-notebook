% Edmonds-Karp algorithm

<div class="no-stretch">
|         |                   |
|---------|-------------------|
|__Time__ | $|V|\cdot{|E|}^2$ |
|__Space__| $|V|$             |
</div>

## Data Structures
| Name       | Type                                 | Initial Value      |
|:----------:|:------------------------------------:|:------------------:|
| `adjusted` | `Map<Vertex, Map<Vertex, Capacity>>` | `G + E{v: {u: 0}}` |
| `flow`     | `Flow`                               | `0`                |

## Algorithm
```c++
for (;;) {
    // Find an augmenting path
    // FlowBFS skips (u → v) when adjusted[u][v] == 0
    Map<Vertex, Vertex> prev = FlowBFS(adjusted, source);
    
    if (!prev.has(sink)) break;
    
    // Find the capacity of the augmenting path
    Capacity cap = INF;
    for (Vertex v = sink, u = prev[v]; u != v; v = u, u = prev[v]) {
        cap = min(cap, adjusted[u][v] - adjusted[v][u]);
    }
    
    // Send flow down the augmenting path
    for (Vertex v = sink, u = prev[v]; u != v; v = u, u = prev[v]) {
        adjusted[u][v] -= cap;
        adjusted[v][u] += cap;
    }
    
    flow += cap;
}
```

## Results
- `flow` is the maximum flow from `source` to `sink`.
- `adjusted[v][u]` is the flow through `u → v` in **some** maximum flow.

## Notes
- Fails on graphs with self-loops, parallel edges, and bidirectional edges.
- Can be fixed for those graphs by defining `struct Edge { Vertex v, Capacity, Flow, Edge *rev }`.
