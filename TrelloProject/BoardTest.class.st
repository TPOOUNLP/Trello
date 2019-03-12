"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
  
For the Class part:  State the name of the class with one line description: For example, I'm xxx the root of the hierarchy of visitor objects.

For the Responsibility part: Three sentences about my main responsibility, what I'm doing, what services do I offer.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	board:		<Object>


    Implementation Points
"
Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#instVars : [
		'board'
	],
	#category : #'TrelloProject-tests'
}

{ #category : #accessing }
BoardTest >> board [

 ^board.
]

{ #category : #accessing }
BoardTest >> board: aBoard [

 	board := aBoard.
]

{ #category : #test }
BoardTest >> setUp [
	| list1 list2 listOfLists user1 user2 listOfUsers|
	
	list1 := List new: 'TestList'.
	list2 := List new:'TestList2'.
	listOfLists := OrderedCollection new.
	listOfLists add: list1.
	listOfLists add: list2.
	
	user1 := ApplicationUser newWithKey: 'aKey' token: 'aToken' username: 'anUsername' id: 'anId' andFullname: 'aFullname'.
	user2 := ApplicationUser newWithKey: 'aKey' token: 'aToken' username: 'anUsername' id: 'anId' andFullname: 'aFullname'.
	listOfUsers:= OrderedCollection new.
	listOfUsers add: user1.
	listOfUsers add: user2.
	
	self board:(Board new: 'TestBoard' withId: 'idTestBoard' lists: listOfLists andUsers: listOfUsers).
]

{ #category : #test }
BoardTest >> testList [
	
	self assert: (self board lists size = 2). 
]

{ #category : #test }
BoardTest >> testName [

		self assert: (self board name = 'TestBoard').
]

{ #category : #test }
BoardTest >> testUser [
	
	self assert: (self board members size = 2). 
]
