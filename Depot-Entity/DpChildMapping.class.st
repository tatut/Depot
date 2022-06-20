Class {
	#name : #DpChildMapping,
	#superclass : #XtChildMapping,
	#category : #'Depot-Entity'
}

{ #category : #converting }
DpChildMapping >> asDpMappingSource [ 
  ^String streamContents:[:out | out
	  << self class name; << ' of: '; << '#'''; << attribute; << ''' -> #'; << getter;
	  << ' to: '; << entityClass name
	]
]
