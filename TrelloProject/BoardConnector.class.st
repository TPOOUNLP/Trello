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
	#name : #BoardConnector,
	#superclass : #Object,
	#category : #'TrelloProject-controllers'
}

{ #category : #'api-test' }
BoardConnector class >> createBoard: aName [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/boards?key=' , TrelloApplication instance applicationUser key , '&token='
								, TrelloApplication instance applicationUser token;
				addPart: (ZnMimePart fieldName: 'name' value: aName);
				post;
				response) contents
]

{ #category : #'api-test' }
BoardConnector class >> createListWithName: aName inBoard: aBoard [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/boards/' , aBoard id , '/lists?key=' , TrelloApplication instance applicationUser key
								, '&token=' , TrelloApplication instance applicationUser token;
				addPart: (ZnMimePart fieldName: 'name' value: aName);
				post;
				response) contents
]

{ #category : #'api-test' }
BoardConnector class >> deleteBoard: idBoard [
	ZnClient new
		url:
				'https://api.trello.com/1/boards/' , idBoard , '/closed?value=true&key='
						, TrelloApplication instance applicationUser key , '&token=' , TrelloApplication instance applicationUser token;
		put
]

{ #category : #'api-test' }
BoardConnector class >> getAllListsInfo: boardId [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/board/' , boardId , '/lists?key=' , TrelloApplication instance applicationUser key , '&token='
								, TrelloApplication instance applicationUser token;
				get;
				response) contents
]

{ #category : #'api-test' }
BoardConnector class >> getBoardInfo: boardId [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/boards/' , boardId , '?key=' , TrelloApplication instance applicationUser key , '&token='
								, TrelloApplication instance applicationUser token;
				get;
				response) contents
]

{ #category : #'api-test' }
BoardConnector class >> getFullBoardInfo: boardId [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/boards/' , boardId , '?key=' , TrelloApplication instance applicationUser key , '&token='
								, TrelloApplication instance applicationUser token , '&lists=all';
				get;
				response) contents
]
