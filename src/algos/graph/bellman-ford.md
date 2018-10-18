% Bellman-Ford

<div class="no-stretch">
|         |               |
|---------|---------------|
|__Time__ | $|V|\cdot|E|$ |
|__Space__| $|V|$         |
</div>

## Data Structures
| Name    | Type                    | Initial Value |
|:-------:|:-----------------------:|:-------------:|
| `prev?` | `Map<Vertex, Vertex>`   | `{}`          |
| `dist`  | `Map<Vertex, Distance>` | `{start: 0}`  |

## Algorithm
```c++
for (|V| - 1) {
    for ((Vertex u, Vertex v, Weight w) : E) {
        if (!dist.has(u)) continue;
        
        if (!dist.has(v) || dist[v] > dist[u] + w) {
            dist[v] = dist[u] + w;
            prev[v] = u;
            
            // Relax u -> v
        }
    }
}

// Extra iteration
for ((Vertex u, Vertex v, Weight w) : E) {
    if (dist.has(u) && dist[v] > dist[u] + w) {
        return false; // Negative cycle detected
    }
}

return true;
```

## Results
- `dist[v]` is the distance from `start` to `v` (if they are connected).
- `prev[v]` is the penultimate vertex on **some** shortest path from `start` to `v` (if they are connected).

## Notes
- The extra iteration will relax some vertex iff a negative cycle is reachable from `start`.
- `|V| - 1` extra iterations will relax `v` iff there is a negative cycle between `start` and `v`.
