% Topological Sort

<div class="no-stretch">
|           |             |
|-----------|-------------|
| __Time__  | $|V| + |E|$ |
| __Space__ | $|V|$       |
</div>

## Data Structures
| Name        | Type            | Initial Value |
|:-----------:|:---------------:|:-------------:|
| `sorted`    | `Set<Vertex>`   | `{}`          |
| `topo`      | `List<Vertex>`  | `[]`          |

## Algorithm
```c++
for (Vertex start : V) {
    if (sorted.has(start)) continue;
    
    Set<Vertex> visited = {};
    Stack<Vertex> backtrack = [start];
    
    while (!backtrack.empty()) {
        Vertex u = backtrack.top();
        visited.add(u);
        
        bool follow = false;
        for (Vertex v : E[u]) {
            if (sorted.has(v)) continue;
            if (visited.has(v)) return false; // Cycle detected
            
            backtrack.push(v);
            follow = true;
            break;
        }
        if (follow) continue;
        
        sorted.add(u);
        topo.push(u);
        backtrack.pop();
    }
}

return true;
```

## Results
- `i < j` implies there is no path from `topo[i]` to `topo[j]` (reverse topological order).

## Notes
- Impossible with cycles (detected).
