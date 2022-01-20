Class {
	#name : #DpTransaction,
	#superclass : #Object,
	#instVars : [
		'txLogId',
		'txDateAndTime'
	],
	#category : #'Depot-Core'
}

{ #category : #testing }
DpTransaction >> isDpTransaction [
	^ true
]

{ #category : #accessing }
DpTransaction >> txDateAndTime [

	^ txDateAndTime
]

{ #category : #accessing }
DpTransaction >> txDateAndTime: anObject [

	txDateAndTime := anObject
]

{ #category : #accessing }
DpTransaction >> txLogId [

	^ txLogId
]

{ #category : #accessing }
DpTransaction >> txLogId: anObject [

	txLogId := anObject
]
