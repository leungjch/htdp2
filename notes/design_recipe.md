# The Design Recipe

The design recipe is an integral part of HtDP. It's a systematic approach to developing functions that are well documented and tested. 

## Components of the design recipe

1. **Purpose**: Describe what the function computes.
2. **Contract**: Describe what arguments the function consumes and the type of value it produces.
3. **Examples**: Illustrate the typical use of the function.
4. **Definition**: The actual code for the function.
5. **Tests**: A set of function applications and their expected values.

## Recommended order of following the Design Recipe

1. Write a draft of the **Purpose**
2. Write **Examples** (by hand, then code)
3. Write Definition **Header** and **Contract**
4. Finalize the purpose with parameter names
5. Write **Definition** body
6. Write **Tests**

## Using the Design Recipe

``` scheme
;; [PURPOSE] (sum-of-squares n1 n2) produces the sum of squares of n1 and n2.
;; [EXAMPLE] Examples:
(check-expect (sum-of-squares 3 4) 25)
;; [HEADER AND CONTRACT] sum-of-squares: Num Num → Num 
;; [DEFINITION]
(define (sum-of-squares n1 n2)
(+ (sqr n1) (sqr n2)))
;; [TESTS] Tests
(check-expect (sum-of-squares 0 0) 0)
(check-expect (sum-of-squares -2 7) 53)
(check-expect (sum-of-squares 0 2.5) 6.25)
```

# Data Definitions
A data definition specifies how to represent a piece of information in the real world as data in a program. It also provides documentation on how to interpret the data back into information. It also provides a template and examples for how to operate on the data.

For example, consider modelling a traffic light. Here is a function that provides the next colour in a traffic light:
``` scheme
(define (next-color c)
    (cond 
        [(= c 0) 2])
        [(= c 1) 1])
        [(= c 2) 0])))
```
Although we can understand what the function does, we do not understand the data that it is acting on. What is `c`? Can c be 3 or more, or negative? 

The problem of ambiguity can be solved by providing a data definition:
``` scheme
;; TLColor is one of:
;; - 0
;; - 1
;; - 2
;; interpretation: the color of a traffic light: 0 is red, 1 yellow, 2 green
```
We now see that `c` must be a `TLColor` and therefore can only be 0, 1, or 2. We also know that `c` represents the color of a traffic light, even if it maps to a natural number.


