% Floyd-Warshall

<div class="no-stretch">
|         |           |
|---------|-----------|
|__Time__ | ${|V|}^3$ |
|__Space__| ${|V|}^2$ |
</div>

## Data Structures
| Name    | Type                              | Initial Value              |
|:-------:|:---------------------------------:|:--------------------------:|
| `next?` | `Map<(Vertex, Vertex), Vertex>`   | `{E(u, v): v}`             |
| `dist`  | `Map<(Vertex, Vertex), Distance>` | `{E(u, v): w, V(v, v): 0}` |

## Algorithm
```c++
for (Vertex m : V) {
    for (Vertex u : V) {
        for (Vertex v : V) {
            if (!dist.has((u, m)) || !dist.has((m, v))) continue;
            
            if (dist[u, v] > dist[u, m] + dist[m, v]) {
                dist[u, v] = dist[u, m] + dist[m, v];
                next[u, v] = next[u, m];
                
                // Relax u → v through m
            }
        }
    }
}

for (Vertex v : V) {
    if (dist[v, v] < 0) {
        return false; // Negative cycle detected
    }
}

return true;
```

## Results
- `dist[u, v]` is the distance from `u` to `v` (if they are connected).
- `next[u, v]` is the second vertex on **some** shortest path from `u` to `v` (if they are connected and distinct).

## Notes
- Johnson's Algorithm is faster for sparse graphs.
- Fails on negative cycles (detected).
