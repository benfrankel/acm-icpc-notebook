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
| `parent`  | `Map<Vertex, Vertex>`                 | `{}`           |
| `cost`    | `Map<Vertex, Weight>`                 | `{}`           |
| `tree`    | `Map<Vertex, List<(Weight, Vertex)>>` | `{}`           |

## Algorithm
```c++
while (!front.empty()) {
    (Weight w, Vertex u) = front.top();
    front.pop();
    
    if (visited.has(u)) continue;
    visited.add(u);
    
    // Visit u
    
    if (parent.has(u)) {
        tree[u].push((w, parent[u]));
        tree[parent[u]].push((w, u));
        
        // Connect parent[u] to u
    }
    
    for ((Vertex v, Weight x) : E[u]) {
        if (!cost.has(v) || cost[v] > x) {
            cost[v] = x;
            parent[v] = u;
            
            // Relax u → v
            
            front.push((x, v));
        }
    }
}
```

## Results
- `tree` is **some** MST of `start`'s connected component.

## Notes
- Fails on directed graphs.
