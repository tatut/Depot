"
I am a form for editing filter values to search entities by.
"
Class {
	#name : #DpFiltersForm,
	#superclass : #LWEditForm,
	#instVars : [
		'onUpdate'
	],
	#category : #'Depot-UI'
}

{ #category : #accessing }
DpFiltersForm >> entityClass: aClass [
  entityClass := aClass
]

{ #category : #'as yet unclassified' }
DpFiltersForm >> fieldDefinitions [ 
  ^ entityClass dpMapping fieldMappings select: #searchable
]

{ #category : #accessing }
DpFiltersForm >> onUpdate: anObject [

	onUpdate := anObject
]

{ #category : #rendering }
DpFiltersForm >> renderOn: h [
  h div: [
	super renderOn: h.
	h button: { #onclick -> [ onUpdate value: self entity ] } with: 'Fetch' 
]
]
