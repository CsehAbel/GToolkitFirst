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

{ #category : #accessing }
GameTest >> testGameFlip [
	"flip a card, see if its put in choosenCards"
	| g |
	g:= Games2 new chooseCard: (Card new symbol: $x).
	self assert: 
	(((Games2 new chooseCard: (Card new symbol: $x)) chosenCards contains: [:each | each = $x ])).
	self assert: (g chosenCards contains: [:each | each = $x ])
]
