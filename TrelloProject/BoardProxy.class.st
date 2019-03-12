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
	name:		<Object>


    Implementation Points
"
Class {
	#name : #BoardProxy,
	#superclass : #ProtoObject,
	#instVars : [
		'name',
		'id'
	],
	#category : #'TrelloProject-proxies'
}

{ #category : #'instance creation' }
BoardProxy class >> new: aName withId: anId [
	^ self new
		initialize: aName with: anId;
		yourself
]

{ #category : #proxy }
BoardProxy >> doesNotUnderstand: aMessage [
	| board |
	board := BoardOrchestrator getFullBoardInfoById: self id.	
	self become: board.
	^self perform: aMessage selector withArguments: aMessage arguments.
]

{ #category : #accessing }
BoardProxy >> id [
	^id
]

{ #category : #accessing }
BoardProxy >> id: anId [
	id := anId
]

{ #category : #initialization }
BoardProxy >> initialize: aName with:aId [	
	name:= aName. 
	id:= aId.
]

{ #category : #accessing }
BoardProxy >> name [
	^name
]

{ #category : #accessing }
BoardProxy >> name: aName [
	name := aName
]

{ #category : #printing }
BoardProxy >> printString [
	^ self name
]
