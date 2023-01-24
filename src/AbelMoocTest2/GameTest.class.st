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
	| res |
	res:= Games2 new chooseCard: (Card new symbol: $x);
	checkChoosenCardsContainsACardX.
	self assert: res
]

{ #category : #accessing }
GameTest >> testGameDisplay [
	"flip a card, see if its put in choosenCards"
	| aCard ce |
	aCard:=Card new symbol: $x.
	ce:=CardElement new card: aCard.
	self halt.
	aCard flip.
	self halt
	"g has flipped the card, and if there are matches it sends: card discard or: card flip"
	
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
GameTest >> testGamesElement [
	| g h |
	g:=Games2 numbers.
	h:=GameElement2 new game: g.
	self halt.
	^h
]

{ #category : #accessing }
GameTest >> testInitializeWith [
	| g h |
	g:=Games2 new.
	g initializeWith: '12345678'.
	h:=g availableCards.
	self halt.
]
