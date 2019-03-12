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
	#name : #ListConnector,
	#superclass : #Object,
	#category : #'TrelloProject-controllers'
}

{ #category : #'api-test' }
ListConnector class >> createCardWithName: aName inList: list [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/lists/' , list id , '/cards?key=' , TrelloApplication instance applicationUser key , '&token='
								, TrelloApplication instance applicationUser token;
				addPart: (ZnMimePart fieldName: 'name' value: aName);
				post;
				response) contents
]

{ #category : #'api-test' }
ListConnector class >> createDefaultList [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
					'https://api.trello.com/1/lists?name=' , TrelloApplication instance applicationUser key	, '&idBoard=' , TrelloApplication instance applicationUser board , '&key='
						, TrelloApplication instance applicationUser key , '&token='
						, TrelloApplication instance applicationUser token;
				post;
				response) contents
]

{ #category : #'api-test' }
ListConnector class >> getAllCardsByList: aListId [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/lists/' , aListId , '/cards?key=' , TrelloApplication instance applicationUser key , '&token='
								, TrelloApplication instance applicationUser token;
				get;
				response) contents
]

{ #category : #'api-test' }
ListConnector class >> getFullListInfo: listId [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/lists/' , listId , '?key=' , TrelloApplication instance applicationUser key , '&token='
								, TrelloApplication instance applicationUser token , '&cards=all';
				get;
				response) contents
]

{ #category : #'api-test' }
ListConnector class >> getListInfo: listId [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/lists/' , listId , '?key=' , TrelloApplication instance applicationUser key , '&token='
								, TrelloApplication instance applicationUser token;
				get;
				response) contents
]
