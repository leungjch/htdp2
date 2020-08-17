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





