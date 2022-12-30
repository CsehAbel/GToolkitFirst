Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #AbelMoocTest2
}

{ #category : #accessing }
GameTest >> testCard [
	| c |
	c:=Card new symbol: $A.
	self halt.
	c flip.
	self assert: true
	
]
