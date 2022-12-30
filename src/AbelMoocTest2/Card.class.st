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
Card >> initialize [
	super initialize.
	flipped:=false.
	announcer:=AnnouncerMine new
]

{ #category : #accessing }
Card >> notifyFlipped [
self announcer announce: CardFlipped new
]

{ #category : #accessing }
Card >> symbol: aCharacter [ 
	symbol:=aCharacter
]
