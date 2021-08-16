#|
First examples of creating functions in racket

Carolina Ortega 
Class: Gilberto Echeverría
24/02/21
|#

; Indicate the language to use to interpret the code
#lang racket

(define (average a b c))
	(/ (+ a b c)3)

define para crear funciones o darle un nombre a cierto valor
(define (triangle-area-sides a b c))
	"Compute the area of a triangle
	given the lengths of its sides "
	(define s(/ (+a b c) 2 ))
	(sqrt(* s (- s a) (- s b) (- s c)))

(define (sign n))
	"Determine if the number is positive, negative or zero"
	#| if = tomar decisiones
	(if (zero? n)
		0
		(if (positive? n)
			1
				-1)))
	|#
	(cond
		[(zero? n) 0]
		[(positive? n) 1]
		[(negative? n) -1])

