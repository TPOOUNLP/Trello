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
	#name : #CardConnector,
	#superclass : #Object,
	#classVars : [
		'Instance'
	],
	#category : #'TrelloProject-controllers'
}

{ #category : #'api-test' }
CardConnector class >> commentCard: cardId text: text [
	^ ZnClient new
		url:
			'https://api.trello.com/1/cards/' , cardId , '/actions/comments?key='
				, TrelloApplication instance applicationUser key , '&token='
				, TrelloApplication instance applicationUser token;
		formAt: 'text' put: text;
		post
]

{ #category : #'api-test' }
CardConnector class >> getCardActions: cardId [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
					'https://api.trello.com/1/cards/' , cardId , '/actions?key='
						, TrelloApplication instance applicationUser key , '&token='
						, TrelloApplication instance applicationUser token;
				get;
				response) contents
]

{ #category : #'api-test' }
CardConnector class >> getCardComments: cardId [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/cards/' , cardId , '/actions?filter=commentCard&key='
								, TrelloApplication instance applicationUser key , '&token=' , TrelloApplication instance applicationUser token;
				get;
				response) contents
]

{ #category : #'api-test' }
CardConnector class >> getCardInfo: cardId [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/cards/' , cardId , '?key=' , TrelloApplication instance applicationUser key , '&token='
								, TrelloApplication instance applicationUser token;
				get;
				response) contents
]

{ #category : #'api-test' }
CardConnector class >> getFullCardInfo: cardId [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/cards/' , cardId , '?actions=createCard,commentCard,moveCardFromBoard&key='
								, TrelloApplication instance applicationUser key , '&token=' , TrelloApplication instance applicationUser token
								, '&members=true' , '&checklists=all&checklist_fields=all';
				get;
				response) contents
]

{ #category : #'api-test' }
CardConnector class >> moveCard: cardId toList: listId [
	^ (ZnClient new
		url:
				'https://api.trello.com/1/cards/' , cardId , '?key=' , TrelloApplication instance applicationUser key , '&token='
						, TrelloApplication instance applicationUser token;
		formAt: 'idList' put: listId;
		put;
		response) contents
]
