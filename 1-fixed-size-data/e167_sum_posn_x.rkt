;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e167_sum_posn_x) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; List-of-posns -> Number
;consumes a list of Posns and produces the sum of all of its x-coordinates. 
(define (sum list-of-posns)
  (cond
    [(empty? list-of-posns) 0]
    [else
     (+ (posn-x (first list-of-posns))
        (sum (rest list-of-posns)))]))
; Tests
(define myTest (cons (make-posn 1 2)
                     (cons (make-posn 3 4)
                           (cons (make-posn 5 6)
                                 (cons (make-posn 7 8)
                                       '())))))
(define myExpected 16)
(check-expect (sum myTest) myExpected)