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
		  | where |
		  where := nil.
       (entityClass dpMapping fieldMappings select: #searchable) do: [ :sm |
	      (newFilters perform: sm getter) ifNotNil: [ :val | 
		     | clause |
		     clause := sm search: (e perform: sm getter) value: val.
		     where := where ifNil: [ clause ] ifNotNil: [ where & clause ]
		   ]].
        where
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
