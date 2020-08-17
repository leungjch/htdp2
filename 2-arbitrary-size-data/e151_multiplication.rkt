;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e151_multiplication) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; NaturalNumber Number -> Number
; multiply a natural number n by a number x without using *
(define (multiply n x)
  (cond
    [(zero? n) 0]
    [else (+ x (multiply (sub1 n) x))]))
(multiply 10 3)

;(check-within (add-to-pi 3) (+ 3 pi) 0.001)
 