Class {
	#name : #SubListItem,
	#superclass : #DocumentItem,
	#category : #AbelMoocTest
}

{ #category : #accessing }
SubListItem class >> canParse: aString [ 
	^((aString at:1) asString,(aString at:2) asString) = '--'
]

{ #category : #'as yet unclassified' }
SubListItem class >> priority [
	^1
]
