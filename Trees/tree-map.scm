; ; ; Coursework 2
; ; ; Question 2
; ; ; Scott Williams 
; ; ;
; ; ; 
; ; ; tree-map.scm
; ; ; tree-map takes a function f and a binary tree tree, and returns the binary tree resulting from the 
; ; ; application of the function f to all sets of labels in tree.
; ; ; remove-labels takes a set of labels (expressed as a list) and a tree as argument, and removes all
; ; ; occurrences of these labels from all nodes and leaves of the tree.

(define tree-map
	(lambda (function tree)
		(cond ((leaf? tree) (make-leaf (function (tree-labels tree))))
			  ((node? tree) (make-node (function (tree-labels tree)) 
									   (tree-map function (node-left tree)) 
									   (tree-map function (node-right tree)))))))

(define remove-labels
	(lambda (labels tree)
		(cond ((leaf? tree) (make-leaf (set-minus (tree-labels tree) labels)))
			  ((node? tree) (make-node (set-minus (tree-labels tree)
									   (remove-labels labels (node-left tree))
									   (remove-labels labels (node-right tree))))))))
																		  
; ; ; My implementation of tree-map simply returns a new leaf with the function applied to the labels if
; ; ; the tree is a leaf or returns a new node with the function applied to the labels recursively calling 
; ; ; itself to find the new left and right subtrees.
; ; ; My implementation of remove-labels returns a new leaf with the set-minus function applied to the 
; ; ; tree-labels and the given labels if the tree is a leaf or returns a new node with the set-minus
; ; ; function applied to the labels recursively calling itself to find the left and right subtrees.