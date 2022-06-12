Class {
	#name : #DpListing,
	#superclass : #DpComponent,
	#instVars : [
		'entityClass',
		'items',
		'viewName'
	],
	#category : #'Depot-UI'
}

{ #category : #initialization }
DpListing >> initialize [ 
  super initialize.
  viewName := 'summary'

]

{ #category : #accessing }
DpListing >> items: aCollection [
  items := aCollection.
  entityClass := items first class.
]

{ #category : #rendering }
DpListing >> renderOn: h [
	h div: { #class->'depot-listing' } with: [ 
		items do: [ :item | item render: h view: viewName  ]
  ]
]
