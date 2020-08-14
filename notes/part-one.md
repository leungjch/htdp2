# Fixed Size Data
## 1.7 Predicates: Know Thy Data
A predicate is a function that consumes a value and returns a boolean pertaining to whether it belongs to a class of data. Predicates often contain a "?" suffix.
```
(number? 4)
#true
```
**Predicates are useful for error checking**
```
; Check if a value is a string first before asking for its string length

(define in ...)
 
(if (string? in) (string-length in) ...)
```

Examples of type predicates: `number?`, `string?`, `image?`, `boolean?`.

Examples of numeric predicates:
`integer?`, `rational?`, `real?`, `complex?`