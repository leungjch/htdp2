;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname fixed1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(/ 2 3)
( sqrt 2 )

(+ (image-width (circle 10 "solid" "red")) ; width = 20
   (image-height (rectangle 10 20 "solid" "blue"))) ; height = 20
; = 40