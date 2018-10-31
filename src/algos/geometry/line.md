% Line

```c++
#define _orient(u, v) \
double dist(u x, v y) { return abs(sdist(x, y)); } \
int side(u x, v y) { double s = sdist(x, y); return (s > eps) - (s < -eps); } \
bool incident(u x, v y) { return side(x, y) == 0; }

struct Line {
    double a, b, c;
    
    Line(double a, double b, double c): a(a), b(b), c(c) { normalize(); }
    Line(Point p, Point q): a(p.y - q.y), b(q.x - p.x), c(-a * p.x - b * p.y) { normalize(); }
    
    void normalize() {
        double z = sqrt(a * a + b * b);
        if (a < 0 && b < 0) z = -z;
        a /= z; b /= z; c /= z;
    }
};

/* Line */
string _s(Line m,...) { return '(' + _s(m.a) + "x + " + _s(m.b) + "y + " + _s(m.c) + " = 0)"; }
Point normal(Line m) { return Point(m.a, m.b); }
Point tangent(Line m) { return Point(m.b, -m.a); }

/* Point, Line */
double sdist(Point p, Line m) { return m.a * p.x + m.b * p.y + m.c; }
_orient(Point, Line)
Point project(Point p, Line m) { return p - normal(m) * sdist(p, m); }

/* Line, Line */
bool eq(Line m, Line n) { return eq(normal(m), normal(n)) && abs(m.c - n.c) < eps; }
double cross(Line m, Line n) { return cross(normal(m), normal(n)); }
double angle(Line m, Line n) { double a = angle(normal(m), normal(n)); return min(a, pi - a); }
bool parallel(Line m, Line n) { return abs(cross(m, n)) < eps; }
Point intersect(Line m, Line n) {
    return Point(m.b * n.c - m.c * n.b, m.c * n.a - m.a * n.c) / cross(m, n);
}
```
