% DFS

<div class="no-stretch">
|           |             |
|-----------|-------------|
| __Time__  | $|V| + |E|$ |
| __Space__ | $|V|$       |
</div>

## Data Structures

| Name      | Type            | Initial Value |
|:---------:|:---------------:|:-------------:|
| `back`    | `Stack<Vertex>` | `[start]`     |
| `visited` | `Set<Vertex>`   | `{}`          |

## Algorithm

```c++
while (!back.empty()) {
    Vertex u = back.top();
    
    if (!visited.has(u)) {
        visited.add(u);
        
        // Start visiting u
    } else {
        // Backtrack to u
    }
    
    bool follow = false;
    for (Vertex v : E[u]) {
        if (visited.has(v)) continue;
        
        // Follow u → v
        
        back.push(v);
        follow = true;
        break;
    }
    if (follow) continue;
    
    // Finish visiting u
    
    back.pop();
}
```

## Results

- `visited` is the set of vertices connected to `start`.
