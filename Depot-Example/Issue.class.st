Class {
	#name : #Issue,
	#superclass : #DpEntity,
	#instVars : [
		'key',
		'project',
		'type',
		'summary',
		'description',
		'linksTo',
		'linksFrom'
	],
	#category : #'Depot-Example'
}

{ #category : #accessing }
Issue >> description [

	^ description
]

{ #category : #accessing }
Issue >> description: anObject [

	description := anObject
]

{ #category : #accessing }
Issue >> key [

	^ key
]

{ #category : #accessing }
Issue >> key: anObject [

	key := anObject
]

{ #category : #accessing }
Issue >> linksFrom [

	^ linksFrom
]

{ #category : #accessing }
Issue >> linksFrom: anObject [

	linksFrom := anObject
]

{ #category : #accessing }
Issue >> linksTo [

	^ linksTo
]

{ #category : #accessing }
Issue >> linksTo: anObject [

	linksTo := anObject
]

{ #category : #accessing }
Issue >> project [

	^ project
]

{ #category : #accessing }
Issue >> project: anObject [

	project := anObject
]

{ #category : #accessing }
Issue >> summary [

	^ summary
]

{ #category : #accessing }
Issue >> summary: anObject [

	summary := anObject
]

{ #category : #accessing }
Issue >> type [

	^ type
]

{ #category : #accessing }
Issue >> type: anObject [

	type := anObject
]
