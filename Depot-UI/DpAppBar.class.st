Class {
	#name : #DpAppBar,
	#superclass : #DpComponent,
	#category : #'Depot-UI'
}

{ #category : #rendering }
DpAppBar >> renderOn: h [
	h nav: { self style appbar } with: [
		h span: { self style appbarHeader } with: 'Depot';
		  div: { self style appbarMenu } with: [ 
			  DpEntity subclassesDo: [ :cls |
				  h a: ({ self style appbarLink. }, (self entityLinkAttrs: cls))
			       with: cls name
			  ]
		  ]
		
	]
]
