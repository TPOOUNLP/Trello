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
	Card1:		<Object>
	Card2:		<Object>
	board:		<Object>
	list1:		<Object>
	list2:		<Object>
	trelloOrchestrator:		<Object>
	username:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloOrchestratorTest,
	#superclass : #TestCase,
	#instVars : [
		'trelloApplication',
		'board',
		'list1',
		'list2',
		'Card1',
		'Card2',
		'boards'
	],
	#category : #'TrelloProject-tests'
}

{ #category : #accessing }
TrelloOrchestratorTest >> board [
	^ board
]

{ #category : #accessing }
TrelloOrchestratorTest >> board: anObject [
	board := anObject
]

{ #category : #accessing }
TrelloOrchestratorTest >> boards [
	^ boards
]

{ #category : #accessing }
TrelloOrchestratorTest >> boards: anObject [
	boards := anObject
]

{ #category : #accessing }
TrelloOrchestratorTest >> card1 [
	^ Card1
]

{ #category : #accessing }
TrelloOrchestratorTest >> card1: anObject [
	Card1 := anObject
]

{ #category : #accessing }
TrelloOrchestratorTest >> card2 [
	^ Card2
]

{ #category : #accessing }
TrelloOrchestratorTest >> card2: anObject [
	Card2 := anObject
]

{ #category : #overrided }
TrelloOrchestratorTest >> isLogging [
	^ true
]

{ #category : #accessing }
TrelloOrchestratorTest >> list1 [
	^ list1
]

{ #category : #accessing }
TrelloOrchestratorTest >> list1: anObject [
	list1 := anObject
]

{ #category : #accessing }
TrelloOrchestratorTest >> list2 [
	^ list2
]

{ #category : #accessing }
TrelloOrchestratorTest >> list2: anObject [
	list2 := anObject
]

{ #category : #overrided }
TrelloOrchestratorTest >> setUp [
	|      |
	
	self
		trelloApplication:
			(TrelloApplication 
				new: '4542a25c559e28c2ecaaf43c0799106a'
				token: 'e1c2eea9f983b876bcdb239fb1603b54a9cd229dabd447835f2997220764aff1'
				user: 'valentinpeluso').	
	self trelloApplication applicationUser boards: BoardOrchestrator getBoards asOrderedCollection .
	
]

{ #category : #overrided }
TrelloOrchestratorTest >> tearDown [
	BoardOrchestrator deleteBoard: self board id
]

{ #category : #test }
TrelloOrchestratorTest >> testTrelloOrchestrator [
	| b l1 c1 |
	b := BoardOrchestrator createBoard: 'Board Test'.
	self board: (BoardOrchestrator createBoardByDictionary: b).
	self boards: BoardOrchestrator getBoards asOrderedCollection.
	self
		assert: (self boards anySatisfy: [ :bo | bo name = 'Board Test' ])
		description: 'No se encontro el board recientemente agregado'.
	l1 := BoardOrchestrator createListWithName: 'Lista 1' inBoard: self board.
	self list1: (ListOrchestrator getListById: (l1 at: 'id')).
	self assert: self list1 name = 'Lista 1' description: 'No creo bien la lista'.
	c1 := ListOrchestrator createCardWithName: 'Card 1' inList: self list1.
	self card1: (CardOrchestrator createCardByDiccionary: c1).
	self assert: self card1 name = 'Card 1' description: 'No creo bien la card'.
	self list1: (ListOrchestrator getListById: (l1 at: 'id')).
	self
		assert: (self list1 cards anySatisfy: [ :c | c name = 'Card 1' ])
		description: 'La card no se encuentra dentro de la lista'
]

{ #category : #accessing }
TrelloOrchestratorTest >> trelloApplication [
	^ trelloApplication
]

{ #category : #accessing }
TrelloOrchestratorTest >> trelloApplication: anObject [
	trelloApplication := anObject
]
