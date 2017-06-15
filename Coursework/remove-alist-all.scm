; ; ; Coursework 1
; ; ; Question 2
; ; ; Scott Williams saw1g15@soton.ac.uk
; ; ;
; ; ; 27634043
; ; ; remove-alist-all.scm
; ; ; remove-alist-all takes a symbolic expression and an association list and returns a new association list 
; ; ; containing the same associations as in the input list.

(define remove-alist-all
	(lambda (symbol assocList)
		(cond ((null? assocList) assocList)
			  ((not (eq? symbol (caar assocList)))
					(cons (car assocList) (remove-alist-all symbol (cdr assocList))))
			  (else (remove-alist-all symbol (cdr assocList))))))
		
; ; ; The program works by looping over the association list through recursive function calls.
; ; ; In each loop, the program either:
; ; ; 	Returns the association list if the given association list is empty
; ; ; 	Returns the constructed list containing the association list and return value of the function given the cdr of the list if the symbol and the associated symbol are not equal
; ; ;	Recursively calls the function again giving it the cdr of the association list if the symbols are equal.
; ; ; Therefore the function returns an association list where all the matchings from symbol to list element have been removed.