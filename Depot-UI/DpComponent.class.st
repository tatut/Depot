"
I am the base class for all Depot UI components.
"
Class {
	#name : #DpComponent,
	#superclass : #LWStyledComponent,
	#category : #'Depot-UI'
}

{ #category : #'as yet unclassified' }
DpComponent >> entityLinkAttrs: anEntityClass [
  | router route |
  router := self router.
  route := router matchState: (DpEntityListingState new entity: anEntityClass name).
  ^ { #href -> ('/',anEntityClass name) .
      #onclick -> (ctx goJS: route)  }
]

{ #category : #'as yet unclassified' }
DpComponent >> router [ 
  ^ DpRouter new

]
