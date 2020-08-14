# Fixed Size Data
## 1.1 The Arithmetic of Numbers
Refresher: In Racket, we call functions using the syntax
```
(function arg1 arg2 ... argn)
```
Arithmetic is done in this way. To add 2 and 3, we do:
```
(+ 2 3 )
5
```

Racket supports a lot of other mathematical operations/functions: ```+, -, *, /, abs, add1, ceiling, denominator, exact->inexact, expt, floor, gcd, log, max, numerator, quotient, random, remainder, sqr, tan```

**Interesting Racket feature**: Racket / BSL distinguishes exact and inexact numbers. Right click on a fraction e.g. `(/ 4 6)` to see its representation as a precise fraction, improper fraction, or mixed decimal. Racket tells you an inexact number as marked by `#i` before the number e.g. `(sqrt 2)`.  
## 1.2 The Arithmetic of Strings
To do string arithmetic, BSL provides a variety of functions:
``` scheme
(string-append "hello" "world") ; outputs "helloworld"

(string-length "hi") ; outputs 2

(string-ith "hi" 0) ; get i-th letter of a string, outputs "h"

(number->string 42) ; convert 42 to string "42"

(substring "hello world" 0 2) ; outputs "hel"
```

## 1.7 Predicates: Know Thy Data
A predicate is a function that consumes a value and returns a boolean pertaining to whether it belongs to a class of data. Predicates often contain a "?" suffix.
``` scheme
(number? 4)
#true
```
**Predicates are useful for error checking**
``` scheme
; Check if a value is a string first before asking for its string length

(define in ...)
 
(if (string? in) (string-length in) ...)
```

Examples of type predicates: `number?`, `string?`, `image?`, `boolean?`.

Examples of numeric predicates:
`integer?`, `rational?`, `real?`, `complex?`

##