; ; ; This does something
(define assoc-all
	(lambda (n L)
		(cond ((null? L) #f)
		(assoc-all-iter n L '()))))
			  
(define assoc-all-iter
	(lambda (n L R)
		(if (null? L)
			R
			(if (eq? n (caar L))
				(append R (cdr (car L)))
				(assoc-all-ter n (cdr L) R)))))
