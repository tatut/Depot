"
I represent the storage of change logs in a given system.
New transactions are submitted to the log. 
Logs can be retrieved by the system for processing.

The storage is abstract and can conceptually be anything, like in-memory, local files
or shared databases.

"
Class {
	#name : #DpLogStorage,
	#superclass : #Object,
	#instVars : [
		'serializer',
		'materializer'
	],
	#category : #'Depot-Core'
}

{ #category : #initialization }
DpLogStorage >> initialize [ 
	serializer := FLSerializer newDefault.
	materializer := FLMaterializer newDefault.
]

{ #category : #accessing }
DpLogStorage >> lastTxId [
	"Return the last transaction id number known to this log storage at this time."
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DpLogStorage >> listen: aListenerBlock [ 
  "Add listener that listens to new transactions. The block will be called with the 
  transaction id and the transaction instance in order."
  self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DpLogStorage >> listen: aListenerBlock startingFrom: txId [
  "Add listener that starts listening from the given txId. 
  If there are transactions with id <= txId, the listener will be immediately
  called to replay past transactions."
  self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
DpLogStorage >> submit: aTxInstance [
  self subclassResponsibility 
]
