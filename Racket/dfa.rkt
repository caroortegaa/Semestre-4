#|
Implement a Deterministic Finite Automata

Sebastian Juncos
Ximena Gonzalez
Carolina Ortega
10/03/2021
|#

#lang racket

(require racket/trace)

(define (arithmetic-lexer input-string dfa)
  " Determine if the input string is accepted by the dfa
  Ex: (arithmetic-lexer 'abababa' (list accept-start-ba 'q0 '(q2)))
  Arguments:
  input-string - string
  dfa - list with these elements
            * transition function
            * start state
            * list of accept states
  Return: boolean "
  (let loop
    ([lst (string->list input-string)] ; Change input-string to a list
     [state (cadr dfa)]      ; The second element in the list
     [token-list empty]      ; The list for storing each type of  element passed into the function
     [transition (car dfa)]  ; The first element in the list
     [tokens empty])    ; New list for generating each token
     ; If there are no values in lst enter the condition
    (if (empty? lst) 
        ; Check if the final state is in the list of acceptables
        (if (member state (caddr dfa)) ;last element of the 1st variable
            ; Return the list of tokens and the last accepted state with its token
            (append token-list (list (list (list->string tokens) state)))
            #f)
        (let-values
          ; Receives the state and the type 
          ([(state token-type) (transition state (car lst))])
          ; Recursive call
          (loop
          ; Use same order as loop
            (cdr lst)
            state
            ; Add valid tokens to the list
            (if token-type
            ; list receives 2 elements
              (append token-list (list (list (list->string tokens) token-type)))
              token-list)
                ; Pass the same function again
             transition
             ; When the list doesn't receive a token-type it stays empty
            (if token-type
                empty
                ; Add to the list tokens the first element in lst
                (append tokens (list (car lst)))))))))

(define (accept-simple-arithmetic state symbol)
  " Accepts arithmetic expressions with positive integers"
  (let
     ; Declare ops as a list containing the symbols that will be used
    ([ops (list #\= #\+ #\- #\* #\/ #\^)])
    (cond
    ; 
        [(eq? state 'q0) (cond
                [(char-numeric? symbol) (values 'int #f)]
                [(eq? symbol #\space) (values 'q0 #f)]
                [(char-alphabetic? symbol) (values 'var #f)]
                [(eq? symbol #\() (values 'o_par #f)]
                [else (values 'invalid #f)])]
        [(eq? state 'var)(cond
                [(eq? symbol ops) (values 'oper 'var)]
                [(eq? symbol #\) ) (values 'c_par 'var)]
                [(eq? symbol #\space) (values 'v_sp 'var)]
                [(char-alphabetic? symbol) (values 'var #f)] 
                [else (values 'invalid #f)])]
        [(eq? state 'v_sp)(cond
                [(eq? symbol #\) ) (values 'c_par #f)]
                [(eq? symbol ops) (values 'oper #f)]
                [else (values 'invalid #f)])]
        [(eq? state 'int) (cond
                [(char-numeric? symbol) (values 'int #f)]
                [(char-alphabetic? symbol) (values 'var 'int)]
                [(eq? symbol #\.) (values 'dot #f)]
                ;[(eq? symbol #\^) 'e]
                [(member symbol ops) (values 'oper 'int)]
                [(eq? symbol #\space) (values 'n_sp 'int)]
                [else (values 'invalid #f)])]
        [(eq? state 'c_par)(cond
                [(char-numeric? symbol) (values 'int 'c_par)]
                [(eq? symbol ops) (values 'oper 'c_par)]
                [(eq? symbol #\space) (values 'c_par_sp 'c_par)]
                [else (values 'invalid #f)])]
        [(eq? state 'dot) (cond
                [(char-numeric? symbol) (values 'float #f)]
                [else (values 'invalid #f)])]
        [(eq? state 'float) (cond
                [(char-numeric? symbol) (values 'float #f)]
                [(member symbol ops) (values 'oper 'float)]
                [(eq? symbol #\space) (values 'n_sp 'float)]
                [else (values 'invalid #f)])]
        [(eq? state 'n_sp) (cond
                [(member symbol ops) (values 'oper #f)]
                [(eq? symbol #\space) (values 'n_sp #f)]
                [(eq? symbol #\) ) (values 'c_par #f)]
                [else (values 'invalid #f)])]
        [(eq? state 'oper) (cond
                [(char-numeric? symbol) (values 'int 'oper)]
                [(eq? symbol #\space) (values 'o_sp 'oper)]
                [(char-alphabetic? symbol) (values 'var 'oper)]
                [(eq? symbol #\( ) (values 'o_par 'oper)]
                [(eq? symbol #\/ ) (values 'com #f)]
                [else (values 'invalid #f)])]
        [(eq? state 'o_sp) (cond
                [(char-numeric? symbol) (values 'int #f)]
                [(eq? symbol #\space) (values 'o_sp #f)]
                [(char-alphabetic? symbol) (values 'var #f)]
                [(eq? symbol #\( ) (values 'o_par #f)]
                [else (values 'invalid #f)])]
        [(eq? state 'o_par)(cond
                [(char-alphabetic? symbol) (values 'var 'o_par) ]
                [(char-numeric? symbol) (values 'int 'o_par)]
                [(eq? symbol ops) (values 'oper 'o_par)]
                [(eq? symbol #\space) (values 'o_par_sp #f)]
                [else (values 'invalid #f)])]
        [(eq? state 'o_par_sp)(cond
                [(char-alphabetic? symbol) (values 'var #f)] 
                [(char-numeric? symbol) (values 'int #f)]
                [(eq? symbol ops) (values 'oper #f)]
                [(eq? symbol #\space) (values 'o_par_sp #f)]
                [else (values 'invalid #f)])]
        [(eq? state 'c_par_sp)(cond
                [(eq? symbol ops) (values 'oper #f)]
                [else (values 'invalid #f)])]
        [(eq? state 'com) (values 'com '#f)]
        [(eq? state 'invalid) (cond
                [(char-numeric? symbol) (values 'invalid 'invalid)]
                [else (values 'invalid #f)])])))