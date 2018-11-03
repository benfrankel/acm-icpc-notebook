% Point

```c++
#define _sca(op) \
Point &operator op##=(double t) { x op##= t; y op##= t; return *this; } \
Point operator op(double t) { return Point(*this) op##= t; }

#define _vec(op) \
Point &operator op##=(Point p) { x op##= p.x; y op##= p.y; return *this; } \
Point operator op(Point p) { return Point(*this) op##= p; }

struct Point {
    double x, y;
    
    Point(double x, double y): x(x), y(y) {}
    
    Point operator-() { return Point(-x, -y); }
    
    _vec(+)
    _vec(-)
    _sca(*)
    _sca(/)
};

string _s(Point p,...) { return _s(make_pair(p.x, p.y)); }
Point operator*(double t, Point p) { return p * t; }
Point perp(Point p) { return Point(p.y, -p.x); }
double angle(Point p) { return atan2(p.y, p.x); }

// Dot product
double dot(Point p, Point q) { return p.x * q.x + p.y * q.y; }
double norm(Point p) { return dot(p, p); }
double abs(Point p) { return sqrt(norm(p)); }
double dist(Point p, Point q) { return abs(p - q); }
Point unit(Point p) { return p / abs(p); }
bool eq(Point p, Point q) { return dist(p, q) < eps; }
double proj(Point p, Point q) { return dot(p, q) / abs(q); }
Point project(Point p, Point q) { return dot(p, q) / norm(q) * q; }
double angle(Point p, Point q) { return acos(proj(p, q) / abs(q)); }

// Cross product
double cross(Point p, Point q) { return p.x * q.y - p.y * q.x; }
double pgram(Point p, Point q) { return abs(cross(p, q)); }
double triangle(Point p, Point q) { return pgram(p, q) / 2; }
bool ccw(Point p, Point q, Point r) { return cross(q - p, r - p) >= eps; }
bool collinear(Point p, Point q, Point r) { return abs(cross(q - p, r - p)) < eps; }
```
