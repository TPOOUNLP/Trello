Class {
	#name : #CheckListTest,
	#superclass : #TestCase,
	#instVars : [
		'checkList'
	],
	#category : #'TrelloProject-tests'
}

{ #category : #accesing }
CheckListTest >> checkList [

	^checkList.
]

{ #category : #accesing }
CheckListTest >> checkList: aCheckList [

	checkList := aCheckList.
]

{ #category : #test }
CheckListTest >> setUp [
	| item1 item2 itemCollection |
	item1 := CheckItem
		newName: 'Item1'
		id: 'idItem1'
		pos: 1
		completed: false.
	item2 := CheckItem
		newName: 'Item2'
		id: 'idItem2'
		pos: 2
		completed: false.
	itemCollection := OrderedCollection new.
	itemCollection add: item1.
	itemCollection add: item2.
	self
		checkList: (CheckList newName: 'TestCheckList' id: 'idCheckList' checkItems: itemCollection)
]

{ #category : #test }
CheckListTest >> testCheckItem [

	| item |
	
	item := CheckItem newName: 'Item3' id: 'idItem3' pos: 3 completed: false.
	
	self checkList addCheckItem: item.
	
	self assert: ( self checkList checkItems size = 3 ).
]
