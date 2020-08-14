# Fixed Size Data
## 1.1 The Arithmetic of Numbers
In Racket, we call functions using the syntax
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

## 2.1 Functions
Two types of definitions in Racket:
- Constant definitions `(define variable Expression)`
- Function definition `(FunctionName Arg1 .. ArgN Expression)`
    - Example function that multiplies input by 10: 
    
        ``` scheme
        (define (ff a)
        (* 10 a))
        ```

## 2.5 Programs
Programs are just a bunch of functions and constant definitions.
- Batch program: Consume inputs and computes a result
- Interactive program: Takes input, output, then takes more input, outputs more, etc. Such inputs are called "events" and the program is called an "event-driven" program. The event-driven program calls various functions depending on the event, which are called "event handlers".

### Batch programs
Use `(require 2htdp/batch-io)` to import functions for reading/writing files

To read and write files:
``` scheme
(write-file "sample.dat" "212")
"sample.dat"

(read-file "sample.dat")
"212"
```


## 3.1 Designing Functions
Model-view-controller (MVC): Separating data processing from information parsing, turning data into useful information.

Key concept - separation of data and information

A number can mean many things - temperature in Celsius or Fahrenheit, number of apples, number of characters in a string. Therefore, it is useful to provide a **data definition**:
``` scheme
; A Temperature is a Number.
; interpretation: represents Celsius degrees
```

When designing a function, write out what types of data it takes in, followed by `->` and the output type, and what it does in plain English. For example:
``` scheme
; Number -> Number
; computes the area of a square with side len 
; given: 2, expect: 4
; given: 7, expect: 49
(define (area-of-square len) 0)
```

