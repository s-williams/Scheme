; ; ; Coursework 1
; ; ; Question 1
; ; ; Scott Williams
; ; ;
; ; ; 
; ; ; assoc-all.scm
; ; ; assoc-all takes a symbolic expression and an association list and returns
; ; ; the list of values associated with that expression, in the order they occur in the association list.

(define assoc-all
	(lambda (symbol assocList)
		(cond ((null? assocList) assocList)
			  ((eq? symbol (caar assocList))
					(cons (cdr (car assocList)) (assoc-all symbol (cdr assocList))))
			  (else (assoc-all symbol (cdr assocList))))))
			  
; ; ; The program works by looping over the association list through recursive function calls.
; ; ; In each loop, the program either:
; ; ; 	Returns the list given to it if that list is empty
; ; ; 	Returns the construction of the associated symbol and the return value of the function with the cdr of the association list if the symbol given matches the symbol in the association list.
; ; ;	Recursively calls itself with the cdr of the association list. 
