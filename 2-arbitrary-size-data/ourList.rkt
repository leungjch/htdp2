;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ourList) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct pair [left right])

(define (our-cons a-value a-list)
  (make-pair a-value a-list))

(define myPair1 (make-pair 1 2))
(define myPair2 (make-pair 3 4))

(define bigList (our-cons 1 myPair1))
bigList
