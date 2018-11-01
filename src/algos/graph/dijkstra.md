% Dijkstra's Algorithm

<div class="no-stretch">
|         |                        |
|---------|------------------------|
|__Time__ | $(|E| + |V|)\log{|V|}$ |
|__Space__| ${|V|}^2$              |
</div>

## Data Structures
| Name      | Type                                | Initial Value  |
|:---------:|:-----------------------------------:|:--------------:|
| `front`   | `PriorityQueue<(Distance, Vertex)>` | `[(0, start)]` |
| `visited` | `Set<Vertex>`                       | `{}`           |
| `prev?`   | `Map<Vertex, Vertex>`               | `{}`           |
| `dist`    | `Map<Vertex, Distance>`             | `{start: 0}`   |

## Algorithm
```c++
while (!front.empty()) {
    (Distance d, Vertex u) = front.top();
    front.pop();
    
    if (visited.has(u)) continue;
    visited.add(u);
    
    // Visit u
    
    for ((Vertex v, Weight w) : E[u]) {
        Distance r = d + w;
        if (!dist.has(v) || dist[v] > r) {
            dist[v] = r;
            prev[v] = u;
            
            // Relax u → v
            
            front.push((r, v));
        }
    }
}
```

## Results
- `dist[v]` is the distance from `start` to `v` (if they are connected).
- `prev[v]` is the penultimate vertex on **some** shortest path from `start` to `v` (if they are connected).

## Notes
- Fails on graphs with negative edges (use Bellman-Ford).
