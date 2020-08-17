;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 169_legal_posns) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; list-of-posns -> list-of-posns
; Adds 1 to the y coordinate of each posn in a list of posns
(define (translate lop)
  (cond
    [(empty? lop) '()]
    [else (cond
            [(and (>= (posn-x (first lop)) 0)
                  (<= (posn-x (first lop)) 100)
                  (>= (posn-y (first lop)) 0)
                  (<= (posn-y (first lop)) 200))
             (cons (first lop) (translate (rest lop)))]
            [else (translate (rest lop))])]))
            
; Tests
(define myTest (cons (make-posn 10 5000) (cons (make-posn 5 2) '())))
(define myExpect (cons (make-posn 5 2) '()))
(check-expect (translate myTest) myExpect)