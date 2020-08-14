;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e27_attendance_ticketprice) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/batch-io)

(define MAX_PEOPLE 120)
(define CHANGE_PEOPLE 15)
(define CHANGE_COST 0.10)
(define BASE_TICKET_PRICE 5.0)
(define FIXED_COST 180)
(define VARIABLE_COST 0.04)

(define (attendees ticket-price)
  (- MAX_PEOPLE (* (- ticket-price BASE_TICKET_PRICE) (/ CHANGE_PEOPLE CHANGE_COST))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED_COST (* VARIABLE_COST (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 1)
(profit 2)
(profit 3)
(profit 4)
(profit 5)
(profit 6)
