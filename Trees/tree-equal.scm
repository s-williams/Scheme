; ; ; Coursework 2
; ; ; Question 1
; ; ; Scott Williams 
; ; ;
; ; ; 
; ; ; tree-equal.scm
; ; ; tree-equal? expects two binary trees and returns true if they are the same,and false otherwise.

(define tree-equal?
	(lambda (tree1 tree2)
		(cond ((and (null? tree1) (null? tree1)) #t)
			  ((or (null? tree1) (null? tree2)) #f)
			  ((and (node? tree1) (leaf? tree2)) #f)
			  ((and (leaf? tree1) (node? tree2)) #f)
			  ((and (and (leaf? tree1) (leaf? tree2)) 
					(set-equal? (tree-labels tree1) (tree-labels tree2))) #t)
			  ((and (and (leaf? tree1) (leaf? tree2))
					(not (set-equal? (tree-labels tree1) (tree-labels tree2)))) #f)
			  ((and (node? tree1) (node? tree2)) (and (tree-equal? (node-left tree1) (node-left tree2)) 
													  (tree-equal? (node-right tree1) (node-right tree2)))))))
													  
; ; ; My implementation checks every possibility of the nodes being a null, being a node, or being a leaf
; ; ; and returns true or false depending on which. It only recognises the need to recursively call itself 
; ; ; if both trees are nodes. In which case, it returns the logical and operation of the recursive calls
; ; ; of examining the left tree and examining the right tree.