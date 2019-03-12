"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	boards:		<Object>
	buttonCancel:		<Object>
	buttonCardCommit:		<Object>
	buttonDefaultCommit:		<Object>
	cards:		<Object>
	lists:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloCommitView,
	#superclass : #ComposableModel,
	#instVars : [
		'buttonDefaultCommit',
		'buttonCardCommit',
		'boards',
		'cards',
		'lists',
		'commentText',
		'target',
		'buttonCancel'
	],
	#category : #'TrelloProject-views'
}

{ #category : #specs }
TrelloCommitView class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :mainColumn | 
					mainColumn newRow: [ :rowBoard | rowBoard add: #boards ].
					mainColumn newRow: [ :rowList | rowList add: #lists ].
					mainColumn newRow: [ :cardList | cardList add: #cards ].
					mainColumn newRow: [ :commentText | commentText add: #commentText ].
					mainColumn
						newRow: [ :rowButtons | 
							rowButtons
								add: #buttonCardCommit;
								add: #buttonDefaultCommit;
								add: #buttonCancel ] ];
		yourself
]

{ #category : #accessing }
TrelloCommitView >> boards [
	^ boards
]

{ #category : #accessing }
TrelloCommitView >> boards: anObject [
	boards := anObject.
]

{ #category : #accessing }
TrelloCommitView >> buttonCancel [
	^ buttonCancel
]

{ #category : #accessing }
TrelloCommitView >> buttonCancel: anObject [
	buttonCancel := anObject
]

{ #category : #accessing }
TrelloCommitView >> buttonCardCommit [
	^ buttonCardCommit
]

{ #category : #accessing }
TrelloCommitView >> buttonCardCommit: anObject [
	buttonCardCommit := anObject
]

{ #category : #accessing }
TrelloCommitView >> buttonDefaultCommit [
	^ buttonDefaultCommit
]

{ #category : #accessing }
TrelloCommitView >> buttonDefaultCommit: anObject [
	buttonDefaultCommit := anObject
]

{ #category : #accessing }
TrelloCommitView >> cards [
	^ cards
]

{ #category : #accessing }
TrelloCommitView >> cards: anObject [
	cards := anObject
]

{ #category : #accessing }
TrelloCommitView >> commentText [
	^ commentText
]

{ #category : #accessing }
TrelloCommitView >> commentText: anObject [
	commentText := anObject
]

{ #category : #initialize }
TrelloCommitView >> initializePresenter [
	| selectedBoard selectedCard selectedList action cardName |
	selectedList := nil.
	selectedCard := nil.
	boards
		whenSelectedItemChanged: [ :board | 
			self selectBoard: board.
			cards items: #().
			selectedBoard := board.
			selectedList := nil.
			selectedCard := nil.
			self buttonCardCommit disable ].
	lists
		whenSelectedItemChanged: [ :list | 
			self selectList: list.
			selectedList:= list ].
	cards
		whenSelectedItemChanged: [ :card | 
			selectedCard := card].
	commentText whenTextChanged: [  
		self buttonCardCommit enable ].
	buttonCardCommit 
		action: [
			selectedCard ifNil: [ self inform: 'A card must be selected' ] 
						ifNotNil:  [ 
							"Choclo turbio para commitear comentando la tarjeta con datos	del commit"
							action := (CommentCardTrelloActionFactory instance createActionWithCard: selectedCard withComment: commentText text).
							self target	addAction: action.							
							self target executeActions.		
							self window close.
							self target window close.]
			].
	buttonDefaultCommit action:[
			 selectedBoard ifNil: [ self inform: 'Debe seleccionar un tablero' ] 
						ifNotNil:  [ 
						 	selectedCard := nil.
							cardName := 'Default commit-' , Date today dayOfMonth asString , '.' , Date today monthAbbreviation asString, '.' , Date today year asString.
							selectedList := selectedBoard lists detect: [:list | 
								(list name = 'Default')] 
							ifNone: [ "TODO: Agregar código para que cree la lista si no existe" ].						
							"Choclo turbio para commitear la tarjeta en blanco con datos	del commit"							
							selectedCard := selectedList cards detect: [:card | 
									(card name =  cardName)] ifNone:[nil].
							(selectedCard isNil) 
								ifTrue: [ action  := (NewCardTrelloActionFactory instance createActionWithCardName: cardName to: selectedList)]
								ifFalse: [ action := (CommentCardTrelloActionFactory instance createActionWithCard: selectedCard withComment: '')].				.
							self target	addAction: action.							
							self target executeActions.		
							self window close.
							self target window close.]
							].
	buttonCancel action: [ self window close ].
]

{ #category : #initialize }
TrelloCommitView >> initializeWidgets [
	self
		instantiateModels:
			#(boards ListModel lists ListModel cards ListModel buttonDefaultCommit ButtonModel buttonCardCommit ButtonModel buttonCancel ButtonModel commentText TextInputFieldModel).
	self title: 'Commit'.
	self buttonCardCommit
		label: 'Commit en tarjeta';
		disable.
	self buttonDefaultCommit label: 'Default Commit'.
	self buttonCancel label: 'Cancel'.
	self commentText autoAccept: true.
	boards items: TrelloApplication instance applicationUser boards.
	lists items: #().
	cards items: #().
]

{ #category : #initialize }
TrelloCommitView >> initializeWithTarget: aTarget [
	self target: aTarget.
]

{ #category : #accessing }
TrelloCommitView >> lists [
	^ lists
]

{ #category : #accessing }
TrelloCommitView >> lists: anObject [
	lists := anObject
]

{ #category : #accessing }
TrelloCommitView >> selectBoard: aBoard [
	self lists items: aBoard lists .
]

{ #category : #accessing }
TrelloCommitView >> selectList: aList [
"	| cardList |
	cardList := self checkboxUserLogFilter state
		ifTrue: [ CardOrchestrator getCardsByList: aList forUser: TrelloApplication instance applicationUser ]
		ifFalse: [ aList cards ].
	self cards items: cardList"
	self cards items: aList cards
]

{ #category : #accessing }
TrelloCommitView >> target [
	^ target
]

{ #category : #accessing }
TrelloCommitView >> target: anObject [
	target := anObject
]
