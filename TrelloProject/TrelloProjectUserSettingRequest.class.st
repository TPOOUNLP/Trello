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
	initialAnswer:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloProjectUserSettingRequest,
	#superclass : #Notification,
	#instVars : [
		'initialAnswer'
	],
	#category : #'TrelloProject-menu-settings'
}

{ #category : #'as yet unclassified' }
TrelloProjectUserSettingRequest class >> messagePrompt [
	^
'Aqui se va a guardar el Usuario que se utiliza para logearse en el board de Trello.
'
]

{ #category : #acccessing }
TrelloProjectUserSettingRequest >> defaultAction [
	^ UIManager default
			request: self messagePrompt
			initialAnswer: initialAnswer
			title: 'Token para TrelloProject' translated
]

{ #category : #initialization }
TrelloProjectUserSettingRequest >> initialAnswer [
	
	^ initialAnswer
]

{ #category : #initialization }
TrelloProjectUserSettingRequest >> initialAnswer: anObject [
	
	initialAnswer := anObject
]

{ #category : #acccessing }
TrelloProjectUserSettingRequest >> messagePrompt [
	^ self class messagePrompt
]
