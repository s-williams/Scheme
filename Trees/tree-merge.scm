; ; ; Coursework 2
; ; ; Question 3
; ; ; Scott Williams 
; ; ;
; ; ; 
; ; ; tree-merge.scm
; ; ; tree-merge  takes two binary trees and returns a new binary tree, resulting from the merge of nodes 
; ; ; and leaves in corresponding positions in the two trees; nodes and leaves in one of the trees without 
; ; ; correspondant in the other tree belong to the result at the corresponding position.

(define tree-merge
	(lambda (tree1 tree2)
		(cond ((and (leaf? tree1) (leaf? tree2)) (make-leaf (set-union (tree-labels tree1) (tree-labels tree2))))
			  ((and (node? tree1) (leaf? tree2)) (make-node (set-union (tree-labels tree1) (tree-labels tree2))
															(node-left tree1)
															(node-right tree1)))
			  ((and (leaf? tree1) (node? tree2)) (make-node (set-union (tree-labels tree1) (tree-labels tree2))
															(node-left tree2)
															(node-right tree2)))
			  ((and (node? tree1) (node? tree2)) (make-node (set-union (tree-labels tree1) (tree-labels tree2))
															(tree-merge (node-left tree1) (node-left tree2))
															(tree-merge (node-right tree1) (node-right tree2)))))))
															
; ; ; There are four possibilities when taking two trees: both are leaves, both are nodes, or one is leaf 
; ; ; and one is node. With this in mind, my implementation looks at each possibility in turn and actions 
; ; ; are taken based on this. If both trees and leaves, a new leaf is created unioning the labels. If one 
; ; ; is a node and the other a leaf, a new node is created unioning the labels and adding the subtree of 
; ; ; the node. If both are nodes, the labels are unioned again but this time the subtrees are recursive 
; ; ; calls with both subtrees as parameters.