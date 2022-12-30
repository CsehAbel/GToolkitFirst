Class {
	#name : #ClassMethodsTest,
	#superclass : #TestCase,
	#category : #AbelMoocTest
}

{ #category : #accessing }
ClassMethodsTest >> instantiateAccordingly: line col: subclasses [
	subclasses
		do: [ :each | (each canParse: line) ifTrue: [ ^ each newFromLine: line ] ]
]

{ #category : #accessing }
ClassMethodsTest >> testMe [
	| res subclasses line |
	subclasses := DocumentItem allSubclasses.
	subclasses sort: [ :p1 :p2 | p1 priority < p2 priority ].
	line := '^aTitle'.
	res:=self instantiateAccordingly: line col: subclasses.
	self assert: res class equals: TitleItem
]
