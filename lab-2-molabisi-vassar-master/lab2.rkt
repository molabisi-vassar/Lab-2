;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; CS101 Lab 2
; Name: MICHAELA OLABISI
 
; Exercise 1:
; Define the function letter-grade that consumes a number between 
; 0 and 100, and produces a letter grade ("A", "B", "C", "D", "F") 
; using the usual 90, 80, 70, 60 cutoffs.

; num -> string
; determines letter grade from number grade ng (between 0 and 100)
; grade ng (between 0 and 100)
(define (letter-grade ng)
  (cond
    [(>= ng 90) "A"]
    [(>= ng 80)"B"]
    [(>= ng 70) "C"]
    [(>= ng 60) "D"]
    [(< ng 60) "F"]))
(check-expect (letter-grade 50) "F")
  

; Exercise 2:
; Define the function pass? that determines whether the given number
; grade is a passing grade (60 or higher).

; num -> bool
; determines whether the given number grade is a passing grade // returns true if ng is larger than 60

(define (pass? ng)
  (>= ng 60))
(check-expect (pass? 100) #true)
(check-expect (pass? 50) #false)

; Exercise 3:
; Define the function pass-fail that consumes a number grade and 
; determines either "PA" or "F". Use the pass? predicate function
; from Exercise 2.

; num-> string
; translate ng to "PA" or "F"
(define (pass-fail ng)
  (cond
    [(pass? ng) "PA"]
    [else "F"]))
(check-expect (pass-fail 50) "F")
(check-expect (pass-fail 60) "PA")
 
; Exercise 4:
; Define the function NRO-grade, which consumes a number grade and a 
; minimum numeric grade between 0 and 100, and produces either a 
; letter grade, "PA", or "F", according to Vassar's NRO rules. You
; are encouraged to use one or more functions from Exercises 1-3 as
; helper functions.

;num num -> string
;determines if ng is mng and then produces pass or fail
(define (NRO-grade ng min-g)
  (cond
    [(>= ng min-g) (letter-grade ng)]
    [(< ng min-g) (pass-fail ng)]))

(check-expect (NRO-grade 75 80) "PA")
(check-expect (NRO-grade 50 70) "F")
(check-expect (NRO-grade 90 80) "A")