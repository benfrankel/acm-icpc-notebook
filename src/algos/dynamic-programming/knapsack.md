% Knapsack

Given $0 \le\!W$, $[1 \le v_1, \dots, v_N]$, and $[1 \le w_1, \dots, w_N]$, maximize $\sum\limits^N v_i x_i$ with $\sum\limits^N w_i x_i \le W$.

## 0/1 Knapsack

When $0 \le x_i \le 1$.

<div class="no-stretch">
|           |                                                          |
|-----------|----------------------------------------------------------|
| __Time__  | $O(NW)$                                                  |
| __Space__ | $O(W)$ (store $\mathrm{dp}[n]$ and $\mathrm{dp}[n - 1]$) |
</div>

### Solution

Let $\mathrm{dp}[n][w]$ be the solution when $W\!= w$ and $N = n$.

- $\mathrm{dp}[0][w] = 0$
- $\mathrm{dp}[n][w] = \max\left(\mathrm{dp}[n - 1][w],\, \mathrm{dp}[n - 1][w - w_i] + v_i\right)$ (for $w \ge w_i$)

## Bounded Knapsack

When $0 \le x_i \le k$.

<div class="no-stretch">
|           |                                                          |
|-----------|----------------------------------------------------------|
| __Time__  | $O(kNW)$                                                 |
| __Space__ | $O(W)$ (store $\mathrm{dp}[n]$ and $\mathrm{dp}[n - 1]$) |
</div>

### Solution

Solve the 0/1 knapsack problem where each $v_i$, $w_i$ implicitly appears $k$ times ($N' = kN$).

## Unbounded Knapsack

When $0 \le x_i < \infty$.

<div class="no-stretch">
|           |        |
|-----------|--------|
| __Time__  | $O(W)$ |
| __Space__ | $O(W)$ |
</div>

### Solution

Let $\mathrm{dp}[w]$ be the solution when $W\!\!= w$.

- $\mathrm{dp}[0] = 0$
- $\mathrm{dp}[w] = \max\limits_{1\le i\le N}\left\{\mathrm{dp}[w - w_i] + v_i\right\}$ (for $w \ge w_i$)