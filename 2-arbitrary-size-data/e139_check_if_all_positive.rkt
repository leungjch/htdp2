;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e139_check_if_all_positive) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; list-of-numbers -> Boolean
; checks if a list of numbers contains all positive numbers
(define (allPositive li)
  (cond
    [(empty? li) #true]
    [(< (first li) 0) #false]
    [else (and #true (allPositive (rest li)))]))

; Tests
(check-expect (allPositive (cons -10 (cons 2 '()))) #false)
(check-expect (allPositive (cons 10 (cons 2 '()))) #true)
(check-expect (allPositive (cons 100 (cons 10 (cons 2 '())))) #true)
(check-expect (allPositive '()) #true)
