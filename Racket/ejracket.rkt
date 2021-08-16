#lang racket
(define (invert_pairs lst)
	(let loop
		([lst lst][new_lst empty])
		(if (empty? lst)
			new_lst
			(loop
				(cdr lst)
				(append new_lst(invert (car lst)))
			)
		)
	)
)