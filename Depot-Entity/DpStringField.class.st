"
I model a field whose value is a string.
I can also have a maximum length and regular expression pattern that
the string must satisfy.
"
Class {
	#name : #DpStringField,
	#superclass : #DpField,
	#instVars : [
		'maxLength',
		'pattern'
	],
	#category : #'Depot-Entity'
}

{ #category : #converting }
DpStringField >> asLWEditFormComponent: form accessor: accessor [ 
  ^ LWStringEditor new form: form
]

{ #category : #'as yet unclassified' }
DpStringField >> search: e value: val [
  ^ e textSearch: val
]
