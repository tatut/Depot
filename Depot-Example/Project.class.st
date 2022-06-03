Class {
	#name : #Project,
	#superclass : #DpEntity,
	#instVars : [
		'name',
		'description',
		'epics'
	],
	#category : #'Depot-Example'
}

{ #category : #accessing }
Project >> description [

	^ description
]

{ #category : #accessing }
Project >> description: anObject [

	description := anObject
]

{ #category : #accessing }
Project >> epics [

	^ epics
]

{ #category : #accessing }
Project >> epics: anObject [

	epics := anObject
]

{ #category : #accessing }
Project >> name [

	^ name
]

{ #category : #accessing }
Project >> name: anObject [

	name := anObject
]
