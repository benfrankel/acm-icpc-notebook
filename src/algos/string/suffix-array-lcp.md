% Suffix Array Longest Common Prefix

<div class="no-stretch">
|           |     |
|-----------|-----|
| __Time__  | $n$ |
| __Space__ | $n$ |
</div>

## Data Structures
| Name     | Type     | Initial Value           |
|:--------:|:--------:|:-----------------------:|
| `suffix` | `int[]`  | suffixArr(str)          |
| `str`    | `string` | input string (length n) |

## Algorithm
```java
// phi contains the index of the next shortest suffix in the array
int phi[n];
phi[suffix[0]] = -1;
for(int i = 1; i < n; i++) {
	phi[suffix[i]] = suffix[i-1];
}

int plcp[n]; // Permuted least common prefix
int len = 0;
for(int i = 0; i < n; i++) {
	if(phi[i] == -1) {
		plcp[i] = 0;
		continue;
	}

	// Compute length of common prefix between adjacent suffixes
	while(str.charAt(i + len) == str.charAt(phi[i] + len)) len++;
	plcp[i] = len;
	len = max(0, len - 1);

	int lcp[n];
	for(int i = 0; i < n; i++) lcp[i] = plcp[suffix[i]];

	int longest = 0;
	int index = 0;
	for(int i = 0; i < n; i++) {
		if(lcp[i] > longest) {
			longest = lcp[i];
			index = i;
		}
	}

	return str.substring(suffix[index], suffix[index] + longest);
}
```

## Results
- Returns the longest prefix between any two suffixes in `str`. This is also the longest repeated substring.
