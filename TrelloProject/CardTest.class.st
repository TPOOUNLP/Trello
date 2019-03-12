Class {
	#name : #CardTest,
	#superclass : #TestCase,
	#instVars : [
		'card'
	],
	#category : #'TrelloProject-tests'
}

{ #category : #accessing }
CardTest >> card [

	^card.
]

{ #category : #accessing }
CardTest >> card: aCard [

	card := aCard.
]

{ #category : #test }
CardTest >> setUp [

	| user |
	
	user := ApplicationUser newWithKey: 'aKey' token: 'aToken' username: 'anUsername' id: 'anId' andFullname: 'aFullname'.
	self card: ( Card new: 'TestCard' withId: 'idCard' ).
]

{ #category : #test }
CardTest >> testAddCheckList [
| checkLists |
	checkLists := CheckList new.
	checkLists initializeName: 'aName' id: 'anId' checkItems: OrderedCollection new.
	self assert: self card checkLists size = 0.
	self card addCheckList: checkLists .
	self assert: self card checkLists size = 1.
]

{ #category : #test }
CardTest >> testAddComment [
 | comment applicationUser |
	applicationUser := ApplicationUser new.
	applicationUser initializeWithKey: 'aKey' token: 'aToken' username: 'aUsername' id: 'anId' andFullname: 'aFullname'.
	comment := Comment new.
	comment initialize: 'aContent' from: applicationUser withId: 'anId' .
	self assert: self card comments size = 0.
	self card addComment:  comment .
	self assert: self card comments size = 1.
]

{ #category : #test }
CardTest >> testMoveToList [
 | list1 list2 |
	list2 := List new: 'Lista 2'  withId: '2' .
	list1 := List new: 'Lista 1'  withId: '1' .
	self card list: list1.
	self assert: self card list id = '1'.
	list1 addCard: self card.
	self assert: list2 cards size = 0.
	self card moveToList: list2.
	self assert: list2 cards size = 1.
]
