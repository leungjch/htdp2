;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname retrieve_nth_item) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; List Natural -> Natural
; retrieve the n-th element of a list, starting from zero
; constraint: 0 <= n <= length of list
(define (retrieve-n li n)
  (cond
    [(zero? n) (first li)]
    [else
     (retrieve-n (rest li) (sub1 n))]))
(define myList (cons 2 (cons 5 (cons 10 (cons 15 empty)))))
(check-expect (retrieve-n myList 1) 5)