"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State the name of the class with one line description: For example, I'm xxx the root of the hierarchy of visitor objects.

For the Responsibility part: Three sentences about my main responsibility, what I'm doing, what services do I offer.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 
.
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
	#name : #ListProxy,
	#superclass : #ProtoObject,
	#instVars : [
		'name',
		'id'
	],
	#category : #'TrelloProject-proxies'
}

{ #category : #'instance creation' }
ListProxy class >> new: aName withId: aId [
	^ super new initialize: aName withId: aId
]

{ #category : #proxy }
ListProxy >> doesNotUnderstand: aMessage [
	| list |
	list := ListOrchestrator getListById: self id.
	self become: list.
	^self perform: aMessage selector withArguments: aMessage arguments.
]

{ #category : #accessing }
ListProxy >> id [
	^id
]

{ #category : #accessing }
ListProxy >> id: anId [
	id := anId
]

{ #category : #initialization }
ListProxy >> initialize: aName withId: anId [
	name:= aName. 
	id:= anId.
]

{ #category : #accessing }
ListProxy >> name [
	^name
]

{ #category : #accessing }
ListProxy >> name: aName [
	name := aName
]

{ #category : #printing }
ListProxy >> printString [
	^ self name
]
