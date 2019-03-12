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
	factory:		<Object>
	listsList:		<Object>
	nameText:		<Object>
	nameTitle:		<Object>
	target:		<Object>
	trelloOrchestrator:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloNewCardView,
	#superclass : #ComposableModel,
	#instVars : [
		'buttonAccept',
		'buttonCancel',
		'target',
		'nameTitle',
		'boards',
		'lists',
		'cardName'
	],
	#category : #'TrelloProject-views'
}

{ #category : #'as yet unclassified ' }
TrelloNewCardView class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :mainColumn | 
					mainColumn newRow: [ :rowBoard | rowBoard add: #boards ].
					mainColumn newRow: [ :rowList | rowList add: #lists ].
					mainColumn
						newRow: [ :nameText | 
							nameText
								add: #nameTitle;
								add: #cardName ].
					mainColumn
						newRow: [ :rowButtons | 
							rowButtons
								add: #buttonCancel;
								add: #buttonAccept ] ];
		yourself
]

{ #category : #accessing }
TrelloNewCardView >> boards [
	^ boards
]

{ #category : #accessing }
TrelloNewCardView >> boards: anObject [
	boards := anObject
]

{ #category : #accessing }
TrelloNewCardView >> buttonAccept [
	^ buttonAccept
]

{ #category : #accessing }
TrelloNewCardView >> buttonAccept: anObject [
	buttonAccept := anObject
]

{ #category : #accessing }
TrelloNewCardView >> buttonCancel [
	^ buttonCancel
]

{ #category : #accessing }
TrelloNewCardView >> buttonCancel: anObject [
	buttonCancel := anObject
]

{ #category : #accessing }
TrelloNewCardView >> cardName [
	^ cardName
]

{ #category : #accessing }
TrelloNewCardView >> cardName: anObject [
	cardName := anObject
]

{ #category : #initializing }
TrelloNewCardView >> initializePresenter [
	| selectedList  |
	selectedList := nil.
	boards
		whenSelectedItemChanged: [ :board | 
			self selectBoard: board.
			selectedList := nil.
			self buttonAccept disable.
			cardName text: ''.
			buttonAccept disable ].
	lists
		whenSelectedItemChanged: [ :list | 
			selectedList := list.
			cardName text: ''.
			buttonAccept disable ].
	cardName whenTextChanged: [ buttonAccept enable ].
	buttonCancel action: [ self window close ].
	buttonAccept
		action: [ 			
			self target
				addAction:
					(NewCardTrelloActionFactory instance createActionWithCardName: cardName text to: selectedList).
			self window close ]
]

{ #category : #initializing }
TrelloNewCardView >> initializeWidgets [
	self
		instantiateModels:
			#(#boards #ListModel #lists #ListModel #cardName #TextInputFieldModel #buttonAccept #ButtonModel #buttonCancel #ButtonModel #nameTitle #LabelModel).
	self title: 'Agregar Tarjeta'.
	nameTitle label: 'Nombre nueva tarjeta:'.
	buttonAccept
		label: 'Aceptar';
		disable.
	boards items: TrelloApplication instance applicationUser boards.
	lists items: #().
	buttonCancel label: 'Cancelar'
]

{ #category : #initializing }
TrelloNewCardView >> initializeWithTarget: aTarget [
	target := aTarget
]

{ #category : #accessing }
TrelloNewCardView >> lists [
	^ lists
]

{ #category : #accessing }
TrelloNewCardView >> lists: anObject [
	lists := anObject
]

{ #category : #accessing }
TrelloNewCardView >> nameTitle [
	^ nameTitle
]

{ #category : #accessing }
TrelloNewCardView >> nameTitle: anObject [
	nameTitle := anObject
]

{ #category : #manipulating }
TrelloNewCardView >> selectBoard: aBoard [
	self lists items: aBoard lists.
]

{ #category : #accessing }
TrelloNewCardView >> target [
	^ target
]

{ #category : #accessing }
TrelloNewCardView >> target: anObject [
	target := anObject
]
