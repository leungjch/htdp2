;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e134_contains_in_list) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; list -> Boolean
; indicate whether a string is within a list of strings
(define (contains? str a-list)
  (cond
    ; if empty, return false
    [(empty? a-list) #false]
    ; if first element contains str, return true
    [(string=? (first a-list) str) #true]
    [else (contains? str (rest a-list))]))

; Tests
(check-expect (contains? "hi" (cons "0" '())) #false)
(check-expect (contains? "hi" (cons "hi" '())) #true)
    