% BFS

<div class="no-stretch">
|         |             |
|---------|-------------|
|__Time__ | $|V| + |E|$ |
|__Space__| $|V|$       |
</div>

## Data Structures
| Name    | Type                  | Initial Value |
|:-------:|:---------------------:|:-------------:|
| `front` | `Queue<Vertex>`       | `[start]`     |
| `seen`  | `Set<Vertex>`         | `{start}`     |
| `prev?` | `Map<Vertex, Vertex>` | `{}`          |

## Algorithm
```c++
while (!front.empty()) {
    Vertex u = front.top();
    front.pop();
    
    // Visit u
    
    for (Vertex v : E[u]) {
        if (seen.has(v)) continue;
        seen.add(v);
        prev[v] = u;
        
        // See u → v
        
        front.push(v);
    }
}
```

## Results
- `seen` is the set of vertices connected to start.
- `prev[v]` is the penultimate vertex on **some** shortest path from `start` to `v` (if they are connected).

## Notes
- `seen` may be redundant if `prev` is used.
- Finds shortest paths by number of edges (not weight).
