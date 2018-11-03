% Suffix Array (Naive)

<div class="no-stretch">
|           |                   |
|-----------|-------------------|
| __Time__  | $n^2\cdot\log{n}$ |
| __Space__ | $n$               |
</div>

## Data Structures
| Name     | Type            | Initial Value     |
|:--------:|:---------------:|:-----------------:|
| `suffix` | `List<Integer>` | `[0, ..., n - 1]` |
| `str`    | `String`        | input (length n)  |

## Algorithm
```java
Arrays.sort(suffix, (a, b) -> str.substring(a).compareTo(str.substring(b)));
```

## Results
- `suffix[i]` is the starting index of the `i`th lexicographical suffix of `str`. Suffixes that share common starting runs will be stored in contiguous blocks of the array.

## Notes
- Only works for single strings. For multiple strings, look into an actual tree structure.
- This is fast enough for $n \le 1,000$. If more speed is needed, use the Fast method.
- A special character (often `$`) should be appended to the string to help this construction.
