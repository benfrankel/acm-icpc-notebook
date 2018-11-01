% Traveling Salesman

Find a minimum-cost hamiltonian path or cycle in a complete graph.

## Held-Karp algorithm

<div class="no-stretch">
|           |                                                             |
|-----------|-------------------------------------------------------------|
| __Time__  | $2^nn^2$                                                    |
| __Space__ | $2^n\sqrt{n}$ (store $\mathrm{dp}[y][S]$ for $|S| = n - 1$) |
</div>

Let $\mathrm{dp}[y][S]$ be the minimum cost of a path from $0$ to $y$ through the intermediate vertices in $S$.

- $\mathrm{dp}[y][\varnothing] = W[0 → y]$
- $\mathrm{dp}[y][S] = \min\limits_{x\in S}\left\{\mathrm{dp}[x][S - \left\{x\right\}] + W[x → y]\right\}$

### Notes
- If $V \subseteq \left\{0, \dots, 63\right\}$, use an integer bitset for $S$.
- To reconstruct the hamiltonian path or cycle, track $\mathrm{prev}[y][S]$.
- For the hamiltonian cycle, compute $\min\limits_{x\in V}\left\{\mathrm{dp}[x][V - \left\{x\right\}] + W[x → 0]\right\}$.
