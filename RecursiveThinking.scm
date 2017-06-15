;;;Ours
(define returnsLast
	(lambda (L)
		(if (eq? (cdr L) '())
			L
			(returnsLast (cdr L)))))

;;;His			
(define lastPair
	(lambda (L)
		(if (null? (cdr L))
			L
			(lastPair (cdr L)))))
			
;;;His
(define swap
	(lambda (L)
		(cond ((null? L) L)
			  ((null? (cdr L)) L)
			  (else (cons (cdr L)
						  (cons (car L) (swap (cdr(cdr(L))))))))))
			
;() -> () !			
;(a) -> (a) !
;(a b) -> (b a)
;(a b c) -> (b a c)
;(a b c d) -> (b a d c)

(define listref
	(lambda (L n)
		(if (pair? L)
			(if (= n 0)
				(car L)
				(listref (cdr L) (- n 1)))))
			#f
			
;(a b c d e) 3 -> d
;(a b)4 -> #f