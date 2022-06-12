Class {
	#name : #DpPage,
	#superclass : #LWStyledPage,
	#category : #'Depot-Core'
}

{ #category : #public }
DpPage class >> handleRequest: aRequest [
  Transcript show: aRequest uri;cr.
	aRequest uri path = '__liveweb' ifTrue: [ ^ LWPageConnection value: aRequest ].
	^ self new value: aRequest. 
]

{ #category : #accessing }
DpPage class >> value: req [
	^ self new value: req
]

{ #category : #accessing }
DpPage >> body: _args [
  | state |
  state := self initialPushState. 
  ^ DpApp new setContent: state bodyComponent 
]

{ #category : #'push state handling' }
DpPage >> initialPushState [ 
 DpConfig uniqueInstance ifNil: [ ^ DpFirstRunState new ].
 ^ DpRouter new match: args uri.
]

{ #category : #'as yet unclassified' }
DpPage >> prepareCtx [ 
  super prepareCtx.
  ctx at: #formMessages put: LWFormMessages new.

]

{ #category : #'push state handling' }
DpPage >> pushStateChanged: newPushState [
  | state |
  state := DpRouter new fromPushStateJSON: newPushState.
	body setContent: state bodyComponent 
]

{ #category : #'as yet unclassified' }
DpPage >> stylesheetProvider [ 
  ^ LWStylesheetProvider provider: DpStyles

]

{ #category : #'push state handling' }
DpPage >> usePushState [ 
  ^ false
]
