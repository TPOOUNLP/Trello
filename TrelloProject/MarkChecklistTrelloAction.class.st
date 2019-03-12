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
	checkitem:		<Object>


    Implementation Points
"
Class {
	#name : #MarkChecklistTrelloAction,
	#superclass : #TrelloAction,
	#instVars : [
		'checkitem',
		'card'
	],
	#category : #'TrelloProject-actions'
}

{ #category : #'instance creation' }
MarkChecklistTrelloAction class >> putCheckItem: aCheckitem forCard: aCard [
	^super new initialize: aCheckitem forCard: Card.
]

{ #category : #accessing }
MarkChecklistTrelloAction >> card [
	^ card
]

{ #category : #accessing }
MarkChecklistTrelloAction >> card: anObject [
	card := anObject
]

{ #category : #accessing }
MarkChecklistTrelloAction >> checkitem [
	^ checkitem
]

{ #category : #accessing }
MarkChecklistTrelloAction >> checkitem: anObject [
	checkitem := anObject
]

{ #category : #execute }
MarkChecklistTrelloAction >> execute [
	CheckListOrchestrator checkItem: self checkitem forCard: self card.
	^ActionOrchestrator getLastActionIdByCardId: self card id.
]

{ #category : #initialization }
MarkChecklistTrelloAction >> initialize: aCheckitem forCard: aCard [
	^self checkitem: aCheckitem;
			card: aCard;	
			yourself.
]

{ #category : #printing }
MarkChecklistTrelloAction >> printString [
	^ 'Marcar checkitem "', self checkitem printString , '" en tarjeta "', self card printString, '"'.
]
