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
	checkList:		<Object>
	completed:		<Object>
	id:		<Object>
	name:		<Object>
	pos:		<Object>


    Implementation Points
"
Class {
	#name : #CheckItem,
	#superclass : #Object,
	#instVars : [
		'name',
		'pos',
		'id',
		'idChecklist',
		'isCompleted'
	],
	#category : #'TrelloProject-model'
}

{ #category : #'instance creation' }
CheckItem class >> newName: aString id: anId pos: anInteger completed: aBoolean [
	^ super new
		initializeName: aString
		id: anId
		pos: anInteger
		completed: aBoolean
]

{ #category : #accessing }
CheckItem >> checkList: aChecklist [
	idChecklist := aChecklist id.
]

{ #category : #accessing }
CheckItem >> id [
	^id
]

{ #category : #accessing }
CheckItem >> id: anId [
	id := anId
]

{ #category : #accessing }
CheckItem >> idChecklist [
	^ idChecklist
]

{ #category : #initialization }
CheckItem >> initializeName: aString id: anId pos: anInteger completed: aBoolean [
	self name: aString;
		id: anId;
		pos: anInteger;
		isCompleted: aBoolean.
		
]

{ #category : #accessing }
CheckItem >> isCompleted [
	^ isCompleted
]

{ #category : #accessing }
CheckItem >> isCompleted: anObject [
	isCompleted := anObject
]

{ #category : #accessing }
CheckItem >> name [
	^name
]

{ #category : #accessing }
CheckItem >> name: aString [
	name := aString
]

{ #category : #accessing }
CheckItem >> pos [
	^pos
]

{ #category : #accessing }
CheckItem >> pos: anInteger [
	pos := anInteger
]

{ #category : #printing }
CheckItem >> printString [
	^ self name
]
