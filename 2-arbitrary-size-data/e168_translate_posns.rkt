;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e168_translate_posns) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; list-of-posns -> list-of-posns
; Adds 1 to the y coordinate of each posn in a list of posns
(define (translate lop)
  (cond
    [(empty? lop) '()]
    [else (cons (make-posn (posn-x (first lop))
                      (+ 1 (posn-y (first lop))))
                (translate (rest lop)))]))
; Tests
(define myTest (cons (make-posn 10 10) (cons (make-posn 5 2) '())))
(define myExpect (cons (make-posn 10 11) (cons (make-posn 5 3) '())))
(check-expect (translate myTest) myExpect)