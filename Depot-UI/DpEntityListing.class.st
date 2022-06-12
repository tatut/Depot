Class {
	#name : #DpEntityListing,
	#superclass : #DpComponent,
	#instVars : [
		'filtersComponent',
		'listingComponent',
		'entityClass'
	],
	#category : #'Depot-UI'
}

{ #category : #initialization }
DpEntityListing >> children [ 
  ^ ReadStream on: { filtersComponent . listingComponent  }	
]

{ #category : #accessing }
DpEntityListing >> entityClass: aClass [
	entityClass := aClass.
	filtersComponent entityClass: entityClass
]

{ #category : #initialization }
DpEntityListing >> initialize [
	super initialize.
	filtersComponent := DpFiltersForm new onUpdate: [ :newFilters | self performQuery: newFilters ].
	listingComponent := LWSingleContainer new.
	
]

{ #category : #'as yet unclassified' }
DpEntityListing >> performQuery: newFilters [
	listingComponent child: (LWBlockContainer new block: [ :h | h div: 'Loading...' ]).
	[ | results |
	  results := (self xt q: entityClass where: [ :e | 
		"FIXME: dummy query as we don't have the form yet"
		(e perform: entityClass instVarNames first) isPresent 
		]) .
	  results isEmpty 
	    ifTrue: [ listingComponent child: (LWBlockContainer new block: [:h | h div: 'No results' ]) ]
	    ifFalse: [ listingComponent child: (DpListing new items: results) ]
	] fork.
	Transcript show: 'do something with ', (STON toString: newFilters);cr.
]

{ #category : #rendering }
DpEntityListing >> renderOn: h [
  h div: [ 
	 filtersComponent render: h.
	 listingComponent render: h.
	]
	
]
