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
GameTest >> testGameChooseCard [
	"flip a card, see if its put in choosenCards"
	| g h i |
	g:= Games2 new chooseCard: (Card new symbol: $x).
	h:= g choosenCards at: 1.
	i:=false.
	self halt.
	g choosenCards do: [:each | (each symbol = $x) ifTrue: [i:=true]].
	self assert: i = true
]

{ #category : #accessing }
GameTest >> testGameFlip [
	"flip a card, see if its put in choosenCards"
	| g h i |
	g:= Games2 new chooseCard: (Card new symbol: $x).
	h:= g choosenCards at: 1.
	i:=false.
	self halt.
	g choosenCards do: [:each | (each symbol = $x) ifTrue: [i:=true]].
	self assert: i = true
]

{ #category : #accessing }
GameTest >> testInitializeWith [
	| g h |
	g:=Games2 new.
	g initializeWith: '12345678'.
	h:=g availableCards.
	self halt.
]
