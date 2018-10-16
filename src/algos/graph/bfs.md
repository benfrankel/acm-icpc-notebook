% BFS

<div class="no-stretch">
|         |             |
|---------|-------------|
|__Time__ | $|V| + |E|$ |
|__Space__| $|V|$       |
</div>

## Data Structures
| Name    | Type            | Initial Value |
|:-------:|:---------------:|:-------------:|
| `seen`  | `Set<Vertex>`   | `{start}`     |
| `front` | `Queue<Vertex>` | `[start]`     |

## Algorithm
```c++
while (!front.empty()) {
    Vertex v = front.top();
    front.pop();
    
    // Visit v
    
    for (Vertex u : adj[v]) {
        if (!seen[u]) {
            seen.add(u);
            front.push(u);
            
            // See v -> u
        }
    }
}
```

## Result
`seen[v]` is `true` when `v` is reachable from `start`.
