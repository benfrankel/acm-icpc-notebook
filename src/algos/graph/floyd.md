% Floyd-Warshall algorithm

## Data Structures
| Name      | Type                                | Initial Value                    |
|:---------:|:-----------------------------------:|:--------------------------------:|
| `dist`    | `Map<(Vertex, Vertex), Distance>`   | `{_: INF, (u, v): w, (v, v): 0}` |

## Algorithm
```c++
for (Vertex m : V) {
    for (Vertex u : V) {
        for (Vertex v : V) {
            dist[u][v] = min(dist[u][v], dist[u][m] + dist[m][v]);
        }
    }
}
```

## Result
`dist[u][v]` contains the distance from `u` to `v`, or `INF` if not connected.

## Complexity
|         |         |
|---------|---------|
|__Time__ | $|V|^3$ |
|__Space__| $|V|^2$ |
