;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e162_convertFC) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))

; fahrenheit -> celsius
; Convert a Fahrenheit number into Celsius number.
(define (convert-f-c f)
  (* 5/9 (- f 32)))

; list-of-fahrenheit -> list-of-celsius
; Convert a list of fahrenheit values into a list of celsius values.
; Domain restriction: fahrenheit value cannot be <= -459.67 (absolute zero)
(define (convertFC* list-of-fahrenheit)
  (cond
    [(empty? list-of-fahrenheit) '()]
    [(<= (first list-of-fahrenheit) -459.67) (error "Error: Temperature cannot be lower than absolute zero")]
    [else (cons (convert-f-c (first list-of-fahrenheit)) (convertFC* (rest list-of-fahrenheit)))]))

;T Tests
(check-expect (convertFC* (cons 32 '())) (cons 0 '()))
(check-expect (convertFC* (cons 10 (cons -500 '()))) (error "Error: Temperature cannot be lower than absolute zero"))