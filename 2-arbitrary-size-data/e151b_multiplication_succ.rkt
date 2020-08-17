;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e151b_multiplication_succ) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (num x)
  (cond
    [(zero? x) x]
    [else (add1 (sub1 x))]))
(num 10)

; NaturalNumber Number -> Number
; multiply a natural number n by a number x without using *
(define (multiply n x)
  (cond
    [(zero? n) 0]
    [else (num (multiply (sub1 n) x))]))
(multiply 10 3)

;(check-within (add-to-pi 3) (+ 3 pi) 0.001)
 