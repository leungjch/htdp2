;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e142_ill_sized) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)

; consumes a list of images and a positive number, and produces the first non-square image or #false if none found.
; list-of-images n -> ImageOrFalse
; ImageOrFalse is one of:
; - image
; - false
(define (ill-sized? imagelist n)
  (cond
    ; base case: return false if no images
    [(empty? imagelist) #false]
    ; if n*n != image_height * image_width, produce image
    [(not (= (* n n) (* (image-height (first imagelist)) (image-width (first imagelist)))))
     (first imagelist)]
    ; else, traverse the rest of the list
    [else (ill-sized? (rest imagelist) n)]))
; Tests
(define mysquare (square 10 "solid" "red"))
(define myrect1 (rectangle 10 20 "solid" "black"))
(define myrect2 (rectangle 50 50 "solid" "red"))
(define mylist (cons myrect2 (cons mysquare (cons myrect1 (cons mysquare '())))))
(ill-sized? mylist 10)