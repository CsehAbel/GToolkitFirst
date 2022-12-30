Class {
	#name : #TitleItem,
	#superclass : #DocumentItem,
	#instVars : [
		'content'
	],
	#category : #AbelMoocTest
}

{ #category : #accessing }
TitleItem class >> canParse: aString [ 
	^(aString at:1) = $^.
]

{ #category : #'as yet unclassified' }
TitleItem class >> newFromLine: aString [ 
	^self new content: aString;yourself
]

{ #category : #'as yet unclassified' }
TitleItem class >> priority [
	^3
]

{ #category : #accessing }
TitleItem >> content: aString [
	content:=aString 
]
