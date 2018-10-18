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
| `front` | `Queue<Vertex>` | `[start]`     |
| `seen`  | `Set<Vertex>`   | `{start}`     |

## Algorithm
```c++
while (!front.empty()) {
    Vertex u = front.top();
    front.pop();
    
    // Visit u
    
    for (Vertex v : E[u]) {
        if (seen.has(v)) continue;
        seen.add(v);
        
        // See u -> v
        
        front.push(v);
    }
}
```

## Results
- `seen` is the set of vertices connected to `start`.
