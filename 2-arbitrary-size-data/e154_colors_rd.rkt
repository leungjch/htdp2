;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e154_colors_rd) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct layer [color doll])

; An RD (short for Russian doll) is one of: 
; – String 
; – (make-layer String RD)
;(make-layer "pink" (make-layer "black" "white"))

; RD -> String
; consumes a Russian doll and produces a string of all colors, separated by a comma and a space
(define (colors rd)
  (cond
    ; base case - the doll is a String type, not another layer
    ; return inner doll string
    [(string? rd)  rd]
    [else
     (string-append (layer-color rd) ", " (colors (layer-doll rd)))]))

; Tests
(define myRD (make-layer "yellow" (make-layer "green" "red")))
(colors myRD)
(check-expect (colors myRD) "yellow, green, red")