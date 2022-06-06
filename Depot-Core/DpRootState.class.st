"
I am the root state that does not show any specific entity.

"
Class {
	#name : #DpRootState,
	#superclass : #DpRouteState,
	#category : #'Depot-Core'
}

{ #category : #'as yet unclassified' }
DpRootState >> bodyComponent [ 
  ^ DpMain new
]
