(define factorial
	(lambda (n)
		(cond (=  n 0) (1))
		(else (* n (factorial (- n 1s))))))

(define fact
	(lambda (n)
		(if (= n 0)
			1
			(* n (fact (- n 1))))))
			
(define sum
	(lambda (n)
		(if (= n 0)
			0
			(+ n (sum (- n 1))))))
			
(define fibonnaci
	(lambda (n)
		(cond (= n 0) (0))
		(cond (= n 1) (1))
		(else (+ (fibonnaci(- n 2)) (fibonnaci(- n 1))))))

; ; ; Comment
(define fib
	(lambda (n)
		(if (or (= n 1) (= n 0))
			1
			(+ (fibonnaci(- n 2)) (fibonnaci(- n 1))))))
			
(define sumList
	(lambda (L)
		(if (eq? L '())
			0
			(+ (car L) (sumList (cdr L))))))