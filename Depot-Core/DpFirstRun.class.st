"
I am the first component the user sees when accessing a new Depot instance.

I setup initial configuration: the XTDB URL and admin credentials.


"
Class {
	#name : #DpFirstRun,
	#superclass : #LWStyledComponent,
	#instVars : [
		'url',
		'adminUsername',
		'adminPassword1',
		'adminPassword2',
		'urlOk',
		'urlError'
	],
	#category : #'Depot-Core'
}

{ #category : #initialization }
DpFirstRun >> initialize [
  super initialize.
	url := ''
]

{ #category : #rendering }
DpFirstRun >> renderOn: h [
	h div: [ 
		h div: { self style centeredDialogPanel } with: [
			h div: { self style flexTopToBottom } with: [ 
   		  h h3: 'Welcome to Depot!';
		    div: { self style flexLeftToRight } with: [ 
			 h label: { #for -> #url } with: 'XTDB URL';
			   input: { #id->#url . #name->#url. #type->#text. #value->url };
			   button: { #onClick -> (Js call: [ :newUrl | self testUrl: newUrl ] with: (Js inputValue: #url)) }
			     with: 'Test'.
				].
			urlOk ifNotNil: [ 
				h div: (urlOk ifTrue:'OK' ifFalse: 'ERROR'), ' ', urlError.
				h button: { #disabled -> urlOk not. #onClick -> [ self save ] } with: 'Save and continue'.
			]
	]]] 
	
]

{ #category : #actions }
DpFirstRun >> save [
	DpConfig uniqueInstance: (DpConfig new url: url).
	ctx go: (DpRouter new matchState: (DpRootState new))
]

{ #category : #tests }
DpFirstRun >> testUrl: anUrl [
  | client |
	url := anUrl.
	client := XtClient new url: anUrl.
	[ | status |
	  status := client status.
	  urlOk := true.
	  urlError := 'XTDB version ', status version asString.
	  self changed.
	] on: Error do: [ :err | 
	   urlOk := false.
	   urlError := err printString. 
	   self changed. ]
]
