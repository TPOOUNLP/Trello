"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State the name of the class with one line description: For example, I'm xxx the root of the hierarchy of visitor objects.

For the Responsibility part: Three sentences about my main responsibility, what I'm doing, what services do I offer.
.
For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	card:		<Object>
	list:		<Object>


    Implementation Points
"
Class {
	#name : #MoveCardTrelloAction,
	#superclass : #TrelloAction,
	#instVars : [
		'card',
		'list'
	],
	#category : #'TrelloProject-actions'
}

{ #category : #'instance creation' }
MoveCardTrelloAction class >> newCard: aCard toList: aList [
	^ super new initialize: aCard list: aList
]

{ #category : #accessing }
MoveCardTrelloAction >> card [
	^ card
]

{ #category : #accessing }
MoveCardTrelloAction >> card: anObject [
	card := anObject
]

{ #category : #execute }
MoveCardTrelloAction >> execute [
	CardOrchestrator moveCard: self card toList: self list.
	^ActionOrchestrator getLastActionIdByCardId: self card id.
]

{ #category : #initialization }
MoveCardTrelloAction >> initialize: aCard list: aList [
	^self card: aCard;
		list: aList;
		yourself.
]

{ #category : #accessing }
MoveCardTrelloAction >> list [
	^ list
]

{ #category : #accessing }
MoveCardTrelloAction >> list: anObject [
	list := anObject
]

{ #category : #printing }
MoveCardTrelloAction >> printString [
	^ 'Mover tarjeta "', self card printString, '" a la lista "', self list printString, '"'.
]
