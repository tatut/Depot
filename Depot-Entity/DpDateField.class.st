Class {
	#name : #DpDateField,
	#superclass : #DpField,
	#category : #'Depot-Entity'
}

{ #category : #converting }
DpDateField >> asLWEditFormComponent: form accessor: accessor [ 
  ^ LWDateEditor new form: form
]
