;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname count_occurrences_of_string_in_list) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; List-of-string String -> N
; determines how often s occurs in los
(define (count los s)
  (cond
    [(empty? los) 0]
    [else (+ (cond
            [(string=? (first los) s) 1]
            [else 0])
             (count (rest los) s))]))
; Tests
(define myList (cons "Hello" (cons "hi" (cons "Hello" (cons "world" '())))))
(check-expect (count myList "Hello") 2)
(check-expect (count myList "hi") 1)
(check-expect (count myList "world") 1)

            
    