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


    Implementation Points
"
Class {
	#name : #TrelloErrorMessageView,
	#superclass : #ComposableModel,
	#instVars : [
		'labelError'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'TrelloProject-views'
}

{ #category : #'as yet unclassified' }
TrelloErrorMessageView class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :mainColumn | mainColumn newRow: [ :row | row add: #labelError ] ];
		yourself
]

{ #category : #'as yet unclassified' }
TrelloErrorMessageView class >> instance [
	^ instance
]

{ #category : #'as yet unclassified' }
TrelloErrorMessageView class >> new [
	instance := super new.
	^ instance
]

{ #category : #initializing }
TrelloErrorMessageView >> initializeWidgets [

	self instantiateModels: #(	
				labelError LabelModel
	).
	
	self title: 'Trello'.
	self labelError label: 'Se te rompio todo el trello'.
	
]

{ #category : #accesing }
TrelloErrorMessageView >> labelError [
	^labelError
]

{ #category : #accesing }
TrelloErrorMessageView >> labelError: anObject [
	labelError := anObject
]
