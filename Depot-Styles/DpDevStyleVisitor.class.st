Class {
	#name : #DpDevStyleVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'strings'
	],
	#category : #'Depot-Styles'
}

{ #category : #initialization }
DpDevStyleVisitor >> initialize [
	strings := Set new.
]

{ #category : #accessing }
DpDevStyleVisitor >> strings [
	^ strings
]

{ #category : #visiting }
DpDevStyleVisitor >> visitLiteralNode: aNode [
  (aNode value isKindOf: String) ifTrue: [ 
	  strings add: aNode value.
	].
  
]
