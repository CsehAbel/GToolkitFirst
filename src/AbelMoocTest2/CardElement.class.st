Class {
	#name : #CardElement,
	#superclass : #BlElement,
	#instVars : [
		'card',
		'back',
		'face'
	],
	#category : #AbelMoocTest2
}

{ #category : #accessing }
CardElement >> backgroundColor [
^ Color lightBlue
]

{ #category : #accessing }
CardElement >> card [
	^ card
]

{ #category : #accessing }
CardElement >> card: aCard [
	"if the card instVar is swapped then unsubscribe"
	card ifNotNil: [:oldCard | oldCard announcer unsubscribe: self].
	"set the instance variable"
	card:=aCard.
	"subscribe to CardDisappeared event of aCard's announcer"
	card announcer when: CardDisappeared send: #onDisappear to: self.
	card announcer when: CardFlipped send: #onFlipped to: self
	"update CardElement's face with the symbol of aCard"
	onUpdated
	
]

{ #category : #accessing }
CardElement >> cardFlippedView: aView [
	<gtView>
	^ aView columnedList
		title: 'my elements listed';
		items: [ OrderedCollection new add: card;yourself ];
		column: 'me'
			text: [ :rowObject :rowIndex :columnIndex | 
				| aComputedItem |
				aComputedItem := [ :a | a ]
						phlowValue: rowObject
						withEnoughArguments: {rowObject.
								rowIndex.
								columnIndex}.
				[ :a "This is a new method" | 
				a isFlipped
					ifTrue: [ a printString asRopedText background: Color green ]
					ifFalse: [ a printString asRopedText ] ]
					phlowValue: aComputedItem
					withEnoughArguments: {aComputedItem.
							rowIndex.
							columnIndex} ]
]

{ #category : #accessing }
CardElement >> cardSize [
	^ 20@20
]

{ #category : #accessing }
CardElement >> foregroundColor [
	^ Color gray
]

{ #category : #accessing }
CardElement >> initialize [
	super initialize.
	self layout: BlFrameLayout new.
	self size: self cardSize.
	self background: self backgroundColor.
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 2).
	self initializeFace.
	self addChild: face.
	self initializeBack.
	self addChild: back.
]

{ #category : #accessing }
CardElement >> initializeBack [
	back:= BlElement  new constraintsDo: [:c | c vertical matchParent. c horizontal matchParent].
	back addChild: (BlLineElement new
			border: (BlBorder paint: self foregroundColor width: 1);
			fromAnchor: (BlElementTopLeftAnchor new referenceElement: back);
			toAnchor: (BlElementBottomRightAnchor new referenceElement: back);
			yourself);
		addChild: (BlLineElement new
			border: (BlBorder paint: self foregroundColor width: 1);
			fromAnchor: (BlElementTopRightAnchor new referenceElement: back);
			toAnchor: (BlElementBottomLeftAnchor new referenceElement: back);
			yourself).
			
]

{ #category : #accessing }
CardElement >> initializeFace [
	face := BlTextElement new text: '?' asRopedText.
	face
		constraintsDo: [ :c | 
			c frame horizontal alignCenter.
			c frame vertical alignCenter ].
	face visibility: BlVisibility hidden
]

{ #category : #accessing }
CardElement >> onDisappear [
	self visibility: BlVisibility hidden.
]

{ #category : #accessing }
CardElement >> onFlipped [
	self card isFlipped ifTrue: [self onFlippedFace] ifFalse: [self onFlippedBack].
]

{ #category : #accessing }
CardElement >> onFlippedBack [
	face visibility: BlVisibility hidden.
	back visibility: BlVisibility visible.
]

{ #category : #accessing }
CardElement >> onFlippedFace [
	face visibility: BlVisibility visible.
	back visibility: BlVisibility hidden.
]

{ #category : #accessing }
CardElement >> onUpdated [
	card ifNil: [ ^ self ].
	face text: (card symbol asString asRopedText foreground: self foregroundColor ; 
		fontSize: self symbolFontSize).
	self onFlipped
]

{ #category : #accessing }
CardElement >> symbolFontSize [
 ^12
]
