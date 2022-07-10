Class {
	#name : #DpDevStyleListener,
	#superclass : #Object,
	#classVars : [
		'allStrings',
		'jsonFile',
		'lastAnnouncement'
	],
	#category : #'Depot-Styles'
}

{ #category : #'as yet unclassified' }
DpDevStyleListener class >> allStrings [
  ^ allStrings
]

{ #category : #'as yet unclassified' }
DpDevStyleListener class >> jsonFile: aFile [
	jsonFile := aFile
]

{ #category : #accessing }
DpDevStyleListener class >> lastAnnouncement [ 
  ^ lastAnnouncement 

]

{ #category : #'as yet unclassified' }
DpDevStyleListener class >> listen [ 
  SystemAnnouncer uniqueInstance
	  when: MethodAnnouncement 
	  send: #methodAnnouncement:
	  to: self

]

{ #category : #'as yet unclassified' }
DpDevStyleListener class >> methodAnnouncement: anAnnouncement [
  | visitor |
  lastAnnouncement := anAnnouncement.
  visitor := DpDevStyleVisitor new.
  anAnnouncement method ast acceptVisitor: visitor.
  allStrings ifNil: [ allStrings := Set new ].
  allStrings addAll: visitor strings.
  self writeStrings.
]

{ #category : #writing }
DpDevStyleListener class >> writeStrings [
  jsonFile ifNil: [ ^ nil ].
  jsonFile writeStreamDo: [ :out | out << (STON toJsonString: allStrings asArray) ]
]
