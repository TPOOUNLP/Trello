"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:
 
For the Class part:  State the name of the class with one line description: For example, I'm xxx the root of the hierarchy of visitor objects.

For the Responsibility part: Three sentences about my main responsibility, what I'm doing, what services do I offer.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 
.
Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	boards:		<Object>
	trelloConnector:		<Object>
	trelloView:		<Object>
	user:		<Object>
	userToken:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloOrchestrator,
	#superclass : #Object,
	#category : #'TrelloProject-controllers'
}

{ #category : #'instance creation' }
TrelloOrchestrator class >> commit: package in: repo [
	^ NautilusMonticello default commit: package workingCopy in: repo
]

{ #category : #'instance creation' }
TrelloOrchestrator class >> getInstanceOfTrelloActionsView [
	^ TrelloActionsView instance
]

{ #category : #'instance creation' }
TrelloOrchestrator class >> getInstanceOfTrelloConnectionView [
	^ TrelloConnectionView instance
]

{ #category : #'instance creation' }
TrelloOrchestrator class >> login [
	^ TrelloConnectionView new openWithSpec
]

{ #category : #'instance creation' }
TrelloOrchestrator class >> openActionsView [
	^ TrelloActionsView new openWithSpec
]

{ #category : #'instance creation' }
TrelloOrchestrator class >> openConnectionView [
	^ TrelloConnectionView new openWithSpec
]

{ #category : #'instance creation' }
TrelloOrchestrator class >> saveVersionWithPackage: package andRepo: repo [
	| cards versionInspector |
	TrelloApplication instance applicationUser boards: BoardOrchestrator getBoards asOrderedCollection.
	TrelloOrchestrator openActionsView
		whenClosedDo: [ 
			cards := CardOrchestrator getCardsByActions: TrelloOrchestrator getInstanceOfTrelloActionsView actions.
			versionInspector := TrelloOrchestrator commit: package in: repo.
			cards isEmptyOrNil
				ifFalse: [ CommentOrchestrator commentCardAfterCommit: versionInspector withCards: cards ] ]
]
