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
	game:= aGame.
	self removeChildren.
	game availableCards do: [:myCard | 
				|aCardElement|
				aCardElement:= CardElement new card: myCard]
]

{ #category : #accessing }
GameElement2 >> initialize [
	super initialize.
	self layout: BlGridLayout.
	 
]
