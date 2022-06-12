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

{ #category : #'as yet unclassified' }
DpEntity class >> dpMapping [ 
	"Return the Depot specialized XTDB mapping for this class, subclasses must implement."
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DpEntity class >> viewNamed: aString [
  ^ self views detect: [ :m | ((m pragmaAt: #dpView:) argumentAt: 1) = aString ]
]

{ #category : #'as yet unclassified' }
DpEntity class >> views [
  ^ self methods select: [ :m | m hasPragmaNamed: #dpView: ]
]

{ #category : #accessing }
DpEntity class >> xtMapping [ 
	^ (XtEntityMapping withAll: { 
		#':xt/id' -> #_xtId
	 }), (self dpMapping)
]

{ #category : #accessing }
DpEntity >> _xtId [

	^ _xtId
]

{ #category : #accessing }
DpEntity >> _xtId: anObject [

	_xtId := anObject
]

{ #category : #rendering }
DpEntity >> render: h view: viewName [ 
	self perform: (self class viewNamed: viewName) selector with: h
]
