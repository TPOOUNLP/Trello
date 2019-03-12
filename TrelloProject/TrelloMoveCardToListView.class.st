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
	boardList:		<Object>
	buttonAccept:		<Object>
	buttonCancel:		<Object>
	cardsList:		<Object>
	factory:		<Object>
	listsList:		<Object>
	target:		<Object>
	targetListsList:		<Object>
	trelloOrchestrator:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloMoveCardToListView,
	#superclass : #ComposableModel,
	#instVars : [
		'buttonAccept',
		'checkboxUserLogFilter',
		'buttonCancel',
		'from',
		'to',
		'cards',
		'boards',
		'target'
	],
	#category : #'TrelloProject-views'
}

{ #category : #'as yet unclassified' }
TrelloMoveCardToListView class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :mainColumn | 
					mainColumn newRow: [ :rowCheckbox | rowCheckbox add: #checkboxUserLogFilter ].
					mainColumn newRow: [ :rowBoard | rowBoard add: #boards ].
					mainColumn
						newRow: [ :rowList | 
							rowList
								add: #from;
								add: #to ].
					mainColumn newRow: [ :cardList | cardList add: #cards ].
					mainColumn
						newRow: [ :rowButtons | 
							rowButtons
								add: #buttonCancel;
								add: #buttonAccept ] ];
		yourself
]

{ #category : #accessing }
TrelloMoveCardToListView >> boards [
	^ boards
]

{ #category : #accessing }
TrelloMoveCardToListView >> boards: anObject [
	boards := anObject
]

{ #category : #accessing }
TrelloMoveCardToListView >> buttonAccept [
	^ buttonAccept
]

{ #category : #accessing }
TrelloMoveCardToListView >> buttonAccept: anObject [
	buttonAccept := anObject
]

{ #category : #accessing }
TrelloMoveCardToListView >> buttonCancel [
	^ buttonCancel
]

{ #category : #accessing }
TrelloMoveCardToListView >> buttonCancel: anObject [
	buttonCancel := anObject
]

{ #category : #accessing }
TrelloMoveCardToListView >> cards [
	^ cards
]

{ #category : #accessing }
TrelloMoveCardToListView >> cards: anObject [
	cards := anObject
]

{ #category : #accessing }
TrelloMoveCardToListView >> checkboxUserLogFilter [
	^ checkboxUserLogFilter
]

{ #category : #accessing }
TrelloMoveCardToListView >> checkboxUserLogFilter: anObject [
	checkboxUserLogFilter := anObject
]

{ #category : #accessing }
TrelloMoveCardToListView >> from [
	^ from
]

{ #category : #accessing }
TrelloMoveCardToListView >> from: anObject [
	from := anObject
]

{ #category : #initializing }
TrelloMoveCardToListView >> initializePresenter [
	| selectedCard selectedList targetList selectedBoard|
	selectedList := nil.
	selectedCard := nil.
	targetList := nil.
	checkboxUserLogFilter
		whenActivatedDo: [ selectedList ifNotNil: [ self selectList: selectedList ] ].
	checkboxUserLogFilter
		whenDeactivatedDo: [ selectedList ifNotNil: [ self selectList: selectedList ] ].
	boards
		whenSelectedItemChanged: [ :board | 
			self selectBoard: board.
			cards items: #().
			selectedList := nil.
			selectedCard := nil.
			 selectedBoard := board].
	from
		whenSelectedItemChanged: [ :list | 
			self selectList: list.
			selectedList := list ].
	to
		whenSelectedItemChanged: [ :tlist | 
			targetList := tlist.
			].
	cards
		whenSelectedItemChanged: [ :card | 
			selectedCard := card.
			].
	buttonCancel action: [ self window close ].
	buttonAccept
		action: [ 
			selectedBoard isNil ifTrue: [ self inform: 'Debe seleccionar un tablero'  ]
				ifFalse:[
					selectedList isNil ifTrue: [ self inform: 'Debe seleccionar una lista origen'  ]
						ifFalse:[
							targetList isNil ifTrue: [ self inform: 'Debe seleccionar una lista destino'  ]
								ifFalse:[
									selectedCard isNil ifTrue: [ self inform: 'Debe seleccionar una tarjeta'  ]
									].			
							].				
					].					
			(selectedList isNotNil & selectedCard isNotNil & targetList isNotNil)
				ifTrue: [ 
					self target
				addAction: (MoveCardTrelloActionFactory instance createWithCard: selectedCard withList: targetList).
			self window close ]
			 ].
]

{ #category : #initializing }
TrelloMoveCardToListView >> initializeWidgets [
	self
		instantiateModels:
			#(#boards #ListModel #from #ListModel #cards #ListModel #to #ListModel #buttonAccept #ButtonModel #buttonCancel #ButtonModel #checkboxUserLogFilter #CheckBoxModel).
	self title: 'Mover Tarjeta'.
	self checkboxUserLogFilter label: 'Filtro de tarjetas por usuario actual'.
	self checkboxUserLogFilter labelOnLeft.
	self checkboxUserLogFilter state: true.
	buttonAccept
		label: 'Aceptar'.
	boards items: TrelloApplication instance applicationUser boards.
	from items: #().
	to items: #().
	cards items: #().
	buttonCancel label: 'Cancelar'
]

{ #category : #accessing }
TrelloMoveCardToListView >> initializeWithTarget: aTarget [
	target := aTarget
]

{ #category : #manipulating }
TrelloMoveCardToListView >> selectBoard: aBoard [
	self from items: aBoard lists.
	self to items: aBoard lists.
]

{ #category : #manipulating }
TrelloMoveCardToListView >> selectList: aList [
	| cardList |
	cardList := self checkboxUserLogFilter state
		ifTrue: [ CardOrchestrator getCardsByList: aList forUser: TrelloApplication instance applicationUser ]
		ifFalse: [ aList cards ].
	self cards items: cardList
]

{ #category : #accessing }
TrelloMoveCardToListView >> target [
	^ target
]

{ #category : #accessing }
TrelloMoveCardToListView >> target: anObject [
	target := anObject
]

{ #category : #accessing }
TrelloMoveCardToListView >> to [
	^ to
]

{ #category : #accessing }
TrelloMoveCardToListView >> to: anObject [
	to := anObject
]
