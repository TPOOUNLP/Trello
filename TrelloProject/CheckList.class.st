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
	checkItems:		<Object>
	id:		<Object>
	name:		<Object>
	pos:		<Object>


    Implementation Points
"
Class {
	#name : #CheckList,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'checkItems'
	],
	#category : #'TrelloProject-model'
}

{ #category : #'instance-creation' }
CheckList class >> newName: aString id: anId checkItems: aCollectionOfCheckItems [
	^ super new initializeName: aString id: anId checkItems: aCollectionOfCheckItems
]

{ #category : #accessing }
CheckList >> addCheckItem: aCheckItem [
	self checkItems add: aCheckItem 
]

{ #category : #accessing }
CheckList >> checkItems [
	^checkItems
]

{ #category : #accessing }
CheckList >> checkItems: aCollectionOfCheckItems [
	checkItems := aCollectionOfCheckItems 
]

{ #category : #accessing }
CheckList >> id [

^id
]

{ #category : #accessing }
CheckList >> id: anId [
	id := anId
]

{ #category : #initialization }
CheckList >> initializeName: aString id:anId checkItems: aCollectionOfCheckItems [
	self name:aString;
		id: anId;
		checkItems: aCollectionOfCheckItems 
]

{ #category : #accessing }
CheckList >> name [

^name
]

{ #category : #accessing }
CheckList >> name: aName [

name:= aName
]

{ #category : #printing }
CheckList >> printString [
	^ self name
]
