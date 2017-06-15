; ; ; Coursework 2
; ; ; Question 5
; ; ; Scott Williams 
; ; ;
; ; ; 
; ; ; tree-filter-cps.scm
; ; ; tree-filter-cps t takes a predicate pred, a tree tree and a continuation cont and passes to the 
; ; ; continuation two results: a tree of the same structure, containing all sets of labels satisfying the 
; ; ; predicate and the empty list otherwise, and a tree of the same structure, containing all sets of 
; ; ; labels not satisfying the predicate and false otherwise.

(define tree-filter-cps
	(lambda (predicate tree continuation)
		#t))
			  
; ; ; I could not grasp continuation passing style.