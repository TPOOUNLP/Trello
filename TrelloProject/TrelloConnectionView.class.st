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
	buttonNextAction:		<Object>
	inputFieldKey:		<Object>
	textAreaFieldLinks:		<Object>
	trelloOrchestrator:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloConnectionView,
	#superclass : #ComposableModel,
	#instVars : [
		'labelFieldKey',
		'labelFieldKeyLink',
		'labelFieldTokenLink',
		'labelFieldToken',
		'labelFieldUsername',
		'labelFieldDefaultList',
		'trelloApplication',
		'inputTextFieldUsername',
		'inputTextFieldToken',
		'inputTextFieldTokenLink',
		'inputTextFieldKeyLink',
		'inputTextFieldKey',
		'inputTextFieldDefaultList',
		'buttonFinishAction',
		'gap'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'TrelloProject-views'
}

{ #category : #'as yet unclassified ' }
TrelloConnectionView class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :mainColumn | 
			mainColumn newRow: [ :row | row add: #gap ].
			mainColumn newRow: [ :row | row add: #labelFieldUsername ].
			mainColumn newRow: [ :row | row add: #inputTextFieldUsername ].
			mainColumn newRow: [ :row | row add: #gap ].
			mainColumn newRow: [ :row | row add: #labelFieldKeyLink ].
			mainColumn newRow: [ :row | row add: #inputTextFieldKeyLink ].
			mainColumn newRow: [ :row | row add: #gap ].
			mainColumn newRow: [ :row | row add: #labelFieldKey ].
			mainColumn newRow: [ :row | row add: #inputTextFieldKey ].
			mainColumn newRow: [ :row | row add: #gap ].
			mainColumn newRow: [ :row | row add: #labelFieldTokenLink ].
			mainColumn newRow: [ :row | row add: #inputTextFieldTokenLink ].
			mainColumn newRow: [ :row | row add: #gap ].
			mainColumn newRow: [ :row | row add: #labelFieldToken ].
			mainColumn newRow: [ :row | row add: #inputTextFieldToken ].
			mainColumn newRow: [ :row | row add: #gap ].
			mainColumn newRow: [ :row | row add: #labelFieldDefaultList ].
			mainColumn newRow: [ :row | row add: #inputTextFieldDefaultList ].
			mainColumn newRow: [ :row | row add: #gap ].
			mainColumn newRow: [ :row | row add: #buttonFinishAction ]. ];
		yourself
]

{ #category : #'instance-creation' }
TrelloConnectionView class >> instance [
	instance ifNil: [ Exception signal: 'You must create a TrelloOrchestrator' ].
	^ instance
]

{ #category : #'instance-creation' }
TrelloConnectionView class >> new [
	instance := super new.
	instance extent: 880 @ 490.
	^ instance
]

{ #category : #accessing }
TrelloConnectionView >> buttonFinishAction [
	^ buttonFinishAction
]

{ #category : #accessing }
TrelloConnectionView >> buttonFinishAction: anObject [
	buttonFinishAction := anObject
]

{ #category : #accessing }
TrelloConnectionView >> cleanInputTextFields [
	self inputTextFieldUsername text: ''.
	self inputTextFieldKey text: ''.
	self inputTextFieldToken text: ''.
	self inputTextFieldKeyLink text: 'https://trello.com/app-key'.
	self inputTextFieldKeyLink text: 'https://trello.com/1/authorize?key=APPLICATION_KEY&name=TrelloProject&expiration=never&response_type=token&scope=read,write'.
	self buttonFinishAction enabled:false.	
]

{ #category : #accessing }
TrelloConnectionView >> gap [
	^ gap
]

{ #category : #accessing }
TrelloConnectionView >> gap: nada [
	gap:= nada
]

{ #category : #initializing }
TrelloConnectionView >> initializePresenter [
	| key token user activateFinishButtonStep1 activateFinishButtonStep2 activateFinishButtonStep3 stop |
	activateFinishButtonStep1 := false.
	activateFinishButtonStep2 := false.
	activateFinishButtonStep3 := false.
	user := ''.
	self inputTextFieldUsername
		whenTextChanged: [ 
			user := self inputTextFieldUsername text.
			user = ''
				ifTrue: [ 
					activateFinishButtonStep1 := false.
					activateFinishButtonStep1 & activateFinishButtonStep2 & activateFinishButtonStep3
						ifFalse: [ buttonFinishAction enabled: false ] ]
				ifFalse: [ 
					activateFinishButtonStep1 := true.
					activateFinishButtonStep1 & activateFinishButtonStep2 & activateFinishButtonStep3
						ifTrue: [ buttonFinishAction enable ] ] ].
	self labelFieldKeyLink label: 'Ingrese a la siguiente página para obtener el Token asociado a su Application Key'.
	self inputTextFieldKey
		whenTextChanged: [ 
			key := self inputTextFieldKey text.
			key = ''
				ifTrue: [ 
					activateFinishButtonStep2 := false.
					activateFinishButtonStep1 & activateFinishButtonStep2 & activateFinishButtonStep3
						ifFalse: [ buttonFinishAction enabled: false ] ]
				ifFalse: [ 
					activateFinishButtonStep2 := true.
					activateFinishButtonStep1 & activateFinishButtonStep2 & activateFinishButtonStep3
						ifTrue: [ buttonFinishAction enable ]
						ifFalse: [ buttonFinishAction disable ] ].
			self inputTextFieldTokenLink
				text:
					'https://trello.com/1/authorize?key=' , key
						, '&name=TrelloProject&expiration=never&response_type=token&scope=read,write' ].
	self inputTextFieldToken
		whenTextChanged: [ 
			token := self inputTextFieldToken text.
			token = ''
				ifTrue: [ 
					activateFinishButtonStep3 := false.
					activateFinishButtonStep1 & activateFinishButtonStep2 & activateFinishButtonStep3
						ifFalse: [ buttonFinishAction enabled: false ] ]
				ifFalse: [ 
					activateFinishButtonStep3 := true.
					activateFinishButtonStep1 & activateFinishButtonStep2 & activateFinishButtonStep3
						ifTrue: [ buttonFinishAction enable ]
						ifFalse: [ buttonFinishAction disable ] ] ].
	self buttonFinishAction
		action: [ 
			stop := false.
			token := self inputTextFieldToken text.
			TrelloProjectUserSetting uniqueInstance textValue: user.
			TrelloProjectTokenSetting uniqueInstance textValue: token.
			TrelloProjectApplicationKeySetting uniqueInstance textValue: key.
			trelloApplication := [ 
			TrelloApplication new: key token: token user: user.
			TrelloApplication instance applicationUser boards: BoardOrchestrator getBoards asOrderedCollection ]
				on: Error
				do: [ 
					UIManager default alert: 'Los datos ingresados son incorrectos. Por favor, vuelva a intentarlo.' title: 'Advertencia'.
					TrelloProjectSettings clearSavedConnectionSettings.
					stop := true ].
			stop
				ifTrue: [ 
					self cleanInputTextFields.
					trelloApplication := nil ]
				ifFalse: [ self window close ] ].
]

{ #category : #initializing }
TrelloConnectionView >> initializeWidgets [
	self
		instantiateModels:
			#(labelFieldKeyLink LabelModel labelFieldKey LabelModel labelFieldTokenLink LabelModel labelFieldToken LabelModel labelFieldUsername LabelModel labelFieldDefaultList LabelModel buttonFinishAction ButtonModel inputTextFieldKeyLink TextInputFieldModel inputTextFieldKey TextInputFieldModel inputTextFieldTokenLink TextInputFieldModel inputTextFieldToken TextInputFieldModel inputTextFieldUsername TextInputFieldModel inputTextFieldDefaultList TextInputFieldModel gap LabelModel).
	self title: 'Trello Project'.
	self labelFieldKeyLink
		label: 'Ingrese a la siguiente pagina para obtener su Application Key'.
	self inputTextFieldKeyLink text: 'https://trello.com/app-key'.
	self inputTextFieldKeyLink enabled: false.
	self labelFieldTokenLink label: 'Ingrese a la siguiente pagina para obtener su Token'.
	self inputTextFieldTokenLink
		text:
			'https://trello.com/1/authorize?key=APPLICATION_KEY&name=TrelloProject&expiration=never&response_type=token&scope=read,write'.
	self inputTextFieldTokenLink enabled: false.
	self labelFieldKey label: 'Application Key'.
	self labelFieldToken label: 'Token'.
	self labelFieldUsername label: 'Usuario Trello'.
	self labelFieldDefaultList label: 'Lista para Default Commits'.
	self inputTextFieldKey autoAccept: true.
	self inputTextFieldToken autoAccept: true.
	self inputTextFieldUsername autoAccept: true.
	self inputTextFieldDefaultList autoAccept: true.
	self buttonFinishAction label: 'Conectar con Trello'
]

{ #category : #accessing }
TrelloConnectionView >> inputTextFieldDefaultList [
	^ inputTextFieldDefaultList
]

{ #category : #accessing }
TrelloConnectionView >> inputTextFieldDefaultList: anObject [
	inputTextFieldDefaultList := anObject
]

{ #category : #accessing }
TrelloConnectionView >> inputTextFieldKey [
	^ inputTextFieldKey
]

{ #category : #accessing }
TrelloConnectionView >> inputTextFieldKey: anObject [
	inputTextFieldKey := anObject
]

{ #category : #accessing }
TrelloConnectionView >> inputTextFieldKeyLink [
	^ inputTextFieldKeyLink
]

{ #category : #accessing }
TrelloConnectionView >> inputTextFieldKeyLink: anObject [
	inputTextFieldKeyLink := anObject
]

{ #category : #accessing }
TrelloConnectionView >> inputTextFieldToken [
	^ inputTextFieldToken
]

{ #category : #accessing }
TrelloConnectionView >> inputTextFieldToken: anObject [
	inputTextFieldToken := anObject
]

{ #category : #accessing }
TrelloConnectionView >> inputTextFieldTokenLink [
	^ inputTextFieldTokenLink
]

{ #category : #accessing }
TrelloConnectionView >> inputTextFieldTokenLink: anObject [
	inputTextFieldTokenLink := anObject
]

{ #category : #accessing }
TrelloConnectionView >> inputTextFieldUsername [
	^ inputTextFieldUsername
]

{ #category : #accessing }
TrelloConnectionView >> inputTextFieldUsername: anObject [
	inputTextFieldUsername := anObject
]

{ #category : #accessing }
TrelloConnectionView >> labelFieldDefaultList [
	^ labelFieldDefaultList
]

{ #category : #accessing }
TrelloConnectionView >> labelFieldDefaultList: anObject [
	labelFieldDefaultList := anObject
]

{ #category : #accessing }
TrelloConnectionView >> labelFieldKey [
	^ labelFieldKey
]

{ #category : #accessing }
TrelloConnectionView >> labelFieldKey: anObject [
	labelFieldKey := anObject
]

{ #category : #accessing }
TrelloConnectionView >> labelFieldKeyLink [
	^ labelFieldKeyLink
]

{ #category : #accessing }
TrelloConnectionView >> labelFieldKeyLink: anObject [
	labelFieldKeyLink := anObject
]

{ #category : #accessing }
TrelloConnectionView >> labelFieldToken [
	^ labelFieldToken
]

{ #category : #accessing }
TrelloConnectionView >> labelFieldToken: anObject [
	labelFieldToken := anObject
]

{ #category : #accessing }
TrelloConnectionView >> labelFieldTokenLink [
	^ labelFieldTokenLink
]

{ #category : #accessing }
TrelloConnectionView >> labelFieldTokenLink: anObject [
	labelFieldTokenLink := anObject
]

{ #category : #accessing }
TrelloConnectionView >> labelFieldUsername [
	^ labelFieldUsername
]

{ #category : #accessing }
TrelloConnectionView >> labelFieldUsername: anObject [
	labelFieldUsername := anObject
]

{ #category : #accessing }
TrelloConnectionView >> trelloApplication [
	^ trelloApplication
]

{ #category : #accessing }
TrelloConnectionView >> trelloApplication: anObject [
	trelloApplication := anObject
]
