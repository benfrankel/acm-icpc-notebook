% Circle

```c++
struct Circle {
    Point o; double r;
    
    Circle(Point o, double r): o(o), r(r) {}
}

// Circle
string _s(Circle c) { return _s(make_pair(c.o, c.r)); }
double area(Circle c) { return pi * c.r * c.r; }
double circum(Circle c) { return 2 * pi * c.r; }

// Point, Circle
double sdist(Point p, Circle c) { return dist(c.o, p) - c.r; }
_orient(Point, Circle)
Point project(Point p, Circle c) { return c.o + unit(p - c.o) * c.r; }

// Line, Circle
double sdist(Line l, Circle c) { return dist(c.o, l) - c.r; }
_orient(Line, Circle)
void intersect(Line l, Circle c, Point &p, Point &q) {
    Point m = project(c.o, l);
    Point v = tangent(l) * sqrt(c.r * c.r - norm(m - c.o));
    p = m + v; q = m - v;
}

// Circle, Circle
double sdist(Circle c, Circle d) { return dist(c.o, d.o) - c.r - d.r; }
int side(Circle c, Circle d) {
    double s = sdist(c, d);
    return (s > c.r + d.r + eps) - (s < abs(c.r - d.r) - eps);
}
bool extangent(Circle c, Circle d) { return sdist(c, d) == 0; }
bool intangent(Circle c, Circle d) { return sdist(c, d) == abs(c.r - d.r); }
bool incident(Circle c, Circle d) { return intangent(c, d) || extangent(c, d); }
bool concentric(Circle c, Circle d) { return eq(c.o, d.o); }
bool eq(circle c, Circle d) { return concentric(c, d) && abs(c.r - d.r) < eps; }
void intersect(Circle c, Circle d, Point &p, Point &q) {
    Point u = c.o - d.o, v = c.o + d.o;
    intersect(Line(2 * u.x, 2 * u.y, c.r * c.r - d.r * d.r - dot(u, v)), d, p, q);
}
```

## Notes
- A point is inside a circle when `side(p, c) == -1`.
- A line intersects a circle when `side(l, c) <= 0` (in two points when `side(l, c) == -1`).
- A line is tangent to a circle when `incident(l, c)` (at `project(c.o, l)`).
- Two circles intersect when `side(c, d) == 0`, one contains the other when `-1`, otherwise `1`.
- Two circles are tangent when `incident(c, d)` (at `project(c.o, d)`).
