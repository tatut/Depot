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

{ #category : #'as yet unclassified' }
Project class >> dpMapping [
	^ XtEntityMapping withAll: { 
	  DpStringField of: #':project/name' -> #name.
	  DpStringField of: #':project/description' -> #description 
	}
]

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

{ #category : #'as yet unclassified' }
Project >> summaryView: h [
  <dpView: 'summary'>
  h div: [ 
	 h div: [ h b: 'Name:'; span: name ];
	   div: [ h b: 'Description: '; span: description ]
	 ]

]
