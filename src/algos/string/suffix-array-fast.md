% Suffix Array (Fast)

<div class="no-stretch">
|           |                   |
|-----------|-------------------|
| __Time__  | $n\cdot\log^2{n}$ |
| __Space__ | $n$               |
</div>

## Data Structures

| Name     | Type            | Initial Value                             |
|:--------:|:---------------:|:-----------------------------------------:|
| `suffix` | `List<Integer>` | `[0, ..., n - 1]`                         |
| `rank`   | `List<Integer>` | `[str.charAt[0], ..., str.charAt[n - 1]]` |
| `str`    | `String`        | input (length n)                          |

## Algorithm

```java
// Sort array log_2(n) times according to the first 1, 2, 4, ... characters of each suffix
int tempRank[n];
for(int k = 1; k < n; k <<= 1) {
	// For each part, sort the array 2 times: First by the next k elements that have not been sorted, then stable sort the first k elements again
	sort(suffix, (a, b) -> Integer.compare(a + k < n ? rank[a + k] : 0, b + k < n ? rank[b + k] : 0));
	sort(suffix, (a, b) -> Integer.compare(rank[a], rank[b]));

	// Reorder the ranks of the suffixes based on the order they are now sorted in
	int curRank = 0;
	tempRank[suffix[0]] = curRank;
	for(int i = 1; i < n; i++) {
		// Only if two contiguous suffixes don't have the same rank pair, increase the rank
		if(rank[suffix[i]] != rank[suffix[i-1]] || rank[suffix[i]+k] != rank[suffix[i-1]+k]) {
			curRank++;
		}
		tempRank[suffix[i]] = curRank;
	}

	for(int i = 0; i < n; i++) rank[i] = tempRank[i];

    // All ranks unique, so sort is done early
	if(rank[n-1] == n-1) break;
}
```

## Results
- `suffix[i]` is the starting index of the `i`th lexicographical suffix of `str`. Suffixes that share common starting runs will be stored in contiguous blocks of the array.

## Notes
- Only works for single strings. For multiple strings, look into an actual tree structure.
- This is fast enough for $n \le 100,000$. If more speed is needed, implement a radix sort.
- A special character (often `$`) should be appended to the string to help this construction.
