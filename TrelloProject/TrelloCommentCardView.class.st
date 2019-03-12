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
	commentText:		<Object>
	factory:		<Object>
	listsList:		<Object>
	target:		<Object>
	trelloOrchestrator:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloCommentCardView,
	#superclass : #ComposableModel,
	#instVars : [
		'buttonAccept',
		'checkboxUserLogFilter',
		'buttonCancel',
		'commentText',
		'target',
		'boards',
		'cards',
		'lists',
		'checklists',
		'checkitemsToDo',
		'checkitemsDone',
		'checksTitle',
		'checkToDoTitle',
		'checkDoneTitle'
	],
	#category : #'TrelloProject-views'
}

{ #category : #'as yet unclassified ' }
TrelloCommentCardView class >> defaultSpec [
	^ SpecLayout composed 
	newRow:[:row |
		row newColumn: [ :mainColumn | 
					mainColumn newRow: [ :rowCheckbox | rowCheckbox add: #checkboxUserLogFilter ].
					mainColumn newRow: [ :rowBoard | rowBoard add: #boards ].
					mainColumn newRow: [ :rowList | rowList add: #lists ].
					mainColumn newRow: [ :cardList | cardList add: #cards ].
					mainColumn newRow: [ :commentText | commentText add: #commentText ].
					mainColumn
						newRow: [ :rowButtons | 
							rowButtons
								add: #buttonCancel;
								add: #buttonAccept ] ];
			newColumn: [ :right |
					right newRow: #checksTitle.
					right newRow: [ :checkList | checkList add: #checklists].
					right newRow: [ :aRow | 
						aRow newColumn: [:todo | 
							todo add: #checkToDoTitle.
							todo add: #checkitemsToDo].
						"newColumn: [:done |
							done add: #checkDoneTitle.
							done add: #checkitemsDone 
							]"]	.		
					right newRow:[ :newRow | newRow]]]
		yourself
]

{ #category : #accessing }
TrelloCommentCardView >> boards [
	^ boards
]

{ #category : #accessing }
TrelloCommentCardView >> boards: anObject [
	boards := anObject
]

{ #category : #accessing }
TrelloCommentCardView >> buttonAccept [
	^ buttonAccept
]

{ #category : #accessing }
TrelloCommentCardView >> buttonAccept: anObject [
	buttonAccept := anObject
]

{ #category : #accessing }
TrelloCommentCardView >> buttonCancel [
	^ buttonCancel
]

{ #category : #accessing }
TrelloCommentCardView >> buttonCancel: anObject [
	buttonCancel := anObject
]

{ #category : #accessing }
TrelloCommentCardView >> cards [
	^ cards
]

{ #category : #accessing }
TrelloCommentCardView >> cards: anObject [
	cards := anObject
]

{ #category : #accessing }
TrelloCommentCardView >> checkDoneTitle [
	^ checkDoneTitle
]

{ #category : #accessing }
TrelloCommentCardView >> checkDoneTitle: anObject [
	checkDoneTitle := anObject
]

{ #category : #accessing }
TrelloCommentCardView >> checkToDoTitle [
	^ checkToDoTitle
]

{ #category : #accessing }
TrelloCommentCardView >> checkToDoTitle: anObject [
	checkToDoTitle := anObject
]

{ #category : #accessing }
TrelloCommentCardView >> checkboxUserLogFilter [
	^ checkboxUserLogFilter
]

{ #category : #accessing }
TrelloCommentCardView >> checkboxUserLogFilter: anObject [
	checkboxUserLogFilter := anObject
]

{ #category : #accessing }
TrelloCommentCardView >> checkitems [
	^ checkitems
]

{ #category : #accessing }
TrelloCommentCardView >> checkitems: anObject [
	checkitems := anObject
]

{ #category : #accessing }
TrelloCommentCardView >> checkitemsDone [
	^ checkitemsDone
]

{ #category : #accessing }
TrelloCommentCardView >> checkitemsDone: anObject [
	checkitemsDone := anObject
]

{ #category : #accessing }
TrelloCommentCardView >> checkitemsToDo [
	^ checkitemsToDo
]

{ #category : #accessing }
TrelloCommentCardView >> checkitemsToDo: anObject [
	checkitemsToDo := anObject
]

{ #category : #accessing }
TrelloCommentCardView >> checklists [
	^ checklists
]

{ #category : #accessing }
TrelloCommentCardView >> checklists: anObject [
	checklists := anObject
]

{ #category : #accessing }
TrelloCommentCardView >> checksTitle [
	^ checksTitle
]

{ #category : #accessing }
TrelloCommentCardView >> checksTitle: anObject [
	checksTitle := anObject
]

{ #category : #accessing }
TrelloCommentCardView >> commentText [
	^ commentText
]

{ #category : #accessing }
TrelloCommentCardView >> commentText: anObject [
	commentText := anObject
]

{ #category : #initializing }
TrelloCommentCardView >> initializePresenter [
	| selectedCard selectedList selectedCheckItem selectedBoard |
	selectedList := nil.
	selectedCard := nil.
	selectedCheckItem := nil.
	checkboxUserLogFilter whenActivatedDo: [ 
		selectedList ifNotNil: [ 
			self selectList: selectedList 
			] 
		].
	checkboxUserLogFilter whenDeactivatedDo: [ 
		selectedList ifNotNil: [ 
			self selectList: selectedList 
			] 
		].
	boards
		whenSelectedItemChanged: [ :board | 
			self selectBoard: board.
			cards items: #().
			selectedList := nil.
			selectedCard := nil.
			selectedBoard := board].
	lists
		whenSelectedItemChanged: [ :list | 
			self selectList: list.
			selectedList:= list ].
	cards
		whenSelectedItemChanged: [ :card | 
			self selectCard: card.
			self buttonAccept enable.
			selectedCard := card ].
	checklists 
		whenSelectedItemChanged: [ :checklist |
			self selectChecklist: checklist .
			].
	"checkitemsDone 
		whenSelectedItemChanged: [ :checkItemDone |
					self selectCheckitem: checkItemDone.
			 ]."
	checkitemsToDo
		whenSelectedItemChanged: [ :checkItemToDo |
					self selectCheckitem: checkItemToDo.
					selectedCheckItem := checkItemToDo.
			].
	buttonCancel action: [ self window close ].
	buttonAccept
		action: [
			selectedBoard isNil ifTrue: [ self inform: 'Debe seleccionar un tablero'  ]
				ifFalse:[
					selectedList isNil ifTrue: [ self inform: 'Debe seleccionar una lista'  ]
						ifFalse:[
								selectedCard isNil ifTrue: [ self inform: 'Debe seleccionar una tarjeta'  ]
									ifFalse:[
										selectedCard
											ifNotNil:  [ (commentText text isEmpty)  
												ifFalse:[	
													self target	addAction:
														(CommentCardTrelloActionFactory instance createActionWithCard: selectedCard withComment: commentText text).
														].
													selectedCheckItem ifNotNil:[
														self target addAction:
															(MarkChecklistTrelloActionFactory instance createWithCheckItem: selectedCheckItem forCard: selectedCard ).
													].
												].
											(commentText text isEmpty & selectedCheckItem isNil)
												ifTrue: [ self inform: 'Debe escribir un comentario o seleccionar un checkItem' ]
												ifFalse: [ self window close ].
											].
										].
									].
								].
]

{ #category : #initializing }
TrelloCommentCardView >> initializeWidgets [
	self
		instantiateModels:
			#(boards ListModel lists ListModel cards ListModel checklists ListModel checkitemsToDo ListModel checkitemsDone ListModel commentText TextInputFieldModel buttonAccept ButtonModel buttonCancel ButtonModel checkboxUserLogFilter CheckBoxModel checksTitle LabelModel checkToDoTitle LabelModel checkDoneTitle LabelModel).
	self title: 'Agregar Comentario'.
	self checkboxUserLogFilter label: 'Filtro de tarjetas por usuario actual'.
	self checkboxUserLogFilter labelOnLeft.
	self checkboxUserLogFilter state: true.
	self commentText autoAccept: true.
	buttonAccept
		label: 'Aceptar'.
	boards items: TrelloApplication instance applicationUser boards.
	lists items: #().
	cards items: #().
	self checksTitle label: 'Checkslists de la tarjeta seleccionada'.	
	checklists items: #().
	self checkToDoTitle label: 'Por hacer'.
	self checkDoneTitle label: 'Hecho'.
	"checkitemsDone items: #()."
	checkitemsToDo items: #().
	buttonCancel label: 'Cancelar'
]

{ #category : #initializing }
TrelloCommentCardView >> initializeWithTarget: aTarget [
	self target: aTarget
]

{ #category : #accessing }
TrelloCommentCardView >> lists [
	^ lists
]

{ #category : #accessing }
TrelloCommentCardView >> lists: anObject [
	lists := anObject
]

{ #category : #initializing }
TrelloCommentCardView >> selectBoard: aBoard [
	self lists items: aBoard lists .
]

{ #category : #initializing }
TrelloCommentCardView >> selectCard: aCard [
	self checklists items: (CheckListOrchestrator getChecklistsByCard: aCard).
]

{ #category : #initializing }
TrelloCommentCardView >> selectCheckitem: aCheckitem [
	aCheckitem isCompleted: true.
]

{ #category : #initializing }
TrelloCommentCardView >> selectChecklist: aChecklist [
	self checkitemsToDo items: (aChecklist checkItems reject: [:item | item isCompleted ]).
	self checkitemsDone items: (aChecklist checkItems select: [:item | item isCompleted ])
]

{ #category : #initializing }
TrelloCommentCardView >> selectList: aList [
	| cardList |
	cardList := self checkboxUserLogFilter state
		ifTrue: [ CardOrchestrator getCardsByList: aList forUser: TrelloApplication instance applicationUser ]
		ifFalse: [ aList cards ].
	self cards items: cardList
]

{ #category : #accessing }
TrelloCommentCardView >> target [
	^ target
]

{ #category : #accessing }
TrelloCommentCardView >> target: anObject [
	target := anObject
]
