Class {
	#name : #ListTest,
	#superclass : #TestCase,
	#instVars : [
		'list'
	],
	#category : #'TrelloProject-tests'
}

{ #category : #accessing }
ListTest >> list [

	^list.
]

{ #category : #accessing }
ListTest >> list: aList [

	list := aList.
]

{ #category : #test }
ListTest >> setUp [

		self list: (List new: 'TestList').
]

{ #category : #test }
ListTest >> testCard [
	| card1 card2 user |
	user := ApplicationUser
		newWithKey: 'aKey'
		token: 'aToken'
		username: 'anUsername'
		id: 'anId'
		andFullname: 'aFullname'.
	card1 := Card new: 'example1' withId: 'id1'.
	card2 := Card new: 'example2' withId: 'id2'.
	self list addCard: card1.
	self list addCard: card2.
	self assert: self list cards size = 2.
	self list removeCard: card1.
	self assert: self list cards size = 1
]

{ #category : #test }
ListTest >> testName [

		self assert: (self list name = self list printString ).
]
