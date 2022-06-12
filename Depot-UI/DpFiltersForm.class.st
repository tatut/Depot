Class {
	#name : #DpFiltersForm,
	#superclass : #DpComponent,
	#instVars : [
		'onUpdate',
		'filterComponents',
		'entityClass'
	],
	#category : #'Depot-UI'
}

{ #category : #accessing }
DpFiltersForm >> entityClass: aClass [
  entityClass := aClass
]

{ #category : #accessing }
DpFiltersForm >> onUpdate: anObject [

	onUpdate := anObject
]

{ #category : #rendering }
DpFiltersForm >> renderOn: h [
  h div: [
	h span: 'filter form here';
	  button: { #onclick -> [ onUpdate value: 'FIXME' ] } with: 'Fetch' 
]
]
