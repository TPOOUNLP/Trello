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


    Implementation Points
"
Class {
	#name : #CardOrchestrator,
	#superclass : #Object,
	#category : #'TrelloProject-controllers'
}

{ #category : #'api actions' }
CardOrchestrator class >> createCardByDiccionary: aDiccionary [
	^ CardFactory instance createFullCard: aDiccionary
]

{ #category : #'api actions' }
CardOrchestrator class >> getCardByActionId: idAction [
	| dictionary |
	dictionary := ActionConnector getCardByActionId: idAction.
	^ CardFactory instance createCard: dictionary
]

{ #category : #'api actions' }
CardOrchestrator class >> getCardById: id [
	| diccionary |
	diccionary := CardConnector getFullCardInfo: id.
	^ CardOrchestrator createCardByDiccionary: diccionary
]

{ #category : #'api actions' }
CardOrchestrator class >> getCardsByActions: aActionsCollection [
	^ aActionsCollection collect: [ :actionId | CardOrchestrator getCardByActionId: actionId ]
]

{ #category : #'api actions' }
CardOrchestrator class >> getCardsByList: aList forUser: aUser [
	^ aList cards select: [ :each | each members asOrderedCollection includes: aUser id ]
]

{ #category : #'api actions' }
CardOrchestrator class >> moveCard: aCard toList: aList [
	^ CardConnector moveCard: aCard id toList: aList id
]
