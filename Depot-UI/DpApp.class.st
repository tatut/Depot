"
I am the main LiveWeb component for a Depot application.

I contain the application bar and all common things that are shared
between different pages. 

I have a content that changes based on user navigation.
"
Class {
	#name : #DpApp,
	#superclass : #DpComponent,
	#instVars : [
		'appbar',
		'content'
	],
	#category : #'Depot-UI'
}

{ #category : #accessing }
DpApp >> children [ 
  ^ ReadStream on: { appbar . content }

]

{ #category : #accessing }
DpApp >> content [
	^ content child
]

{ #category : #initialization }
DpApp >> initialize [ 
	super initialize.
	appbar := DpAppBar new.
	content := LWSingleContainer new.
]

{ #category : #rendering }
DpApp >> renderOn: h [ 
  "We can render appbar and content div separately, this 
  app root component is never rerendered completely during page lifecycle."
  appbar render: h.
  content render: h
]

{ #category : #accessing }
DpApp >> setContent: aComponent [
  content child: aComponent 
]
