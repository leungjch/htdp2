;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e176_transpose_matrix) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A Matrix is one of: 
;  – (cons Row '())
;  – (cons Row Matrix)
; constraint all rows in matrix are of the same length
 
; A Row is one of: 
;  – '() 
;  – (cons Number Row)

(define r1 (cons 1 (cons 2 '())))
(define r2 (cons 3 (cons 4 '())))
(define r3 (cons 5 (cons 6 '())))
(define matrix (cons r1 (cons r2 (cons r3 '()))))
matrix
(first matrix)
(rest matrix)

(first (first matrix))
(first (first (rest matrix)))
(first (first (rest (rest matrix))))

; matrix -> list
; generate a column from a matrix
(define (first* lln)
  (cond
    [(empty? lln) '()]
    [else (cons
           (first (first lln))
           (first* (rest lln)))]))

; matrix -> matrix
; generate a matrix with the first column removed
(define (rest* lln)
  (cond
    [(empty? lln) '()]
    [else (cons
           (rest (first lln))
           (rest* (rest lln)))]))


(first* matrix)
(rest* matrix)
;(define (transpose lln)
;  (cond
;    [(empty? (first lln)) '()]
;    [else (cons (first* lln) (transpose (rest* lln)))]))
