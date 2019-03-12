"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State the name of the class with one line description: For example, I'm xxx the root of the hierarchy of visitor objects.
.
For the Responsibility part: Three sentences about my main responsibility, what I'm doing, what services do I offer.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	id:		<Object>
	lists:		<Object>
	name:		<Object>
	users:		<Object>


    Implementation Points
"
Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'lists',
		'members'
	],
	#category : #'TrelloProject-model'
}

{ #category : #'instance creation' }
Board class >> new: aName [
	^ super new initialize: aName
]

{ #category : #'instance creation' }
Board class >> new: aName withId: anId lists: aLists andUsers: anUsers [
	^ super new
		initialize: aName
		withId: anId
		lists: aLists
		andUsers: anUsers
]

{ #category : #actions }
Board >> addList: aList [
	self lists add: aList
]

{ #category : #actions }
Board >> addUser: aUser [
	self members add: aUser
]

{ #category : #accessing }
Board >> id [
	^ id
]

{ #category : #accessing }
Board >> id: aId [
	id := aId
]

{ #category : #initialization }
Board >> initialize: aName withId: anId lists: aLists andUsers: anUsers [
	self
		name: aName;
		id: anId;
		lists: aLists;
		members: anUsers
]

{ #category : #accessing }
Board >> lists [
	^lists
]

{ #category : #accessing }
Board >> lists: aListOfLists [
	lists := aListOfLists
]

{ #category : #accessing }
Board >> members [
	^ members
]

{ #category : #accessing }
Board >> members: anObject [
	members := anObject
]

{ #category : #accessing }
Board >> name [
	^ name
]

{ #category : #accessing }
Board >> name: aName [
	name := aName
]

{ #category : #printing }
Board >> printString [
	^ self name
]
