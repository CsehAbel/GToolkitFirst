Class {
	#name : #CEventListener,
	#superclass : #BlEventListener,
	#instVars : [
		'game'
	],
	#category : #AbelMoocTest2
}

{ #category : #accessing }
CEventListener >> clickEvent: anEvent [
	| ce |
	ce:= anEvent currentTarget.
	self game chooseCard: ce card.
]

{ #category : #accessing }
CEventListener >> game [
	^ game
]

{ #category : #accessing }
CEventListener >> game: anObject [ 
	game:=anObject
]
