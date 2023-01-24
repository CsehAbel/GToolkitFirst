Class {
	#name : #GameElement2,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #AbelMoocTest2
}

{ #category : #accessing }
GameElement2 >> game [
	^ game
]

{ #category : #accessing }
GameElement2 >> game: aGame [
	game := aGame.
	self onUpdated
]

{ #category : #accessing }
GameElement2 >> initialize [
	super initialize.
	self layout: BlGridLayout horizontal.
	self
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ]
]

{ #category : #accessing }
GameElement2 >> onUpdated [
	self game ifNil: [^ self].
	self layout columnCount: game gridSize.
	self removeChildren.
	game availableCards
		do: [ :myCard | 
			| aCardElement |
			aCardElement := CardElement new card: myCard.
			(aCardElement addEventHandler: (CEventListener new game: self game)).
			self addChild: aCardElement ]
]
