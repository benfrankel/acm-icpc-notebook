% Dijkstra's Algorithm

<div class="no-stretch">
|         |                        |
|---------|------------------------|
|__Time__ | $(|E| + |V|)\log{|V|}$ |
|__Space__| $|V|^2$                |
</div>

## Data Structures
| Name      | Type                                | Initial Value        |
|:---------:|:-----------------------------------:|:--------------------:|
| `visited` | `Set<Vertex>`                       | `{}`                 |
| `front`   | `PriorityQueue<(Distance, Vertex)>` | `[(0, start)]`       |
| `dist`    | `Map<Vertex, Distance>`             | `{_: INF, start: 0}` |

## Algorithm
```c++
while (!front.empty()) {
    (Distance d, Vertex v) = front.top();
    front.pop();
    
    if (visited[v]) continue;
    
    // Visit v
    
    for ((Vertex u, Weight w) : adj[v]) {
        if (!visited[u]) {
            // Relax v -> u
        
            Distance n = d + w;
            if (dist[u] > n) {
                dist[u] = n;
                front.push((n, u));
            }
        }
    }
}
```

## Result
`dist[v]` contains the distance from `start` to `v`, or `INF` if not connected.
