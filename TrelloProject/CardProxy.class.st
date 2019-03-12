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
	list:		<Object>
	name:		<Object>
	user:		<Object>


    Implementation Points
"
Class {
	#name : #CardProxy,
	#superclass : #ProtoObject,
	#instVars : [
		'name',
		'id'
	],
	#category : #'TrelloProject-proxies'
}

{ #category : #'instance creation' }
CardProxy class >> new: aName withId: aId [
	^ super new initialize: aName withId: aId
]

{ #category : #proxy }
CardProxy >> doesNotUnderstand: aMessage [
	| card |
	card := CardOrchestrator getCardById: self id.
	self become: card.
	^self perform: aMessage selector withArguments: aMessage arguments.
]

{ #category : #accessing }
CardProxy >> id [
	^id
]

{ #category : #accessing }
CardProxy >> id: anId [
	id := anId
]

{ #category : #initialization }
CardProxy >> initialize: aName withId: aId [
	name := aName.
	id := aId
]

{ #category : #accessing }
CardProxy >> name [
	^name
]

{ #category : #accessing }
CardProxy >> name: aName [
	name := aName
]
