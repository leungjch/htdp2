;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e109_key_sequence_fsm) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)
(require 2htdp/image)

	
; ExpectsToSee.v2 is one of:
; – AA
; – BB
; – DD 
; – ER 
 
(define AA "start, ...")
(define BB "expect ...")
(define DD "finished")
(define ER "error, ...")

(define (next-key s a-key)
  (cond
    ; if we are at start state
    [(string=? s AA) (cond
                       ; if next key is "a" proceed, else invalid
                       [(key=? a-key "a") BB]
                       [else ER]
                       )]
    ; if we are at BB state
    [(string=? s BB) (cond
                       ; if next key is b or c, stay at BB stage
                       [(or (key=? a-key "b") (key=? a-key "c")) BB]
                       ; if next key is d, proceed to DD stage
                       [(key=? a-key "d") DD]
                       ; otherwise, error state
                       [else ER]
                       )]
    [else s]))

(define (render s)
  (cond
    [(string=? s AA)
     (rectangle 100 100 "solid" "white")]
    [(string=? s BB)
     (rectangle 100 100 "solid" "yellow")]
    [(string=? s DD)
     (rectangle 100 100 "solid" "green")]
    [(string=? s ER)
     (rectangle 100 100 "solid" "red")]
    [else (rectangle 100 100 "solid" "black")]))
    

; s is the current character
(define (main s)
  (big-bang s
    [on-key next-key]
    [to-draw render]))


; initialize main at initial state
(main AA)