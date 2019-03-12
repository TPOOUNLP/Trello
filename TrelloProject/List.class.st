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
	cards:		<Object>
	id:		<Object>
	name:		<Object>


    Implementation Points
"
Class {
	#name : #List,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'cards'
	],
	#category : #'TrelloProject-model'
}

{ #category : #'instance creation' }
List class >> new: aName [
	^ self new: aName withId: nil
]

{ #category : #'instance creation' }
List class >> new: aName withId: aId [
	^ super new initialize: aName withId: aId
]

{ #category : #actions }
List >> addCard: aCard [
	self cards add: aCard
]

{ #category : #accessing }
List >> cards [
^cards
]

{ #category : #accessing }
List >> cards: aListOfCards [

 cards := aListOfCards.
]

{ #category : #accessing }
List >> id [
^id
]

{ #category : #accessing }
List >> id:aId [

id:=aId
]

{ #category : #initialization }
List >> initialize: aName [
	
	self initialize: aName withId: nil. 
	
	
]

{ #category : #initialization }
List >> initialize: aName withId:aId [
	
	self name: aName.
	self id:aId. 
	cards := OrderedCollection new.
	
	
]

{ #category : #accessing }
List >> name [
	^ name
]

{ #category : #accessing }
List >> name: aName [
	name := aName
]

{ #category : #printing }
List >> printString [
	^ self name
]

{ #category : #actions }
List >> removeCard: aCard [
	self cards remove: aCard
]
