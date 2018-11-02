% Suffix Array Contains

<div class="no-stretch">
|           |                 |
|-----------|-----------------|
| __Time__  | $m\cdot\log{n}$ |
| __Space__ | $1$             |
</div>

## Data Structures
| Name     | Type     | Initial Value            |
|:--------:|:--------:|:------------------------:|
| `suffix` | `int[]`  | suffixArr(str)           |
| `str`    | `string` | input string (length n)  |
| `target` | `string` | target string (length m) |

## Algorithm
```java
int low = 0;
int high = n - 1;
while(low < high) {
	int mid = (low + high) / 2;
	if(str.substring(suffix[mid]).startsWith(target)) {
		return true;
	}
	if(str.substring(suffix[mid]).compareTo(part) > 0) {
		hi = mid;
	} else {
		low = mid + 1;
	}
}
return false;
```

## Results
- Returns `true` iff `target` is contained in `str`.
