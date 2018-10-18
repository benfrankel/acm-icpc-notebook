% Prim's Algorithm

<div class="no-stretch">
|         |                        |
|---------|------------------------|
|__Time__ | $(|E| + |V|)\log{|V|}$ |
|__Space__| $|V|^2$                |
</div>

## Data Structures
| Name      | Type                                  | Initial Value  |
|:---------:|:-------------------------------------:|:--------------:|
| `front`   | `PriorityQueue<(Weight, Vertex)>`     | `[(0, start)]` |
| `visited` | `Set<Vertex>`                         | `{}`           |
| `prev`    | `Map<Vertex, Vertex>`                 | `{}`           |
| `dist`    | `Map<Vertex, Weight>`                 | `{}`           |
| `tree`    | `Map<Vertex, List<(Weight, Vertex)>>` | `{}`           |

## Algorithm
```c++
while (!front.empty()) {
    (Weight w, Vertex u) = front.top();
    front.pop();
    
    if (visited.has(u)) continue;
    visited.add(u);
    
    // Visit u
    
    if (prev.has(u)) {
        tree[u].push((w, prev[u]));
        
        // Add edge prev[u] -> u
    }
    
    for ((Vertex v, Weight x) : E[u]) {
        if (!dist.has(v) || dist[v] > x) {
            dist[v] = x;
            prev[v] = u;
            
            // Relax u -> v
            
            front.push((x, v));
        }
    }
}
```

## Results
- `tree` is **some** MST of `start`'s connected component.
