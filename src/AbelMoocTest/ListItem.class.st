Class {
	#name : #ListItem,
	#superclass : #DocumentItem,
	#category : #AbelMoocTest
}

{ #category : #'as yet unclassified' }
ListItem class >> canParse: aString [ 
	^(aString at:1) = '-'.
]

{ #category : #'as yet unclassified' }
ListItem class >> priority [
	^2
]
