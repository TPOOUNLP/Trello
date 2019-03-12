"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
.
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
	checkLists:		<Object>
	comments:		<Object>
	id:		<Object>
	list:		<Object>
	members:		<Object>
	name:		<Object>
	userCreator:		<Object>


    Implementation Points
"
Class {
	#name : #Card,
	#superclass : #Object,
	#instVars : [
		'id',
		'members',
		'comments',
		'name',
		'checkLists',
		'list'
	],
	#category : #'TrelloProject-model'
}

{ #category : #'instance creation' }
Card class >> new: aName withId: aId [
	^ super new initialize: aName withId: aId
]

{ #category : #actions }
Card >> addCheckList: aCheckList [
	self checkLists add: aCheckList 



]

{ #category : #actions }
Card >> addComment: aComment [
	self comments add: aComment
]

{ #category : #accessing }
Card >> checkLists [
	^checkLists 


]

{ #category : #accessing }
Card >> checkLists: aCollectionOfCheckLists [
	checkLists := aCollectionOfCheckLists 



]

{ #category : #accessing }
Card >> comments [

^comments
]

{ #category : #accessing }
Card >> comments: aListOfComments [

  comments := aListOfComments.



]

{ #category : #accessing }
Card >> id [

^id
]

{ #category : #accessing }
Card >> id:aId [

 id:= aId
]

{ #category : #initialization }
Card >> initialize: aName withId:aId [

self name: aName.
self id: aId.
checkLists := OrderedCollection new.
comments := OrderedCollection new.
members := OrderedCollection new.
]

{ #category : #accessing }
Card >> list [
	^ list
]

{ #category : #accessing }
Card >> list: anObject [
	list := anObject
]

{ #category : #accessing }
Card >> members [
	^members 
]

{ #category : #accessing }
Card >> members: aCollectionOfMembers [
	members := aCollectionOfMembers 
]

{ #category : #actions }
Card >> moveToList: aList [
	self list removeCard: self.
	aList addCard: self.
	self list: aList.
]

{ #category : #accessing }
Card >> name [ 

^name.
]

{ #category : #accessing }
Card >> name: aName [

 name:= aName.
]

{ #category : #printing }
Card >> printString [
	^ self name
]
