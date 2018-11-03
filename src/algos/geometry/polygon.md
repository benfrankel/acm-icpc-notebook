% Polygon

```c++
struct Polygon {
    vector<Point> v;
    
    Polygon(vector<Point> u): v(u) { v.push_back(u[0]); }
};

// Polygon
bool convex(Polygon x) {
    bool d = ccw(x.v[1], x.v[0], x.v[x.size() - 1]);
    for (int i = 2; i < x.size(); ++i)
        if (d != ccw(x.v[i], x.v[i - 1], x.v[i - 2])) return false;
    return true;
}
double perim(Polygon x) {
    double p = 0;
    for (int i = 1; i < x.size(); ++i) p += dist(x.v[i], x.v[i - 1]);
    return p;
}
double area(Polygon x) {
    double a = 0;
    for (int i = 1; i < x.size(); ++i) a += cross(x.v[i], x.v[i - 1]);
    return abs(a) / 2;
}

// Point, Polygon
int side(Point p, Polygon x) {
    double s = 0;
    for (int i = 1; i < x.size(); ++i) {
        double a = angle(x.v[i] - p, x.v[i - 1] - p);
        if (abs(a - pi) < eps) return 0;
        s += a * (2 * ccw(x.v[i], p, x.v[i - 1]) - 1);
    }
    return 2 * (abs(abs(s) - 2 * pi) < eps) - 1;
}

// Line, Polygon
bool cut(Point a, Point b, Polygon x, Polygon &y) {
    vector<Point> p;
    for (int i = 0; i < x.size(); ++i) {
        double l1 = cross(b - a, x.v[i] - a), l2 = 0;
        if (i < x.size() - 1) left2 = cross(b - a, x.v[i + 1] - a);
        if (l1 > -eps) p.push_back(x.v[i]);
        if ((l1 < eps) != (l2 < eps)) p.push_back(intersect(x.v[i], x.v[i + 1], a, b));
    }
    if (p.size() <= 1) return false;
    if (eq(p.back(), p.front())) p.pop_back();
    y = Polygon(p);
    return true;
}
```

## Notes
- `convex` allows $180\degree$ angles.
- A point is inside a polygon when `side(p, x) == -1`, on an edge when `0`, outside when `1`.
