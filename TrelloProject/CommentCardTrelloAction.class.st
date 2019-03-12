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
	card:		<Object>
	comment:		<Object>


    Implementation Points
"
Class {
	#name : #CommentCardTrelloAction,
	#superclass : #TrelloAction,
	#instVars : [
		'card',
		'comment'
	],
	#category : #'TrelloProject-actions'
}

{ #category : #'instance creation' }
CommentCardTrelloAction class >> newWithCard: aCard text: aComment [
	^ super new initialize: aCard text: aComment
]

{ #category : #accessing }
CommentCardTrelloAction >> card [

	^card.
]

{ #category : #accessing }
CommentCardTrelloAction >> card: aCard [
	card := aCard.
]

{ #category : #accessing }
CommentCardTrelloAction >> comment [

	^comment.
]

{ #category : #accessing }
CommentCardTrelloAction >> comment: aComment [

	comment := aComment.
]

{ #category : #execute }
CommentCardTrelloAction >> execute [
	CommentOrchestrator commentCard: self card text: self comment.
	^ActionOrchestrator getLastActionIdByCardId: self card id.
]

{ #category : #initialization }
CommentCardTrelloAction >> initialize: aCard text: aComment [
	^self card: aCard;
		comment: aComment;
		yourself.
]

{ #category : #printing }
CommentCardTrelloAction >> printString [
	^ 'Comentar tarjeta "' , self card printString , '"  con el texto "' , self comment printString , '"'
]
