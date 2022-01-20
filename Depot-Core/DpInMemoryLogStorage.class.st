Class {
	#name : #DpInMemoryLogStorage,
	#superclass : #DpLogStorage,
	#instVars : [
		'txId',
		'listeners',
		'transactions',
		'txSemaphore'
	],
	#category : #'Depot-Core'
}

{ #category : #initialization }
DpInMemoryLogStorage >> initialize [ 
  super initialize.
  listeners := IdentitySet new.
  transactions := OrderedCollection new.
  txId := 0.
  txSemaphore := Semaphore forMutualExclusion 
]

{ #category : #accessing }
DpInMemoryLogStorage >> lastTxId [
  ^ txId
]

{ #category : #'as yet unclassified' }
DpInMemoryLogStorage >> listen: aListenerBlock [
	listeners add: aListenerBlock 
]

{ #category : #'as yet unclassified' }
DpInMemoryLogStorage >> listen: aListenerBlock startingFrom: firstTxId [
	listeners add: aListenerBlock 
]

{ #category : #'as yet unclassified' }
DpInMemoryLogStorage >> submit: txInstance [
  | tx id |
	tx := txInstance copy.
  	txSemaphore critical: [ 
		id := txId.
		txId := txId + 1.
		tx txLogId: id; txDateAndTime: DateAndTime now.
		transactions add: tx.
		listeners do: [ :l | l value: tx ]
  ].
  ^ id
  
	
]
