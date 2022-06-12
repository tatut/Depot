"
I am the base class for all route states in Depot.
"
Class {
	#name : #DpRouteState,
	#superclass : #LWPushStateBase,
	#category : #'Depot-Core'
}

{ #category : #'as yet unclassified' }
DpRouteState >> bodyComponent [ 
	^ LWBlockContainer new block: [ :h | h div: 'Please implement component for route: ', (STON toString: self) ]
]
