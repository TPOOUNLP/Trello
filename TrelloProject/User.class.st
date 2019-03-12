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
	boards:		<Object>
	id:		<Object>
	name:		<Object>


    Implementation Points
"
Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'id',
		'fullname'
	],
	#category : #'TrelloProject-model'
}

{ #category : #creating }
User class >> newWithId: anId andFullName: aFullName [
	^ super new initializeWithId: anId andFullName: aFullName
]

{ #category : #accessing }
User >> fullname [
	^ fullname
]

{ #category : #accessing }
User >> fullname: anObject [
	fullname := anObject
]

{ #category : #accessing }
User >> id [
	^ id
]

{ #category : #accessing }
User >> id: anObject [
	id := anObject
]

{ #category : #accessing }
User >> initializeWithId: anId andFullName: aFullName [
	self id: anId.
	self fullname: aFullName
]
