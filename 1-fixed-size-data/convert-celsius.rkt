;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname convert-celsius) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/batch-io)

(define (C f)
  (* 5/9 (- f 32)))

(define (convert-f-c in out)
  (write-file out
              (string-append
               (number->string
                (C
                 (string->number
                  (read-file in))))
               "\n")))


(write-file "testCelsius.dat" "0")
(convert-f-c "testCelsius.dat" "testFah.dat")