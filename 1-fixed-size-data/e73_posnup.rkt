;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e73_posnup) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; Posn Number -> Posn
; Produces a new Posn p with with the x coordinate being n
(define (posn-up-X p n)
  (make-posn (+ (posn-x p) n) (posn-y p)))
(define myPos (make-posn 1 1))
(posn-up-X myPos 10)