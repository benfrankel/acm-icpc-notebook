% Johnson's Algorithm

<div class="no-stretch">
|         |                           |
|---------|---------------------------|
|__Time__ | $(|E| + |V|)|V|\log{|V|}$ |
|__Space__| $|V|^2$                   |
</div>

## Data Structures
| Name       | Type                                  | Initial Value        |
|:----------:|:-------------------------------------:|:--------------------:|
| `adjusted` | `Map<Vertex, List<(Weight, Vertex)>>` | `G + {q: [V(0, v)]}` |
| `prev?`    | `Map<Vertex, Map<Vertex, Vertex>>`    | `{}`                 |
| `dist`     | `Map<Vertex, Map<Vertex, Distance>>`  | `{}`                 |

## Algorithm
```c++
Map<Vertex, Distance> height = BellmanFord(adjusted, q);
adjusted.remove(q);

// Reweighting
for (Vertex u : V) {
    for ((Weight w, Vertex v) : adjusted[u]) {
        w += height[u] - height[v];
    }
}

// Repeated Dijkstra
for (Vertex v : V) {
    (dist[v], prev[v]) = Dijkstra(adjusted, v);
}
```

## Results
- `dist[u][v]` is the distance from `u` to `v` (if they are connected).
- `prev[u][v]` is the penultimate vertex on **some** shortest path from `u` to `v` (if they are connected).

## Notes
- Bellman-Ford & reweighting can be skipped for graphs with non-negative edges.
- Can detect negative cycles during Bellman-Ford.
