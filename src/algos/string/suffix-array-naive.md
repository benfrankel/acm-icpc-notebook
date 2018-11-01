% Suffix Array (Naive)

<div class="no-stretch">
|         |                |
|---------|----------------|
|__Time__ | $n^2 \log n$   |
|__Space__| $n$            |
</div>

## Data Structures
| Name    | Type                              | Initial Value              |
|:-------:|:---------------------------------:|:--------------------------:|
| `arr`   | `int[]`                           | `[0]*n`                    |
| `str`   | `string`                          | input                      |

## Algorithm
```java
int arr[str.length()];
for(i = 0; i < n; i++) {
    arr[i] = i;
}
Arrays.sort(arr, (a, b) -> str.substring(a).compareTo(str.substring(b)));
return arr;
```

## Results
- `arr[i]` is the starting index of `i`th lexicographical suffix of `str`. Because they are sorted in lexicographical order, suffixes that share common starting runs will be stored in contiguous blocks of the array.

## Notes
- This will only work for single strings. If a suffix data structure is needed for multiple strings, look into an actuall tree structure
- Because of the large construction time, this naive method should only be used for strings up to 1000 chars. If this is satisfied, this is easier to write.
- A special character, ussualy `$` should be appended to the string to help this construction.
