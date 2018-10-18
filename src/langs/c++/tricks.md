% C++ Tricks

- `set` is better than `priority_queue` for Prim's and Dijkstra's:

|           | `set<T>`             | `priority_queue<T, vector<T>, greater<T>>` |
|-----------|----------------------|--------------------------------------------|
|__Insert__ | `q.insert(x)`        | `q.push(x)`                                |
|__Top__    | `*q.begin()`         | `q.top()`                                  |
|__Pop__    | `q.erase(q.begin())` | `q.pop()`                                  |
|__Delete__ | `q.erase(q.find(x))` | N/A                                        |
