"
I represent the base class for all entities stored to XTDB.
Subclasses should merge their xtMapping with the base mapping.

An entity can contain different HTML rendering views of the entity.
These are methods that take a LiveWeb HTMLRenderer as argument
and contain a dpView: pragma with the view name (eg. 'summary' or 'card').
 
"
Class {
	#name : #DpEntity,
	#superclass : #Object,
	#instVars : [
		'_xtId'
	],
	#category : #'Depot-Core'
}

{ #category : #accessing }
DpEntity class >> xtMapping [ 
	^ XtEntityMapping withAll: { 
		#':xt/id' -> #_xtId
	 }
]

{ #category : #accessing }
DpEntity >> _xtId [

	^ _xtId
]

{ #category : #accessing }
DpEntity >> _xtId: anObject [

	_xtId := anObject
]
