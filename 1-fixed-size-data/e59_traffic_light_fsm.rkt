;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e59_traffic_light_fsm) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)

(define STOPLIGHT-RADIUS 50)
(define STOPLIGHT-DISTANCE (* 2 STOPLIGHT-RADIUS))

(define REDBULB
  (circle STOPLIGHT-RADIUS "solid" "red"))
(define YELLOWBULB
  (circle STOPLIGHT-RADIUS "solid" "yellow"))
(define GREENBULB
  (circle STOPLIGHT-RADIUS "solid" "green"))
(define EMPTYBULB
  (circle STOPLIGHT-RADIUS "outline" "gray"))

(define REDLIGHT
  (overlay/offset (overlay/offset REDBULB STOPLIGHT-DISTANCE 0
                                  EMPTYBULB)
                  (* 3/2 STOPLIGHT-DISTANCE) 0
                  EMPTYBULB))
(define YELLOWLIGHT
  (overlay/offset (overlay/offset EMPTYBULB STOPLIGHT-DISTANCE 0
                                  YELLOWBULB)
                  (* 3/2 STOPLIGHT-DISTANCE) 0
                  EMPTYBULB))
(define GREENLIGHT
  (overlay/offset (overlay/offset EMPTYBULB STOPLIGHT-DISTANCE 0
                                  EMPTYBULB)
                  (* 3/2 STOPLIGHT-DISTANCE) 0
                  GREENBULB))

(define (tl-render state)
  (cond
    [(string=? "red" state) REDLIGHT]
    [(string=? "green" state) GREENLIGHT]
    [(string=? "yellow" state) YELLOWLIGHT]
    [else #f]))
(tl-render "yellow")

(define (tl-next state)
  (cond
    [(string=? "green" state) "yellow"] ; green to yellow
    [(string=? "yellow" state) "red"] ; yellow to red
    [(string=? "red" state) "green"] ; red to green
    [else #f]))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))
(traffic-light-simulation "green")