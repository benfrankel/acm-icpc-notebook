% Dinitz's Algorithm

<div class="no-stretch">
|         |                   |
|---------|-------------------|
|__Time__ | ${|V|}^2\cdot|E|$ |
|__Space__| $|V|$             |
</div>

## Data Structures
| Name       | Type                                 | Initial Value      |
|:----------:|:------------------------------------:|:------------------:|
| `residual` | `Map<Vertex, Map<Vertex, Capacity>>` | `G + E{v: {u: 0}}` |

## Algorithm
```c++
Flow flow = 0;
for (;;) {
    // LevelBFS skips (u → v) where residual[u][v] == 0 and stops at sink
    // Returns a DAG of edges seen from each vertex traversed
    Map<Vertex, Stack<Vertex>> layered;
    if (!LevelBFS(residual, source, sink, &layered)) break;
    
    for (;;) {
        // PathDFS pops edges when it backtracks and stops at sink
        Map<Vertex, Vertex> prev;
        if (!PathDFS(layered, source, sink, &prev)) break;
        
        // Get the bottleneck capacity of the augmenting path
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
            
            if (residual[u][v] == 0) layered[u].pop();
        }
        
        flow += cap;
    }
}
```

## Results
- `flow` is the maximum flow from `source` to `sink`.
- `residual[v][u]` is the flow through `u → v` in **some** maximum flow.

## Notes
- Fails on graphs with self-loops, parallel edges, and bidirectional edges.
- Can be fixed for those graphs by defining `struct Edge { Vertex v, Capacity, Flow, Edge *rev }`.
