;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e7_sunny_friday) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; create an expression that computes whether sunny is false or friday is true

(define sunny #true)
(define friday #false)

(define (is-sunny-or-friday sunny friday)
  (or (not sunny) friday))

(is-sunny-or-friday sunny friday)