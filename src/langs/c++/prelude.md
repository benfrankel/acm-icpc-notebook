% C++ Prelude

```c++
#include <bits/stdc++.h>
using namespace std;

#define DEBUG 1
#define dbg(x) (DEBUG ? _d((#x), (x)) : (x))
#define mod(x, m) ((((x) % (m)) + (m)) % (m))
#define _f (k ? '\n' + string(f, ' ') : "")

template <class T> auto _s(T x,...) -> decltype(to_string(x)) { return to_string(x); }
string _s(char x,...) { return string("'") + x + "'"; }
string _s(string x,...) { return '"' + x + '"'; }

template <class P, class Q> string _s(pair<P, Q> x, int f=0, int k=0) {
    return _f + '(' + _s(x.first) + ", " + _s(x.second) + ')';
}

template <class T> auto _s(T x, int f=0, int k=0) -> decltype(end(x), string()) {
    string s; int i = 0; auto b = begin(x), e = end(x);
    while (b != e) s += _s(*b++, f+1, i++), s += (b == e ? "" : ", ");
    return _f + '[' + s + ']';
}

template <class T> T& _d(string s, T&& x) {
    cout << s + " = " + _s(x, s.size() + 3) + '\n'; return x;
}

typedef vector<int> vi;
typedef pair<int, int> ii;
typedef int64_t i64;
typedef uint64_t u64;

const double eps = 1e-9;
const double pi = 2 * acos(0);
const double dinf = 1 / 0.0;
const int inf = numeric_limits<int>::max() >> 2;
const long linf = numeric_limits<i64>::max() >> 2;
```
