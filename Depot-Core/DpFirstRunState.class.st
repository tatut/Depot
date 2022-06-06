Class {
	#name : #DpFirstRunState,
	#superclass : #DpRouteState,
	#category : #'Depot-Core'
}

{ #category : #'as yet unclassified' }
DpFirstRunState >> bodyComponent [ 
  ^ DpFirstRun new
]
