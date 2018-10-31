% Circle

```c++
struct Circle {
    Point o; double r;
    
    Circle(Point o, double r): o(o), r(r) {}
}

/* Circle */
string _s(Circle c) { return _s(make_pair(c.o, c.r)); }
double area(Circle c) { return pi * c.r * c.r; }
double circum(Circle c) { return 2 * pi * c.r; }

/* Point, Circle */
double sdist(Point p, Circle c) { return dist(c.o, p) - r; }
_orient(Point, Circle)
Point project(Point p, Circle c) { return c.o + unit(p - c.o) * r; }

/* Line, Circle */
double sdist(Line l, Circle c) { return dist(c.o, l) - r; }
_orient(Line, Circle)
void intersect(Line l, Circle c, Point &p, Point &q) {
    Point m = project(c.o, l);
    Point v = tangent(l) * sqrt(c.r * c.r - norm(m - c.o));
    p = m + v;
    q = m - v;
}
```

## Notes
- A point is inside a circle when `side(p, c) == -1`.
- A line intersects a circle when `side(l, c) <= 0` (in two points when `side(l, c) == -1`).
- A line is tangent to a circle when `incident(l, c)` (at `project(c.o, l)`).
