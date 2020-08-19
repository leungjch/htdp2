;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e172_collapse) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/batch-io)

; a line of string is one of:
; '()
; (cons string line-of-string)

; line-of-string -> string
; unnest a line of strings into a string
(define (process-line line)
  (cond
    [(empty? line) ""]
    [else
     (cond
       [(empty? (first line)) (string-append "" (process-line (rest line)))]
       [else
        (string-append (first line) " " (process-line (rest line)))])]))

; converts a list of lines into a string
(define (lls-to-string lls)
  (cond
    ; base case: empty list
    [(empty? (rest lls)) ""]
    
    [else (string-append (process-line (first lls)) (lls-to-string (rest lls)))]))
(read-words/line "ttt.txt")
(lls-to-string (read-words/line "ttt.txt"))