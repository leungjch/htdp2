;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e145_sorted_predicate) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; predicate function that returns true if the numbers are sorted in descending order
; list -> boolean
(define (sorted>? mylist)
  (cond
    [(empty? (rest mylist)) #true]
    [else (and (> (first mylist) (first (rest mylist))) (sorted>? (rest mylist)))]
    ))
; Tests
(define testList0 (cons 10 (cons 7 '())))
(define testList1 (cons 10 (cons 9 (cons 8 (cons 7 '())))))
(define testList2 (cons 10 (cons 19 (cons 8 (cons 7 '())))))
(check-expect (sorted>? testList1) #true)
(check-expect (sorted>? testList2) #false)