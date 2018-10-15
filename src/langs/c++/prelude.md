% C++ Prelude

```c++
#include <bits/stdc++.h>
using namespace std;
#define DEBUG 1
#define dbg(x) (DEBUG ? _show((#x), (x)) : (x))
#define mod(x, m) ((((x) % (m)) + (m)) % (m))
template <class T> typename
enable_if<!is_compound<typename remove_reference<T>::type>::value, string>::type _str(T& x)
{ return to_string(x); }
template <class T> typename
enable_if< is_compound<typename remove_reference<T>::type>::value, string>::type _str(T& x) {
    stringstream s;
    auto b = begin(x), e = end(x);
    while (b != e) s << _str(*b++) << (b != e ? ", " : "");
    return '[' + s.str() + ']'; }
template <> string _str(string& x) { return '"' + x + '"'; }
template <class T> T& _show(string s, T&& x) {
    cout << s << " = " << _str(x) << '\n';
    return x; }
typedef pair<int, int> ii;
typedef int64_t i64;
typedef uint64_t u64;
const double pi = 2 * acos(0.0);
const double dinf = 1.0 / 0.0;
const int inf = numeric_limits<int>::max() >> 2;
const long linf = numeric_limits<i64>::max() >> 2;
```
