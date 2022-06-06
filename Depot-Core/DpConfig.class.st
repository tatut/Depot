Class {
	#name : #DpConfig,
	#superclass : #Object,
	#instVars : [
		'url'
	],
	#classVars : [
		'Config'
	],
	#category : #'Depot-Core'
}

{ #category : #'instance creation' }
DpConfig class >> uniqueInstance [ 
  ^ Config

]

{ #category : #'instance creation' }
DpConfig class >> uniqueInstance: aDpConfig [ 
  Config := aDpConfig 

]

{ #category : #accessing }
DpConfig >> url [

	^ url
]

{ #category : #accessing }
DpConfig >> url: anObject [

	url := anObject
]
