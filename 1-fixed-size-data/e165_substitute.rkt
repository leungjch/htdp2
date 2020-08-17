;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e165_substitute) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; String String list-of-strings -> list-of-strings
; Substitutes all occurrences of old string with new string, producing a new list of strings
(define (substitute old new los)
  (cond
    [(empty? los) '()]
    ; create a new list
    [else (cons (cond
            ; if word is old, replace with new string. Otherwise keep as is
            [(string=? (first los) old) new]
            [else (first los)]
            )
                (substitute old new (rest los)))]))
(define myList (cons "a" (cons "b" (cons "b" (cons "b" (cons "a" '()))))))
(check-expect (substitute "b" "a" myList) (cons "a" (cons "a" (cons "a" (cons "a" (cons "a" '()))))))