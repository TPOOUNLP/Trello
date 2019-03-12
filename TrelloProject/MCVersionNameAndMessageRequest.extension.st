Extension { #name : #MCVersionNameAndMessageRequest }

{ #category : #'*TrelloProject' }
MCVersionNameAndMessageRequest >> defaultAction [
	| instance actionId message morph card |
	instance := MCSaveVersionDialog new.
	message := ''.
	instance
		versionName: suggestion;
		logMessage:
				(TrelloActionsView instance isNotNil
						ifTrue: [ TrelloActionsView instance printActions ]
						ifFalse: [ '' ]).
	morph := instance window.
	morph
		on: $t shift command
		do: [ 
			actionId := (instance findTextMorph: #logMessage) textMorph selection.
			[ 
			card := CardOrchestrator getCardByActionId: actionId.
			message := card at: 'name' ]
				on: Error
				do: [ message := 'Lo seleccionado no corresponde con un Action Id valido' ].
			UIManager default inform: message ].
	^ instance showModally
]
