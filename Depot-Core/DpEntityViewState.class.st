"
I am the route that is used to view a single entity instance.
"
Class {
	#name : #DpEntityViewState,
	#superclass : #DpEntityRouteState,
	#instVars : [
		'id'
	],
	#category : #'Depot-Core'
}

{ #category : #accessing }
DpEntityViewState >> id [

	^ id
]

{ #category : #accessing }
DpEntityViewState >> id: anObject [

	id := anObject
]
