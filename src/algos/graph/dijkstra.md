% Dijkstra's Algorithm

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

## Complexity
|         |                     |
|---------|---------------------|
|__Time__ | $m + N\log{N}$ |
|__Space__| $n^2$ |
