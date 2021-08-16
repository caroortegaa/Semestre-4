;;; Activity 2.2 Functional programming, part 2
;;; Sebastian Juncos A01022629
;;; Carolina Ortega A01025254
;;; Ximena Gonzalez A01028604
;;; Due Date: March 11, 2021

#lang racket

;;; 6
;;; This function takes a list as input. Returns a list with the same elements as its input but in reverse order. 
;;; If there are nested lists, these must also be inverted.
(define (deep-reverse lst)
  (if (list? lst) ;;;If lst is a list continue
    ;;;Reverse is a function that returns values in lst in reverse order
      (reverse (map deep-reverse lst)) ;;;map applies the function to every element in lst
      lst))


;;; 13
;;; This function takes as input a function with two arguments f and returns a new function that behaves as but 
;;; with the order of its two arguments exchanged
;;; Define the name of the functions and input parameter
;;; f takes as an input two arguments 
(define (args-swap f)
	;;; Call x y (arguments) and apply the function to reverse 
	;;; the arguments in 'f' as y x
    (lambda (x y) (f y x)))  ;;;lambda has as an output a procedure


;;; 14
;;; This function takes two inputs: a boolean function with a pred argument and a list lst. Returns true if there is 
;;; exactly one element in lst that satisfies pred, otherwise returns false.
(define (there-exists-one? arg lst)
    (let loop
        ([lst lst] [contador 0]);;;the loop receives a list type lst, and a counter that begins in 0
        (if (empty? lst) 
            (if (eq? contador 1);;; if the counter is equal to 0
                #t ;;;print true
                #f) ;;;if not print false
            (if (eq? (arg(car lst)) #t) ;;;if the first item in the list is equal to the argument
                (loop[cdr lst][add1 contador]) ;;;repeat the loop with the rest of the list and the counter + 1
				 (loop [cdr lst]contador))))) ;;;repeat the loop with the rest of the list and the counter

;;; 15
;;; This function returns the index where the first occurrence of x is found in lst (the first element in the list is 
;;; at index 0), or false if it was not found.
(define (linear-search lst x eq-fun)
    ;;; Define the loop, it will use the list and a counter for the possible position of x in the list
    (let loop
        ([lst lst] [cont -1])
        (if (empty? lst)
        ;;; If the list is empty we will check if x is at any postion in the list
            (if (and (>= cont 0) (< cont (length lst)))
            ;;; If cont is greater or equal than 0, it will return cont, which is the position of x in the list
            ;;; If not, it will return false, meaning that x is not inside the list
                cont
                #f)
            (if (eq-fun (car lst) x)
                ;;; If the list is not empty, then it will look for x in the list,
                ;;; If x is found, it will add 1 to cont, so that it will always starts at postion 0.
                ;;; If x hasn't been found, it will loop through the rest of the list and add 1 to the counter
                (add1 cont) 
                (loop [cdr lst] [add1 cont])))))

