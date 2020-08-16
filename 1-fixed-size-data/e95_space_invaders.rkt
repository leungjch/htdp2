;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e95_space_invaders) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)
(require 2htdp/image)

(define WORLDHEIGHT 500)
(define WORLDWIDTH 500)
(define TANKWIDTH (/ WORLDWIDTH 4))
(define UFOWIDTH (/ WORLDWIDTH 3))
(define MISSILEWIDTH (/ WORLDHEIGHT 10))

(define TANKHEIGHT (/ WORLDHEIGHT 10))
(define UFOHEIGHT (/ WORLDHEIGHT 10))
(define MISSILEHEIGHT (/ WORLDHEIGHT 10))

; The axis (y coordinate) of the tank
(define TANKAXIS (- WORLDHEIGHT TANKHEIGHT))

(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])


(define BACKGROUND (rectangle WORLDWIDTH WORLDHEIGHT "solid" "gray"))

; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)
; initial position at middle top
(define ufo1 (make-posn (/ WORLDWIDTH 2) 0))

(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick 

; create tank instance
(define tank1 (make-tank 0 10))

; create tank image
(define tankimage (rectangle TANKWIDTH TANKHEIGHT "solid" "black"))

; create ufo image
(define ufoimage (ellipse UFOWIDTH UFOHEIGHT "solid" "yellow"))

; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place
(define missile (make-posn 0 0))
(define missileimage (triangle (/ TANKWIDTH 3) "solid" "black"))
; Tank Image -> Image 
; adds t to the given image im
(define (tank-render t im)
  (place-image tankimage
              (tank-loc t)
              TANKAXIS
              im))
; UFO Image -> Image 
; adds u to the given image im
; u is posn
(define (ufo-render u im)
  (place-image ufoimage
              (posn-x u)
              (posn-y u)
              im))

; Missile Image -> Image 
; adds m to the given image im
(define (missile-render m im) im)

; SIGS -> Image
; renders the given game state on top of BACKGROUND 
; for examples see figure 36
(define (si-render s)
  (cond
    [(aim? s)
     (tank-render (aim-tank s)
                  (ufo-render (aim-ufo s) BACKGROUND))]
    [(fired? s)
     (tank-render
       (fired-tank s)
       (ufo-render (fired-ufo s)
                   (missile-render (fired-missile s)
                                   BACKGROUND)))]))


; check if game over
(define (si-game-over? s)
  (cond
    ; check if the UFO landed
    [(aim? s) (if (>= WORLDHEIGHT (posn-x (aim-ufo s))) #true #false)]

    ; check if missile hit UFO (distance < 1)
    ; we must first check that we are in the fired game state
    ;[(fired? s) ((if (>= WORLDHEIGHT (posn-x (aim-ufo s)))) #t)]
))
(define (main s)
  (big-bang s
    ;[on-tick tock]
    ;[stop-when end-of-screen?]
    [to-draw si-render]))
    ;[on-mouse hyper]))
(define initial-state (make-aim (make-posn 10 20) (make-tank 28 -3)))
(main initial-state)