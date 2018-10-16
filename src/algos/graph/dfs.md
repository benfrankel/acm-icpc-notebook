% DFS

<div class="no-stretch">
|         |             |
|---------|-------------|
|__Time__ | $|V| + |E|$ |
|__Space__| $|V|$       |
</div>

## Data Structures
| Name        | Type            | Initial Value |
|:-----------:|:---------------:|:-------------:|
| `visited`   | `Set<Vertex>`   | `{}`          |
| `backtrack` | `Stack<Vertex>` | `[start]`     |

## Algorithm
```c++
forward:
while (!backtrack.empty()) {
    Vertex v = backtrack.top();
    
    if (!visited[v]) {
        visited.add(v);
        
        // Start visiting v
    } else {
        // Backtrack to v
    }
    
    for (Vertex u : adj[v]) {
        if (!visited[u]) {
            // Follow v -> u
            
            backtrack.push(u);
            continue forward;
        }
    }
    
    // Finish visiting v
    
    backtrack.pop();
}
```

## Result
`visited[v]` is `true` when `v` is reachable from `start`.
