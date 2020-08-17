;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e166_wagev3) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A (piece of) Work is a structure: 
;   (make-work String Number Number)
; interpretation (make-work n r h) combines the name 
; with the pay rate r and the number of hours h
(define-struct work [employee rate hours])

; A (piece of) Paycheck is a structure:
;   (make-paycheck String Number)
; interpretation: (make-paycheck n p) combines the name
; with the total number of dollars paid for work
(define-struct paycheck [employee payment])

; Low (short for list of works) is one of: 
; – '()
; – (cons Work Low)
; interpretation an instance of Low represents the 
; hours worked for a number of employees
; Example of a Low
(define myLow (cons (make-work "Matthew" 12.95 45)
      (cons (make-work "Robby" 11.95 39)
            '())))

; Lop (short for list of paychecks) is one of:
; - '()
; - (cons Paycheck Lop)
; interpretation: an instance of Lop represents the
; payments for a number of employees
; Example of a Lop
(define myLop (cons (make-paycheck "Matthew" (* 12.95 45)) '()))

; work -> paycheck
; consumes a work and produces a paycheck
(define (process-work work)
  (make-paycheck (work-employee work) (* (work-rate work) (work-hours work))))

; list-of-work -> list-of-paycheck
; consumes a list of work records and computes a list of paychecks from it, one per record.
(define (wage*.v3 low)
  (cond
    [(empty? low) '()]
    [else (cons (process-work (first low))
                (wage*.v3 (rest low)))]))


(define myTest (cons (make-work "Matthew" 12.95 45)
      (cons (make-work "Robby" 11.95 39)
            '())))
(define myExpected (cons (make-paycheck "Matthew" (* 12.95 45))
                         (cons (make-paycheck "Robby" (* 11.95 39))
                               '())))

(check-expect (wage*.v3 myTest) myExpected)