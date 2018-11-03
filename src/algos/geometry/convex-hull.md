% Convex Hull

## Graham's Scan

<div class="no-stretch">
|           |                 |
|-----------|-----------------|
| __Time__  | $n\cdot\log{n}$ |
| __Space__ | $n$             |
</div>

### Data Structures

| Name   | Type          | Initial Value |
|:------:|:-------------:|:-------------:|
| `hull` | `List<Point>` | `[]`          |

### Algorithm

```c++
Point pivot;
bool anglecmp(Point p, Point q) {
    if (collinear(p, q, pivot)) return dist(p, pivot) - dist(q, pivot) < eps;
    return angle(p - pivot) - angle(q - pivot) < eps;
}

// Find lowest point (leftmost as tiebreaker)
pivot = min(points);

// Sort points by angle from pivot
sort(points, anglecmp);

hull.push(points[points.size() - 1]);
hull.push(points[0]);
hull.push(points[1]);
for (int i = 2, j = 2; i < points.size(); ) {
    int j = hull.size() - 1;
    if (ccw(hull[j - 1], hull[j], points[i])) {
        // Greedily add point to hull
        hull.push(points[i++]);
    }
    else {
        // Delete internal point
        hull.pop();
    }
}
```

### Results

- `hull` is the convex hull of `points`.

### Notes
- Handle 3 or fewer points as an edge case.
