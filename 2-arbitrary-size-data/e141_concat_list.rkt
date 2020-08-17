;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e141_concat_list) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; List-of-string -> String
; concatenates a list of strings into one string
(define (cat li)
  (cond
    ; base case: list is empty
    [(empty? li) ""]
    ; base case: list contains only one element
    [(empty? (rest li)) (first li)]
    [else (string-append (first li) (cat (rest li)))]))
; Tests
(define myLi0 (cons "Hello" (cons "World" '())))
(define myLi1 '())
(check-expect (cat myLi0) "HelloWorld")
(check-expect (cat myLi1) "")