# Arbitrary Large Data

## 8.1 Creating Lists
In BSL, lists are represented by `'()`. To add an item to a list, use `cons`. 

Below is an example of a list created using `'()` first and then `cons` repeatedly to join items. 
``` scheme
(cons "Earth"
  (cons "Venus"
    (cons "Mercury"
      '())))
```
Which corresponds to a "nested" structure as shown below:

<img src="images/list.png">

Which is also equivalently represented using arrows:

<img src="images/list_arrow.png">

A list can contain values of any type:

``` scheme
(cons "Robbie Round"
  (cons 3
    (cons #true
      '())))
```

## 8.2 What is `'()`, what is `cons`
`'()` is a constant, a representation of an empty list. Its predicate is `empty?`. 
``` scheme
; Any -> Boolean
; is the given value '()
(define (empty? x) ...)
```
Usage:
``` scheme
> (empty? '())
#true

> (empty? 5)
#false

> (empty? "hello world")
#false

> (empty? (cons 1 '()))
#false

> (empty? (make-posn 0 0))
#false
```

To access elements in a list, Racket lets you only access the first item with `first`  and the rest of the list with `rest`. In Racket, they are synonymous with `car` and `cdr` respectively. All list primitives:
``` scheme
;a special value, mostly to represent the empty list
'()

;a predicate to recognize '() and nothing else
empty?

a checked constructor to create two-field instances
cons

;the selector to extract the last item added
first

;the selector to extract the extended list
rest


;a predicate to recognize instances of cons
cons?
```

## Designing with Self-Referential Data Definitions
Self-referential (recursive) functions correspond to proof by induction in mathematics.

The following is a simple function that uses recursion to count the number of strings in a list:
``` scheme
(define (how-many alos)
  (cond
    [(empty? alos) 0]
    [else (+ (how-many (rest alos)) 1)]))
```
It first establishes a **base case** (if the list is empty, return 0). The **inductive step** self-references the function with the rest of the list and involves a **combinator**, which combines the values into the proper result. 