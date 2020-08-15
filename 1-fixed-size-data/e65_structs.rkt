;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e65_structs) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct entry [name phone email]) ; Define "entry" struct type with 3 fields: name, phone, email
(define a (make-entry "Al Abe" "666-7771" "lee@x.me"))  ; Create struct instance
(define a-name (entry-name a)) ; Selector usage:  Get the name of the instance structure and store as another variable


a-name ; "Al Abe"
(entry-email a) ; Selector usage: "lee@x.me"
(entry? a) ; Predicate usage: "#true"
