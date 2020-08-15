;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname e66_structs_more) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct movie [title producer year])
(define movie1 (make-movie "MovieName" "Nolan" 2020))

(define-struct person [name hair eyes phone])
(define person1 (make-person "John" "Blue" "Black" 123456789 ))

(define-struct pet [name number])
(define pet1 (make-pet "Cookie" 123456789 ))

(define-struct CD [artist title price])
(define cd1 (make-CD "Lil Pump" "Untitled Track" 20.99))

(define-struct sweater [material size producer])
(define sweater1 (make-sweater "Wool" "10" "MyProducer"))
