;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e41_moving_car) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)

(define WORLD-WIDTH 500)

(define WHEEL-RADIUS 20)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

(define CHASIS
  (rectangle (+ WHEEL-DISTANCE WHEEL-RADIUS) (* 2 WHEEL-RADIUS) "solid" "red"))

(define CAR
  (overlay/offset (overlay/offset WHEEL
                                  WHEEL-DISTANCE 0
                                  WHEEL)
                  0 (- (/ WHEEL-RADIUS 2))
                  CHASIS) )
(define BACKGROUND
  (rectangle WORLD-WIDTH WORLD-WIDTH "solid" "gray"))

; WorldState -> Image
; render the background
; then render the car offset (moved) x pixels from left
(define (render x)
  (overlay/offset CAR
                  (- x)
                  0
                  BACKGROUND))

; WorldState -> WorldState
(define (tock x)
  (- x 3 ))

(define (end-of-screen? x)
  (if (<= (- (/ WORLD-WIDTH 2)) x) #f #t))


; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down" 
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))
(check-expect (hyper 21 10 20 "enter") 21)
(check-expect (hyper 42 10 20 "button-down") 10)
(check-expect (hyper 42 10 20 "move") 42)


(define (main ws)
  (big-bang ws
    [on-tick tock]
    [stop-when end-of-screen?]
    [to-draw render]
    [on-mouse hyper]))
(main 50)