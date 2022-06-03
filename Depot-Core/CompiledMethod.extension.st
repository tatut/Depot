Extension { #name : #CompiledMethod }

{ #category : #'*Depot-Core' }
CompiledMethod >> dpViewRefersTo [
	"Return all the instance variables this view method refers to"
	(self hasPragmaNamed: #dpView:) ifFalse: [ self error: 'Not a view method!' ].
	^ (self instanceVariableReadNodes collect: [ :n | n variable name ] as: Set) asOrderedCollection 
]
