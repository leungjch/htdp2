;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e162_wage_error_if_above_100hrs) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; Number -> Number
; computes the wage for h hours of work
(define (wage h)
  (* 12 h))

; List-of-numbers -> List-of-numbers
; computes the weekly wages for the weekly hours
(define (wage* whrs)
  (cond
    [(empty? whrs) '()]
    [(>= (first whrs) 100) (error "Error: Worker cannot work more than 100 hours")]
    [else (cons (wage (first whrs)) (wage* (rest whrs)))]))

; Tests
(check-expect (wage* (cons 28 '())) (cons 336 '()))
(check-expect (wage* (cons 4 (cons 2 '()))) (cons 48 (cons 24 '())))
(check-expect (wage* (cons 400 (cons 2 '()))) (error "Error: Worker cannot work more than 100 hours"))