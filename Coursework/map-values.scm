; ; ; Coursework 1
; ; ; Question 4
; ; ; Scott Williams saw1g15@soton.ac.uk
; ; ;
; ; ; 27634043
; ; ; map-values.scm
; ; ; map-values takes an association list and a function and returns a new association list with the same
; ; ; keys in the same order where the values are the result of the fucntion.

(define map-values
	(lambda (assocList function)
		(cond ((null? assocList) assocList)
			(else (cons
				(cons (caar assocList) (function (cdr (car assocList))))
				(map-values (cdr assocList) function))))))

		
; ; ; The program works by looping over the association list through recursive function calls.
; ; ; In each loop, the program either:
; ; ; 	Returns an empty list if the association list is empty
; ; ; 	Returns the constructed pair of the function value of the association list and the value of map-values on the cdr of the list.