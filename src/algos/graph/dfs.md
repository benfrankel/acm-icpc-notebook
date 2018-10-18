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
| `backtrack` | `Stack<Vertex>` | `[start]`     |
| `visited`   | `Set<Vertex>`   | `{}`          |

## Algorithm
```c++
while (!backtrack.empty()) {
    Vertex u = backtrack.top();
    
    if (!visited.has(u)) {
        visited.add(u);
        
        // Start visiting u
    } else {
        // Backtrack to u
    }
    
    bool follow = false;
    for (Vertex v : E[u]) {
        if (visited.has(v)) continue;
        
        // Follow u -> v
        
        backtrack.push(v);
        follow = true;
        break;
    }
    if (follow) continue;
    
    // Finish visiting u
    
    backtrack.pop();
}
```

## Results
- `visited` is the set of vertices connected to `start`.
