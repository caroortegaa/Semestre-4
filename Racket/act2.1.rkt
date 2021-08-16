#lang racket

;;; Actividad 2.1 Programación funcional, parte 1
;;; Sebastian Juncos A01022629
;;; Carolina Ortega A01025254
;;; Ximena Gonzalez A01028604
;;; 4 de Marzo de 2021


;;; 12
(define (invert-pairs lst)

    (let loop
        ([lst lst] [res empty])
        (if (empty? lst)
            res

            (loop
                (cdr lst)
                (append res (list(reverse (car lst))) )))))

;;; 13
(define (list-of-symbols? lst)
    (define res #t)
    (for ([i lst])
        #:break (equal? res #f)
        (set! res(symbol? i))) 
    (display res))

;;; 14
(define (swapper a b lst)
    (let loop
        ([lst lst][result empty])
        (if (empty? lst)
            (reverse result)
            (loop
                (cdr lst)
                (cond
                    [(equal? a (car lst)) (cons b result)]
                    [(equal? b (car lst)) (cons a result)]
                    [else (cons (car lst) result )])))))

;;; 18
(define (multi n lst)
    (make-list n (car lst)))

(define (replic n lst)
    (let loop
        ([lst lst][res empty])
        (if (empty? lst)
            res
            (loop
                (cdr lst)
                (append res (multi n (list(car lst))))))))