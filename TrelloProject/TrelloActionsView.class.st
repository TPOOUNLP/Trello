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
	actions:		<Object>
	actionsList:		<Object>
	buttonAddMoveCardAction:		<Object>
	buttonCommentCardAction:		<Object>
	buttonExecute:		<Object>
	buttonNewCardAction:		<Object>
	buttonRemoveAction:		<Object>
	trelloOrchestrator:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloActionsView,
	#superclass : #ComposableModel,
	#instVars : [
		'actionsList',
		'buttonRemoveAction',
		'buttonAddMoveCardAction',
		'buttonCommentCardAction',
		'buttonNewCardAction',
		'buttonCommit',
		'buttonExecute',
		'actions'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'TrelloProject-views'
}

{ #category : #specs }
TrelloActionsView class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :mainColumn | 
					mainColumn newRow: [ :rowActions | rowActions add: #actionsList ].
					mainColumn
						newRow: [ :buttonsRow | 
							buttonsRow
								add: #buttonRemoveAction;
								add: #buttonAddMoveCardAction;
								add: #buttonCommentCardAction;
								add: #buttonNewCardAction;
								add: #buttonCommit;
								add: #buttonExecute ] ];
		yourself
]

{ #category : #'instance creation' }
TrelloActionsView class >> instance [
	^ instance
]

{ #category : #'instance creation' }
TrelloActionsView class >> new [
	instance := super new.
	^ instance
]

{ #category : #accessing }
TrelloActionsView >> actions [
	^ actions
]

{ #category : #accessing }
TrelloActionsView >> actions: anObject [
	actions := anObject
]

{ #category : #accessing }
TrelloActionsView >> actionsList [
	^ actionsList
]

{ #category : #accessing }
TrelloActionsView >> actionsList: anObject [
	actionsList := anObject
]

{ #category : #manipulating }
TrelloActionsView >> addAction: anAction [	
	self actions add: anAction.
	self refreshActionsList .
]

{ #category : #accessing }
TrelloActionsView >> buttonAddMoveCardAction [
	^ buttonAddMoveCardAction
]

{ #category : #accessing }
TrelloActionsView >> buttonAddMoveCardAction: anObject [
	buttonAddMoveCardAction := anObject
]

{ #category : #accessing }
TrelloActionsView >> buttonCommentCardAction [
	^ buttonCommentCardAction
]

{ #category : #accessing }
TrelloActionsView >> buttonCommentCardAction: anObject [
	buttonCommentCardAction := anObject
]

{ #category : #accessing }
TrelloActionsView >> buttonCommit [
	^ buttonCommit
]

{ #category : #accessing }
TrelloActionsView >> buttonCommit: anObject [
	buttonCommit := anObject
]

{ #category : #accessing }
TrelloActionsView >> buttonExecute [
	^ buttonExecute
]

{ #category : #accessing }
TrelloActionsView >> buttonExecute: anObject [
	buttonExecute := anObject
]

{ #category : #accessing }
TrelloActionsView >> buttonNewCardAction [
	^ buttonNewCardAction
]

{ #category : #accessing }
TrelloActionsView >> buttonNewCardAction: anObject [
	buttonNewCardAction := anObject
]

{ #category : #accessing }
TrelloActionsView >> buttonRemoveAction [
	^ buttonRemoveAction
]

{ #category : #accessing }
TrelloActionsView >> buttonRemoveAction: anObject [
	buttonRemoveAction := anObject
]

{ #category : #manipulating }
TrelloActionsView >> executeActions [
	^self actions:(self actions collect: [ :action | action execute ]).
]

{ #category : #initializing }
TrelloActionsView >> initializePresenter [
	| selectedAction |
	selectedAction := ''.
	self actionsList
		whenSelectedItemChanged: [ :action | 
			selectedAction := action.
			self buttonRemoveAction enable ].
	self buttonExecute
		action: [ 
			self executeActions.
			self window close ].
	self buttonRemoveAction
		action: [ 
			self removeAction: selectedAction.
			self buttonRemoveAction disable ].
	self buttonAddMoveCardAction
		action: [ 
			| view |
			view := TrelloMoveCardToListView new.
			view openWithSpec.
			view initializeWithTarget: self ].
	self buttonCommentCardAction
		action: [ 
			| view |
			view := TrelloCommentCardView new.
			view openWithSpec.
			view initializeWithTarget: self ].
	self buttonNewCardAction
		action: [ 
			| view |
			view := TrelloNewCardView new.
			view openWithSpec.
			view initializeWithTarget: self ].
	self buttonCommit 
		action: [ 
			| view |
			view := TrelloCommitView new.
			view openWithSpec.
			view initializeWithTarget: self ]
]

{ #category : #initializing }
TrelloActionsView >> initializeWidgets [
	self
		instantiateModels:
			#(actionsList ListModel buttonRemoveAction ButtonModel buttonAddMoveCardAction ButtonModel buttonCommentCardAction ButtonModel buttonNewCardAction ButtonModel buttonCommit ButtonModel buttonExecute ButtonModel).
	self title: 'Trello'.
	self buttonRemoveAction
		label: 'Remover accion';
		disable.
	self buttonAddMoveCardAction label: 'Mover tarjeta'.
	self buttonCommentCardAction label: 'Comentar tarjeta'.
	self buttonNewCardAction label: 'Agregar tarjeta'.
	self buttonCommit label: 'Commit'.
	self buttonExecute
		label: 'Aplicar';
		disable.
	self actions: OrderedCollection new.
	self actionsList items: self actions
]

{ #category : #printing }
TrelloActionsView >> printActions [
| header |
	self actions isEmpty ifTrue: [ ^'' ].
	header:='Executed Trello actions:', String cr.
	^ self actions inject: header into: [ :aHeader :anAction | aHeader, anAction, String cr].
		
]

{ #category : #manipulating }
TrelloActionsView >> refreshActionsList [
	self actionsList items: self actions.
	self actions isEmpty
		ifFalse: [ self buttonExecute enable ]
		ifTrue: [ self buttonExecute disable ]
]

{ #category : #manipulating }
TrelloActionsView >> removeAction: anAction [
	self actions remove: anAction.
	self refreshActionsList .
]
