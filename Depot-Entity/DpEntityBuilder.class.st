"
I am a development time helper to conveniently build new entity 
classes with a fluid builder syntax.

"
Class {
	#name : #DpEntityBuilder,
	#superclass : #Object,
	#instVars : [
		'name',
		'mapping',
		'mappings'
	],
	#category : #'Depot-Entity'
}

{ #category : #adding }
DpEntityBuilder >> addField: aMapping forName: accessorName [
  | attrName |
	attrName := (String streamContents: [:n | n 
		<< ':'; 
		<< name;
		<< '/';
		<< accessorName ]) asSymbol.
	aMapping configureMapping: attrName -> accessorName.
	^ self addMapping: aMapping 
]

{ #category : #adding }
DpEntityBuilder >> addMapping: aMapping [
	mappings ifNil: [ mappings := OrderedCollection new ].
	mappings add: aMapping.
	^ aMapping
]

{ #category : #building }
DpEntityBuilder >> build [
  | cls fields |
  fields := mappings collect: #getter.
  cls := DpEntity subclass: name instanceVariableNames: (' ' join: fields) classVariableNames: '' poolDictionaries: '' category: 'Depot-User'.
  self buildAccessors: cls.
  self buildDpMapping: cls.
]

{ #category : #building }
DpEntityBuilder >> buildAccessors: cls [
  self fields do: [:get |  cls compile: get , ' 
	 ^ ' , get.
        cls compile: get , ': anObject 
	 ' , get , ' := anObject. 
	 ^ self' ]
]

{ #category : #'as yet unclassified' }
DpEntityBuilder >> buildDpMapping: cls [
  "Compile the dpMapping method"
  cls class compile: (String streamContents: [:out | out 
	  << 'dpMapping'; << Character cr;
	  << '  ^ XtEntityMapping withAll: {
  '.
	  mappings doWithIndex: [ :f :i |
		  i > 1 ifTrue:[out << '.
  '].
		  out << f asDpMappingSource.
	  ].
	  out << '}'
	])
]

{ #category : #'as yet unclassified' }
DpEntityBuilder >> child: accessorName to: aChildClass [
	^ self addField: (DpChildMapping new entityClass: aChildClass; yourself)
	       forName: accessorName 
]

{ #category : #'as yet unclassified' }
DpEntityBuilder >> childMany: accessorName to: aChildClass [
  | m |
  m := self child: accessorName to: aChildClass.
  m beMany.
  ^ m
]

{ #category : #accessing }
DpEntityBuilder >> date: accessorName [
	^ self addField: DpDateField new forName: accessorName
]

{ #category : #accessing }
DpEntityBuilder >> date: accessorName with: aBlock [
	aBlock value: (self date: accessorName)
]

{ #category : #accessing }
DpEntityBuilder >> fields [ 
  ^ mappings collect: #getter
]

{ #category : #accessing }
DpEntityBuilder >> float: accessorName [
	^ self addField: DpFloatField new forName: accessorName
]

{ #category : #accessing }
DpEntityBuilder >> float: accessorName with: aBlock [
	aBlock value: (self float: accessorName)
]

{ #category : #accessing }
DpEntityBuilder >> integer: accessorName [
	^ self addField: DpIntegerField new forName: accessorName
]

{ #category : #accessing }
DpEntityBuilder >> integer: accessorName with: aBlock [
	aBlock value: (self integer: accessorName)
]

{ #category : #'as yet unclassified' }
DpEntityBuilder >> link: accessorName to: aLinkClass [
  ^ self addField: (XtLinkMapping new entityClass: aLinkClass; yourself) 
         forName: accessorName
]

{ #category : #'as yet unclassified' }
DpEntityBuilder >> linkMany: accessorName to: aLinkClass [
  | m |
  m := self link: accessorName to: aLinkClass.
  m beMany.
  ^ m
]

{ #category : #accessing }
DpEntityBuilder >> name: aClassName [
  name := aClassName.
]

{ #category : #accessing }
DpEntityBuilder >> scaledDecimal: accessorName [
	^self addField: DpScaledDecimalField new forName: accessorName
]

{ #category : #accessing }
DpEntityBuilder >> scaledDecimal: accessorName with: aBlock [
	aBlock value: (self scaledDecimal: accessorName)
]

{ #category : #accessing }
DpEntityBuilder >> string: accessorName [
	^self addField: DpStringField new forName: accessorName
]

{ #category : #accessing }
DpEntityBuilder >> string: accessorName with: aBlock [
	aBlock value: (self string: accessorName)
]

{ #category : #accessing }
DpEntityBuilder >> time: accessorName [
	^ self addField: DpTimeField new forName: accessorName
]

{ #category : #accessing }
DpEntityBuilder >> time: accessorName with: aBlock [
	aBlock value: (self time: accessorName)
]
