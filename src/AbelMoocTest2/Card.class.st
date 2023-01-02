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
Card >> discard [
	self notifyDiscarded.
]

{ #category : #accessing }
Card >> flip [
	flipped:=flipped not.
	self notifyFlipped
]

{ #category : #initialization }
Card >> initialize [
	super initialize.
	flipped:=false.
	announcer:=Announcer new
]

{ #category : #accessing }
Card >> isFlipped [ 
	^ flipped
]

{ #category : #accessing }
Card >> notifyDiscarded [
	self announcer announce: CardDiscarded new.
]

{ #category : #accessing }
Card >> notifyFlipped [
self announcer announce: CardFlipped new
]

{ #category : #accessing }
Card >> symbol [
	^symbol
]

{ #category : #accessing }
Card >> symbol: aCharacter [ 
	symbol:=aCharacter
]
