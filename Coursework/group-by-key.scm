; ; ; Coursework 1
; ; ; Question 3
; ; ; Scott Williams saw1g15@soton.ac.uk
; ; ;
; ; ; 27634043
; ; ; group-by-key.scm
; ; ; group-by-key takes an association list and returns a new association list in which all values associated
; ; ; with each key have been grouped together in their own list in order of occurence.

(define group-by-key
	(lambda (assocList)
		(define assoc-all
			(lambda (symbol assocList)
				(cond ((null? assocList) assocList)
					((eq? symbol (caar assocList))
							(cons (cdr (car assocList)) (assoc-all symbol (cdr assocList))))
					(else (assoc-all symbol (cdr assocList))))))
					
		(define remove-alist-all
			(lambda (symbol assocList)
				(cond ((null? assocList) assocList)
					((not (eq? symbol (caar assocList)))
							(cons (car assocList) (remove-alist-all symbol (cdr assocList))))
					(else (remove-alist-all symbol (cdr assocList))))))

	
		(cond ((null? assocList) assocList)
			(else (cons 
				(cons (caar assocList) (assoc-all (caar assocList) assocList)) 
				(group-by-key (remove-alist-all (caar assocList) assocList)))))))
		
; ; ; This program works by utilising assoc-all and remove-alist-all from previous questions
; ; ; The program uses internally defined functions and returns a constructed pair consisting of the expression values and its list of values associated with that expression
; ; ; As well as the result of a recursive call to group-by-key giving it the association list with that symbol removed.