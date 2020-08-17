;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e151b_multiplication_succ) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; NaturalNumber -> Number
; add a number A to a natural number B without using the primitive + operation
(define (my-add a b)
  (cond
    [(zero? a) b]
    [else (add1 (my-add (sub1 a) b))]))
; Tests
(check-expect (my-add 4 3) 7)

; NaturalNumber Number -> Number
; multiply a natural number n by a number x without using *
(define (multiply n x)
  (cond
    [(zero? n) 0]
    [else (my-add x (multiply (sub1 n) x))]))
(multiply 10 30)

(check-expect (multiply 10 30) 300)
 