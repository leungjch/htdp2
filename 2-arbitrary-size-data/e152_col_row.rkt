;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e152_col_row) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
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


; Tests
(col 4 (rectangle 20 20 "outline" "white"))
(row 4 (rectangle 20 20 "outline" "white"))