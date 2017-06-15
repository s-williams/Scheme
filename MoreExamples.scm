; ; ; Gets the depth
; Correct version
(define depth
	(lambda (S)
		(if (atom? S)
			0
			(+ 1 (max (depth (car S)) (depth (cdr S)))))))
			
; Steffans version
(define depth-acc
	(lambda (S d)
		(if (atom? S)
			d
			(max (depth-acc (car S) (+ d 1)) (depth-acc (cdr S) (+ d 1))))))

; ; ; Checks if two lists have the same types for every element			
(define same-struct
	(lambda (s1 s2)
		(cond (and (atom? s1) (atom? s2)) #t)
		(cond (or (atom? s1) (atom? s2)) #f)
		(else (same-struct (car s1) (car s2)))))