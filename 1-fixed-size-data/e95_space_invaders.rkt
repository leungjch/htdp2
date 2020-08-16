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
(define missileimage (triangle (/ TANKWIDTH 3) "solid" "blue"))
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
(define (missile-render m im)
  (place-image missileimage
               (posn-x m)
               (posn-y m)
               im))

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
    ; check if in aim game state first
    [(aim? s) (if (>= WORLDHEIGHT (posn-y (aim-ufo s))) #false #true )]

    ; check if missile hit UFO 
    ; we must first check that we are in the fired game state
    [(fired? s)
     (cond
       ; if missile is within distance of UFO, end game (win)
       ; hit if: (missileX - UFOx < 3) && (missileY - UFOy < 3)
       [(and (< (abs (- (posn-x (fired-missile s))
                        (posn-x (fired-ufo s))))
                MISSILEWIDTH)
             (< (abs (- (posn-y (fired-missile s))
                        (posn-y (fired-ufo s))))
                MISSILEHEIGHT))
        #true]
       ; if missile moves out of the top of the screen (i.e. y coordinate < 0), end game (loss)
       [(<= (posn-y (fired-missile s)) 0) #true]
       [else #false]
    )]))

; generate random number betweeen 0 and 1
(define (random-sign c) 
  (if (= (random 2) 0) -1 1)) 

; check if number is negative.
(define (check-negative? c) 
  (cond
    [(< c 0) #true]
    [else #false])) 


; move every tick
(define (si-move s)
  (cond
    ; if in aim state, return an aim state
    ; move ufo down and move tank
    [(aim? s)
     (make-aim
               (make-posn
                ; ufo moves left or right randomly
                ; make sure ufo wraps around edge of screen
                (modulo (+ (posn-x (aim-ufo s))
                   (* (random-sign 1) (random (/ WORLDWIDTH 20))))
                        WORLDWIDTH)
                ; ufo moves down 1
                (+ (posn-y (aim-ufo s))
                  1))

               ; tank moves at constant velocity, along a constant horizontal axis
               (make-tank
                (modulo (+ (tank-vel (aim-tank s))
                   (tank-loc (aim-tank s))) WORLDWIDTH)
                (tank-vel (aim-tank s))))
               ]
    ; if in fired state, move ufo, tank, and missile
    [(fired? s)
     (make-fired
               (make-posn
                ; ufo moves left or right randomly
                (+ (posn-x (fired-ufo s))
                   (* (random-sign 1) (random (/ WORLDWIDTH 20)))) ; ufo moves left and right randomly
                ; ufo moves down 1
                (+ (posn-y (fired-ufo s))
                  1))

               ; tank moves at constant velocity, along a constant horizontal axis
               (make-tank
                (modulo (+ (tank-vel (fired-tank s))
                   (tank-loc (fired-tank s))) WORLDWIDTH)
                (tank-vel (fired-tank s)))
               ; missile moves at constant velocity up
               (make-posn
                (posn-x (fired-missile s))
                (- 
                   (posn-y (fired-missile s))
                   10)))]

))

(define (si-control s a-key)
  (cond
    ; check left key
    ; move tank left if pressed
    [(key=? a-key "left")
          (make-aim
               (make-posn
                ; ufo moves left or right randomly
                (+ (posn-x (aim-ufo s))
                   (* (random-sign 1) (random (/ WORLDWIDTH 20)))) ; ufo moves left and right randomly
                ; ufo moves down 1
                (+ (posn-y (aim-ufo s))
                  1))

               ; switch tank velocity if it is moving right, else keep it
               (make-tank
                (modulo (tank-loc (aim-tank s)) WORLDWIDTH)
                (if (check-negative? (tank-vel (aim-tank s)))
                    (tank-vel (aim-tank s))
                    (* -1 (tank-vel (aim-tank s))))))]
    ; check right key
    ; move tank right if pressed
    [(key=? a-key "right")
          (make-aim
               (make-posn
                ; ufo moves left or right randomly
                (+ (posn-x (aim-ufo s))
                   (* (random-sign 1) (random (/ WORLDWIDTH 20)))) ; ufo moves left and right randomly
                ; ufo moves down 1
                (+ (posn-y (aim-ufo s))
                  1))

               ; switch tank velocity if it is moving left, else keep it
               (make-tank
                (modulo (tank-loc (aim-tank s)) WORLDWIDTH)
                (if (check-negative? (tank-vel (aim-tank s)))
                    (* -1 (tank-vel (aim-tank s)))
                    (tank-vel (aim-tank s))
                    )))]
    ; check space key
    ; fire the missile (new game state)
    [(key=? a-key " ")
     ; if the missile is already fired, dont do anything
     ; else, make the fired state
     (if (fired? s) s
     (make-fired
      ; make ufo
      (make-posn (posn-x (aim-ufo s))
                 (posn-y (aim-ufo s)))
      ; make tank
      (make-tank (tank-loc (aim-tank s))
                 (tank-vel (aim-tank s)))
      ; make missile
      ; x coordinate equal to tank
      ; y coordinate slightly above tank
      (make-posn (tank-loc (aim-tank s))
                 (+ 10 TANKAXIS))))]
    [else s]))

; end game screen
(define (si-render-final s)
  (cond
    ; if UFO lands in aim game state, lose
    ; we can only lose in the aim state,
    ; so check if we are in the aim state at the end
    [(aim? s) (text "You lose, the UFO landed." 24 "olive")]
    ; if missile is out of top of screen in fired state, lose
    [(fired? s) (if ( <= (posn-y (fired-missile s)) 0)
                    (text "You lose, the missile didn't hit." 24 "olive")
                    (text "You win, you hit the UFO!" 24 "olive"))]

    [else (text "Oops, this isn't supposed to be triggered." 24 "olive")]))
     

(define (main s)
  (big-bang s
    [on-tick si-move]
    [stop-when si-game-over? si-render-final]
    [on-key si-control]
    [to-draw si-render]))

(define initial-state (make-aim (make-posn 200 20) (make-tank 28 -3)))
(main initial-state)