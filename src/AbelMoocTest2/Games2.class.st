Class {
	#name : #Games2,
	#superclass : #Object,
	#instVars : [
		'availableCards',
		'choosenCards'
	],
	#category : #AbelMoocTest2
}

{ #category : #accessing }
Games2 class >> emojis [
	^ self new initializeForSymbols: '💰🏡🎅🍪🍕🚀😸🙈'
]

{ #category : #initialization }
Games2 class >> numbers [
	^ self new initializeWith: '12345678'
	
]

{ #category : #testing }
Games2 >> allChoosenCardsMatch [
 | first |
	first:= choosenCards first.
	"check additionaly if isFlipped"
	"each isFlipeed and: [each symbol = first symbol]"
 ^choosenCards allSatisfy: [:each | each symbol = first symbol]
]

{ #category : #'as yet unclassified' }
Games2 >> availableCards [
	^ availableCards
]

{ #category : #accessing }
Games2 >> cardsCount [
	^ self gridSize * self gridSize
]

{ #category : #private }
Games2 >> chooseCard: aCard [
	"dont choose a aCard twice"
	(choosenCards contains: aCard) ifTrue: [^ self].
	"choose a aCard"
	choosenCards add: aCard.
	aCard flip.
	"see if there is a match, see if all the aCards match"
	"return from this method, prematurely call ^ self, skip the statements below"
	self shouldSolveMatch ifTrue:[self solveMatch. ^ self].
	self shouldDissolveMatch ifTrue: [self dissolveMatch].
]

{ #category : #accessing }
Games2 >> choosenCards [
	^choosenCards.
]

{ #category : #private }
Games2 >> dissolveMatch [
| last |
	last:=choosenCards last.
	choosenCards allButLast: [:each | each flip]; removeAll.
	choosenCards add: last.
]

{ #category : #accessing }
Games2 >> gridSize [
	^4
]

{ #category : #initialization }
Games2 >> initialize [
	super initialize.
	availableCards:= OrderedCollection new.
	choosenCards:= OrderedCollection new.
]

{ #category : #accessing }
Games2 >> initializeWith: aString [
	"do an assert"
	self assert: aString size * self matchesCount = self cardsCount description: 'the number of symbols is not compatible with the Spielfeld'.
	"fill the instance variable/Class slot"
	availableCards:= (aString asArray collect: [:aChar|  (1 to: self matchesCount) collect:[:each | Card new symbol: aChar]]).
	"flatten it, shuffle it"
	availableCards:= availableCards flatten shuffle asOrderedCollection
]

{ #category : #acessing }
Games2 >> matchSize [
^2
]

{ #category : #accessing }
Games2 >> matchesCount [
^2
]

{ #category : #private }
Games2 >> shouldDissolveMatch [
^ self matchSize< choosenCards size 
]

{ #category : #testing }
Games2 >> shouldSolveMatch [
	"check size of choosenCards"
	^choosenCards size = self matchSize and: [self allChoosenCardsMatch]
]

{ #category : #accessing }
Games2 >> solveMatch [
	choosenCards do: [:e | e discard];removeAll.
]

{ #category : #accessing }
Games2 >> someMethod: aView [
	<gtView>
	self availableCards isEmpty ifTrue: [ ^ aView empty ].
	^ aView columnedList
		title: 'my elements listed';
		display: [ self availableCards ];
		column: 'me'
			item: [ :a | a ]
			format: [ :a | 
				a isFlipped
					ifTrue: [ a printString asRopedText background: Color green ]
					ifFalse: [ a printString asRopedText ] ]
]
