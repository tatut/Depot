"
I am the base route state for all routes in the context of an
entity type.

I have the entity instance variable that names the entity class.
"
Class {
	#name : #DpEntityRouteState,
	#superclass : #DpRouteState,
	#instVars : [
		'entity'
	],
	#category : #'Depot-Core'
}

{ #category : #accessing }
DpEntityRouteState >> entity [

	^ entity
]

{ #category : #accessing }
DpEntityRouteState >> entity: anObject [

	entity := anObject
]
