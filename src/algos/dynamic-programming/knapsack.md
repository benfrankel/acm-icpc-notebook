% Knapsack

Given $0 \le\!W$, $[1 \le v_1, \dots, v_N]$, and $[1 \le w_1, \dots, w_N]$, maximize $\sum v_i x_i$ with $\sum w_i x_i \le W$.

## 0/1 Knapsack

When $0 \le x_i \le 1$.

<div class="no-stretch">
|           |                                     |
|-----------|-------------------------------------|
| __Time__  | $O(NW)$                             |
| __Space__ | $O(W)$ (store $\mathrm{dp}[n - 1]$) |
</div>

Let $\mathrm{dp}[n][w]$ be the solution when $W\!= w$ and $N = n$.

- $\mathrm{dp}[0][w] = 0$
- $\mathrm{dp}[n][w] = \max\left(\mathrm{dp}[n - 1][w],\, \max\limits_{1\le i\le N}\left\{\mathrm{dp}[n - 1][w - w_i] + v_i : w\ge w_i\right\}\right)$

## Bounded Knapsack

When $0 \le x_i \le k$.

<div class="no-stretch">
|           |                                                          |
|-----------|----------------------------------------------------------|
| __Time__  | $O(kNW)$                                                 |
| __Space__ | $O(W)$ (store $\mathrm{dp}[n - 1]$) |
</div>

Solve the 0/1 knapsack problem where each $v_i$, $w_i$ implicitly appears $k$ times ($N' = kN$).

## Unbounded Knapsack

When $0 \le x_i < \infty$.

<div class="no-stretch">
|           |         |
|-----------|---------|
| __Time__  | $O(NW)$ |
| __Space__ | $O(W)$  |
</div>

Let $\mathrm{dp}[w]$ be the solution when $W\!\!= w$.

- $\mathrm{dp}[0] = 0$
- $\mathrm{dp}[w] = \max\limits_{1\le i\le N}\left\{\mathrm{dp}[w - w_i] + v_i : w\ge w_i\right\}$

## Notes
- Divide $w_1, \dots, w_n, W$ by their GCD to improve complexity in some cases.
