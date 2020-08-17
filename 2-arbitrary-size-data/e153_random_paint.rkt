;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e153_random_paint) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; Number Image -> Image
; produce an image with n columns of the given image.
(define (col n img)
  (cond
    [(zero? n) empty-image]
    [else (overlay/xy img (image-width img) 0 (col (sub1 n) img))]))

; Number Image -> Image
; produce an image with n rows of the given image.
(define (row n img)
  (cond
    [(zero? n) empty-image]
    [else (overlay/xy img 0 (image-width img) (row (sub1 n) img))]))

(define (grid x y img)
  (cond
    [(zero? x) empty-image]
    [else
     (overlay/xy
     (row y img)
     (image-height img)
     0
     (grid
      (sub1 x)
      y
      img))]))

; Examples
;(grid 8 18 (rectangle 20 20 "outline" "white"))

; List-of-posns -> Image
; Adds circles at x-y coordinates specified by an input list of posns to an 8x18 grid.
(define (add-balloons list-of-posns)
  (cond
    [(empty? list-of-posns) (grid 8 18 (rectangle 20 20 "outline" "white"))]
    [else
     (place-image
      (circle 5 "solid" "red")
      (posn-x (first list-of-posns))
      (posn-y (first list-of-posns))
      (add-balloons (rest list-of-posns)))]))

; Example
(define myList (cons (make-posn 10 10) (cons (make-posn 20 20) (cons (make-posn 30 30) (cons (make-posn 40 40) (cons (make-posn 50 50) '()))))))
(add-balloons myList)