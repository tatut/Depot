"
I am a Depot system. I provide object prevalence. 
I have a data object that is entirely user specified. I keep a 
transaction log of all changes made to the data object.

I can also take snapshots that serialize the current state of the host object
without needing to replay the full log when materializing the data from storage.
"
Class {
	#name : #DpSystem,
	#superclass : #Object,
	#instVars : [
		'data',
		'logStorage',
		'snapshotStorage',
		'txSemaphore'
	],
	#category : #'Depot-Core'
}

{ #category : #execution }
DpSystem >> execute: aTxInstance [
	"Execute a transaction. 
	
	Execution is done asynchronously by sending it to the transaction 
	log for storage. After the log has stored the tx with and id,
	it will call the system to actually process the transaction code."
	aTxInstance isDpTransaction ifFalse: [ Error new signal: 'Tx must be instance of DpTransaction instance!' ].
  logStorage submit: aTxInstance 
]
