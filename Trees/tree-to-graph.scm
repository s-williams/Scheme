; ; ; Coursework 2
; ; ; Question 4
; ; ; Scott Williams 
; ; ;
; ; ; 
; ; ; tree-to-graph.scm
; ; ; tree-to-graph t takes a binary tree and returns a graph, represented as a set of vertices and edges
; ; ; this set is expressed as a list.

(define tree-to-graph
	(lambda (tree)
		(cond ((leaf? tree) (list (list 'vertex 't (tree-labels tree))))
			  ((node? tree) (append
								(tree-to-graph-iter 
											(node-left tree) 
											'tl 
											(list (list 'vertex 't (tree-labels tree)) '(edge t tr) '(edge t tl)))
								(tree-to-graph-iter 
											(node-right tree) 
											'tr 
											(list (list 'vertex 't (tree-labels tree)) '(edge t tr) '(edge t tl))))))))
			  
(define tree-to-graph-iter
	(lambda (tree label graph)
		(cond ((leaf? tree) (append graph (list (list 'vertex label (tree-labels tree)))))
			  ((node? tree) (append
								(tree-to-graph-iter 
											(node-left tree) 
											(create-label (list 'l label)) 
											(append graph (list (list 'vertex label (tree-labels tree)) (list 'edge label (create-label (list 'r label))) (list 'edge label (create-label (list 'l label))))))
								(tree-to-graph-iter 
											(node-right tree) 
											(create-label (list 'r label)) 
											(append graph (list (list 'vertex label (tree-labels tree)) (list 'edge label (create-label (list 'r label))) (list 'edge label (create-label (list 'l label)))))))))))
			  
(define create-label
	(lambda (l)
		(string->symbol (symbol-append-reverse l))))
		
(define symbol-append-reverse
	(lambda (los)
		(if (null? los)
			""
			(string-append (symbol-append-reverse (cdr los))
						   (symbol->string (car los))))))

; ; ; My implementation uses a helper function to track the graph so far. The initial function that is 
; ; ; called first checks if the tree is a leaf and returns the appropiate list if it is. If the tree is a 
; ; ; node, the function calls the helper function twice, passing in the two subtrees, the path label, and 
; ; ; the graph list so far. The helper functions create-label and symbol-append-reverse are used to 
; ; ; create the new labels by concatenating two symbols. They are given in the coursework.