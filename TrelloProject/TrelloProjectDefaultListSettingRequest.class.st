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
	initialAnswer:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloProjectDefaultListSettingRequest,
	#superclass : #Notification,
	#instVars : [
		'initialAnswer'
	],
	#category : #'TrelloProject-menu-settings'
}

{ #category : #prompt }
TrelloProjectDefaultListSettingRequest class >> messagePrompt [
	^ 'Aqui se va a guardar el Usuario que se utiliza para logearse en el board de Trello.
'
]

{ #category : #accessing }
TrelloProjectDefaultListSettingRequest >> defaultAction [
	^ UIManager default
		request: self messagePrompt
		initialAnswer: initialAnswer
		title: 'Lista Default para TrelloProject' translated
]

{ #category : #initialization }
TrelloProjectDefaultListSettingRequest >> initialAnswer [
	^ initialAnswer
]

{ #category : #initialization }
TrelloProjectDefaultListSettingRequest >> initialAnswer: anObject [
	initialAnswer := anObject
]

{ #category : #accessing }
TrelloProjectDefaultListSettingRequest >> messagePrompt [
	^ self class messagePrompt
]
