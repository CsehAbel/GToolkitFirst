Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #AbelMoocTest2
}

{ #category : #accessing }
GameTest >> testCard [
	Card new symbol: $A;flip.
]
