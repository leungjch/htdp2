;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e72_phone_struct) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; phone# is a structure
; (make-phone# Number Number Number)
; area is a Number, ranges from [0 999]
; switch is a Number, ranges from [0 999]
; num is a Number, ranges from [0 9999]

(define-struct phone# [area switch num])

