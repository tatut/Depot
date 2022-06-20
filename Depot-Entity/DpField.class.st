Class {
	#name : #DpField,
	#superclass : #XtFieldMapping,
	#instVars : [
		'searchable'
	],
	#category : #'Depot-Entity'
}

{ #category : #converting }
DpField class >> asDpMappingSource [
  "Return this as source code for building a mapping."

]

{ #category : #'instance creation' }
DpField class >> of: attributeGetterAssociation [
  ^ self new configureMapping: attributeGetterAssociation 
]

{ #category : #converting }
DpField >> asDpMappingSource [
  "Return this as source code for building a mapping."
  ^ String streamContents: [ :out | out 
	   << '('; << self class name; << ' of: #'''; << attribute; << ''' -> #'; << getter; << ')'.
	   searchable ifTrue: [ out << ' beSearchable' ] 
	   ]
]

{ #category : #'as yet unclassified' }
DpField >> beSearchable [
	searchable := true
]

{ #category : #initialization }
DpField >> initialize [ 
  super initialize.
  searchable := false
]

{ #category : #accessing }
DpField >> key [ 
  ^ getter 
]

{ #category : #'as yet unclassified' }
DpField >> search: entityBuilder value: filterValue [
 self subclassResponsibility 
]

{ #category : #accessing }
DpField >> searchable [

	^ searchable
]
