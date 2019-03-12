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
	cardName:		<Object>
	list:		<Object>


    Implementation Points
"
Class {
	#name : #NewCardTrelloAction,
	#superclass : #TrelloAction,
	#instVars : [
		'cardName',
		'list'
	],
	#category : #'TrelloProject-actions'
}

{ #category : #'instance creation' }
NewCardTrelloAction class >> newWithName: aCardName to: aList [
	^ super new initialize: aCardName to: aList
]

{ #category : #accessing }
NewCardTrelloAction >> cardName [
	^ cardName
]

{ #category : #accessing }
NewCardTrelloAction >> cardName: anObject [
	cardName := anObject
]

{ #category : #execute }
NewCardTrelloAction >> execute [
	| idCard |
	idCard := (ListOrchestrator createCardWithName: self cardName inList: self list) at: 'id'.
	^ ActionOrchestrator getLastActionIdByCardId: idCard .
]

{ #category : #initialization }
NewCardTrelloAction >> initialize: aCardName to: aList [
	^ self
		cardName: aCardName;
		list: aList;
		yourself
]

{ #category : #accessing }
NewCardTrelloAction >> list [
	^ list
]

{ #category : #accessing }
NewCardTrelloAction >> list: anObject [
	list := anObject
]

{ #category : #printing }
NewCardTrelloAction >> printString [
	^ 'Crear tarjeta "' , self cardName printString , '" en la lista "' , self list printString , '"'
]
