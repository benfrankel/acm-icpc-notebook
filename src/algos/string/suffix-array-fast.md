% Suffix Array (Fast)

<div class="no-stretch">
|         |                 |
|---------|-----------------|
|__Time__ | $O(n \log^2 n)$ |
|__Space__| $O(n)$          |
</div>

## Data Structures
| Name      | Type                              | Initial Value              |
|:---------:|:---------------------------------:|:--------------------------:|
| `suffix`  | `int[]`                           | `[0]*n`                    |
| `rank`    | `int[]`                           | `[0]*n`                    |
| `str`     | `string`                          | input                      |

## Algorithm
```java
int rank[str.length()];
int tempRank[str.length()];
int suffix[str.length()];

// initial configuration
for(int i = 0; i < n; i++) {
	rank[i] = str.charAt[i];
	suffix[i] = i;
}

// sort array log_2(n) times according to the first 1, 2, 4, ... characters of each suffix
for(int k = 1; k < n; k <<= 1) {
	// for each part, sort the array 2 times. First by the next k elements that have not been sorted, then stable sort the first k elements again
	sort(suffix, (a, b) -> Integer.compare(a + k < n ? rank[a + k] : 0, b + k < n ? rank[b + k] : 0));
	sort(suffix, (a, b) -> Integer.compare(rank[a], rank[b]));

	// reorder the ranks of the suffixes based on the order they are now sorted in
	int curRank = 0;
	tempRank[suffix[0]] = curRank;
	for(int i = 1; i < n; i++) {
		// only if two contiguous suffixes don't have the same rank pair, increase the rank
		if(!(rank[suffix[i]] == rank[suffix[i-1]] && rank[suffix[i]+k] == rank[suffix[i-1]+k])) {
			curRank++;
		}
		tempRank[suffix[i]] = curRank;
	}

	for(int i = 0; i < n; i++) {
		rank[i] = tempRank[i];
	}

	if(rank[n-1] == n-1) {
		// all ranks unique, sort done early
		break;
	}
}

return suffix;
```

## Results
- `arr[i]` is the starting index of `i`th lexicographical suffix of `str`. Because they are sorted in lexicographical order, suffixes that share common starting runs will be stored in contiguous blocks of the array.

## Notes
- This will only work for single strings. If a suffix data structure is needed for multiple strings, look into an actuall tree structure
- This fast method can be used for strings up to 10,000 - 100,000 chars. If more speed is needed, implement a radix sort.
- A special character, ussualy `$` should be appended to the string to help this construction.
