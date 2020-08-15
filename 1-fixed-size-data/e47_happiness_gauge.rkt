;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e47_happiness_gauge) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)
(define WORLD-WIDTH 500)

; constant background
(define BACKGROUND
  (rectangle WORLD-WIDTH WORLD-WIDTH "solid" "black"))

; function
; Number -> Image
; returns an image representing the happiness gauge, a rectangle with width x
(define (show-gauge x)
  (rectangle x (/ WORLD-WIDTH 6) "solid" "red"))


; WorldState -> Image
; render the background
; then render the car offset (moved) x pixels from left
(define (render x)
  (underlay/xy BACKGROUND
                  0
                  0
                  (show-gauge x)))

; WorldState -> WorldState
(define (tock x)
  (- x 0.1))

; WorldState -> boolean
; return true when positive or greater than 0
(define (end-of-screen? x)
  (if (<= 0 x) #f #t))


; WorldState Number Number String -> WorldState
; increases happiness on click 
; if the given me is "button-down" 
(define (increase-happiness-mouse x x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) (+ x (/ (- WORLD-WIDTH x) 8))]
    [else x]))

; WorldState Number Number String -> WorldState
; increases happiness on click 
; if the given me is "button-down" 
(define (increase-happiness-key x a-key)
  (cond
    [(string=? "up" a-key) (+ x (/ (- WORLD-WIDTH x) 2))]
    [else x]))


(define (gauge-prog ws)
  (big-bang ws
    [on-tick tock]
    [stop-when end-of-screen?]
    [to-draw render]
    [on-mouse increase-happiness-mouse]
    [on-key increase-happiness-key]))
(gauge-prog 500)