Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'symbol',
		'flipped',
		'announcer'
	],
	#category : #AbelMoocTest2
}

{ #category : #accessing }
Card >> announcer [
	^announcer
]

{ #category : #accessing }
Card >> flip [
	flipped:=flipped not.
	self notifyFlipped
]

{ #category : #accessing }
Card >> notifyFlipped [
self announcer announce: CardFlipped
]

{ #category : #accessing }
Card >> symbol: aCharacter [ 
]
