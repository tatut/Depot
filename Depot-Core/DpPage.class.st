Class {
	#name : #DpPage,
	#superclass : #LWStyledPage,
	#category : #'Depot-Core'
}

{ #category : #accessing }
DpPage class >> value: req [
	^ self new value: req
]

{ #category : #accessing }
DpPage >> body: _args [
  | config | 
  config := DpConfig uniqueInstance.
  config ifNil: [ ^ DpFirstRun new ].
  ^ DpMain new 
]

{ #category : #'push state handling' }
DpPage >> initialPushState [ 
 ^ {  }
]

{ #category : #'as yet unclassified' }
DpPage >> prepareCtx [ 
  super prepareCtx.
  ctx at: #formMessages put: LWFormMessages new.

]

{ #category : #'push state handling' }
DpPage >> pushStateChanged: newPushState [
	body state: newPushState 
]

{ #category : #'as yet unclassified' }
DpPage >> stylesheetProvider [ 
  ^ LWStylesheetProvider provider: DpStyles

]

{ #category : #'push state handling' }
DpPage >> usePushState [ 
  ^ false
]
