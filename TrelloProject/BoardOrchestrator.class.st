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
	#name : #BoardOrchestrator,
	#superclass : #Object,
	#category : #'TrelloProject-controllers'
}

{ #category : #'api actions' }
BoardOrchestrator class >> createBoard: aName [
	^ BoardConnector createBoard: aName
]

{ #category : #'api actions' }
BoardOrchestrator class >> createBoardByDictionary: aDicctionary [
	^ BoardFactory instance createBoard: aDicctionary
]

{ #category : #'api actions' }
BoardOrchestrator class >> createBoardByFullDictionary: aDictionary [
	^ BoardFactory instance createFullBoard: aDictionary
]

{ #category : #'api actions' }
BoardOrchestrator class >> createListWithName: aName inBoard: aBoard [
	^ BoardConnector createListWithName: aName inBoard: aBoard
]

{ #category : #'api actions' }
BoardOrchestrator class >> deleteBoard: aBoardId [
	^ BoardConnector deleteBoard: aBoardId
]

{ #category : #'api actions' }
BoardOrchestrator class >> getBoards [
	| dictionary |
	dictionary := UserConnector getUserBoards.
	^ BoardOrchestrator getBoardsByDictionary: dictionary
]

{ #category : #'api actions' }
BoardOrchestrator class >> getBoardsByDictionary: aDictionary [
	^ aDictionary collect: [ :boardDictionary | BoardOrchestrator createBoardByDictionary: boardDictionary ]
]

{ #category : #'api actions' }
BoardOrchestrator class >> getFullBoardInfoById: anId [
	| dictionary |
	dictionary := BoardConnector getFullBoardInfo: anId.
	^ BoardOrchestrator createBoardByFullDictionary: dictionary
]
