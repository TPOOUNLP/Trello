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
	#name : #CommentOrchestrator,
	#superclass : #Object,
	#category : #'TrelloProject-controllers'
}

{ #category : #'api actions' }
CommentOrchestrator class >> commentCard: aCard text: aComment [
	^ CardConnector commentCard: aCard id text: aComment
]

{ #category : #'api actions' }
CommentOrchestrator class >> commentCardAfterCommit: commit withCards: cards [
	commit ifNotNil: [ 

	^ cards
		collect: [ :aCard | 
			self
				commentCard: aCard
				text:
					'** Name: **' , commit versionInfo name , String cr , '** Author: **'
						, commit versionInfo author , String cr , '** Time: **'
						, commit versionInfo date yyyymmdd , String cr , '** Commit description: **'
						, aCard printString , String cr , String cr , ' ** Description: **'
						, commit versionInfo message ] 
	]
]

{ #category : #'api actions' }
CommentOrchestrator class >> createCommentByDiccionary: aDiccionary [
	^ CommentFactory instance createComment: aDiccionary
]

{ #category : #'api actions' }
CommentOrchestrator class >> getCardCommentsByCard: aCard [
	| diccionary |
	diccionary := CardConnector getCardComments: aCard id.
	^ CommentOrchestrator getCardCommentsByDictionary: diccionary
]

{ #category : #'api actions' }
CommentOrchestrator class >> getCardCommentsByDictionary: diccionary [
	^ (diccionary select: [ :action | (action at: 'type') = 'commentCard' ])
		collect: [ :commentDictionary | CommentFactory instance createComment: commentDictionary ]
]
