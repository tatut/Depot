Class {
	#name : #DpEntityListingState,
	#superclass : #DpEntityRouteState,
	#category : #'Depot-Core'
}

{ #category : #'as yet unclassified' }
DpEntityListingState >> bodyComponent [ 
	^ DpEntityListing new entityClass: self entityClass
]
