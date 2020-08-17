;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname count_strings) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; List-of-strings -> Number
; counts how many strings alos contains 
(define (how-many alos)
  (cond
    [(empty? alos) 0]
    ; if alos is a list
    [(cons? alos)
     (cond
       ; check if it is a single element
       [(empty? (rest alos)) 1]
       ; check recursively re-call function on rest of list
       [else (+ 1 (how-many (rest alos)))])]))

; Tests
(define myList0 '())
(define myList1 (cons "hello" '()))
(define myList2 (cons "hi" (cons "hello" '())))

(check-expect (how-many myList0) 0)
(check-expect (how-many myList1) 1)
(check-expect (how-many myList2) 2)