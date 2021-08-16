#|
Implement a deterministic finite automata

10/03/21
|#

#lang racket
(require racket/trace)

(define (validate-string input-string dfa)

" Determine if the input string is accepted by dfa
example: (validate-string 'ababab' (list accept-start-ba 'q0 '(q2)))
Arguments:
input-string - string
dfa-list with these elements
    -transition function
    -start state
    -list of accept states
Return: boolean"

(let loop
    ([lst (string->list input-string)]
    [state (cadr dfa)]  ;the second element in the list
    [transition (car dfa)])   ;el 1 elemento de dfa
    (if (empty? lst)
    ;Check if the final state is in the list of acceptables
        (member state (caddr dfa))
        ;recursive call
        (loop
            (cdr lst)
            ;get the next state
            (transition state (car lst))
            ;pass the same function again
            transition)))
)
    
(define (accept-start-ba state symbol)
    (cond
        [(eq? state 'q0) (cond
            [(eq? symbol #\a) 'q3]
            [(eq? symbol #\b) 'q1])]
        [(eq? state 'q1) (cond
            [(eq? symbol #\a) 'q2]
            [(eq? symbol #\b) 'q3])]
        [(eq? state 'q2) (cond
            [(eq? symbol #\a) 'q2]
            [(eq? symbol #\b) 'q2])]
        [(eq? state 'q3) (cond
            [(eq? symbol #\a) 'q3]
            [(eq? symbol #\b) 'q3])])
)