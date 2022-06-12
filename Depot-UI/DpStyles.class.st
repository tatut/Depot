Class {
	#name : #DpStyles,
	#superclass : #LWStylesheetProvider,
	#category : #'Depot-UI'
}

{ #category : #'as yet unclassified' }
DpStyles >> appbar [ 
 ^ self style: [ :s |
	  self padLeftRight: s of: 3 rem. 
	  s display: #flex; flexDirection: #row; 
	  flexWrap: #wrap; alignItems: #center;
	  height: 74 px; lineHeight: 24 px;
	  boxShadow: 'rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0.1) 0px 1px 3px 0px, rgba(0, 0, 0, 0.06) 0px 1px 2px 0px;'
	]
]

{ #category : #'as yet unclassified' }
DpStyles >> appbarHeader [ 
 ^ self style: [ :s | s 
	  fontSize: 1.25rem;
	  fontWeight: 600;
	  lineHeight: 1.75rem
	]
]

{ #category : #'as yet unclassified' }
DpStyles >> appbarLink [ 
  ^ self style: [ :s | 
	   self padLeftRight: s of: 1 rem.
	   self padTopBottom: s of: 0.5rem.
	   s display: 'inline-block';
	   marginRight: 0.5rem.
	 ]
]

{ #category : #'as yet unclassified' }
DpStyles >> appbarMenu [ 
	^ self style: [ :s | 
		 self padLeftRight: s of: 0.75rem.
		 s alignItems: #center;
		 display: #flex.
		]
]

{ #category : #accessing }
DpStyles >> center: s [
  s position: #absolute; 
	  left: 50 pct;
	  top: 50 pct;
	  transform: 'translateX(-50%) translateY(-50%)' 

]

{ #category : #'as yet unclassified' }
DpStyles >> centeredDialogPanel [ 
 ^ self style: [ :s |
	  self center: s.
	  s borderRadius: 0.5 rem;
	    borderColor: 'blue';
	    borderWidth: 2 px;
		  borderStyle: #solid;
		  padding: 1 rem ]

]

{ #category : #'as yet unclassified' }
DpStyles >> flexLeftToRight [
 ^ self style: [ :s | s
	  display: #flex;
	  flexDirection: #row ]
]

{ #category : #'as yet unclassified' }
DpStyles >> flexTopToBottom [
 ^ self style: [ :s | s
	  display: #flex;
	  flexDirection: #column ]
]

{ #category : #'as yet unclassified' }
DpStyles >> headerCentered [ 
  ^ self style: [ :s | s
	   fontSize: 2 rem;
	   width: 100 pct;
	   textAlign: #center
	   ]

]

{ #category : #'as yet unclassified' }
DpStyles >> padLeftRight: s of: amount [ 
	s paddingLeft: amount; paddingRight: amount.
	^ s
]

{ #category : #'as yet unclassified' }
DpStyles >> padTopBottom: s of: amount [ 
	s paddingTop: amount; paddingBottom: amount.
	^ s
]
