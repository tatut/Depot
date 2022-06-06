Class {
	#name : #DpRouter,
	#superclass : #LWPushStateRouter,
	#category : #'Depot-Core'
}

{ #category : #initialization }
DpRouter >> initialize [
	super initialize.
	self 
	  route: '/' as: DpRouteState;
	  route: '/:entity' as: DpEntityListingState;
	  route: '/:entity/create' as: DpEntityCreateState;
	  route: '/:entity/:id' as: DpEntityViewState. 
]
