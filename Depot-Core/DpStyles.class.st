Class {
	#name : #DpStyles,
	#superclass : #LWStylesheetProvider,
	#category : #'Depot-Core'
}

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
