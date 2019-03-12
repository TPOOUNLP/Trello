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
	#name : #UserConnector,
	#superclass : #Object,
	#category : #'TrelloProject-controllers'
}

{ #category : #'api-test' }
UserConnector class >> getAllMemberCards [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/members/me/cards' , '?key=' , TrelloApplication instance applicationUser key , '&token='
								, TrelloApplication instance applicationUser token;
				get;
				response) contents
]

{ #category : #'api-test' }
UserConnector class >> getUserBoards [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/members/me/boards?filter=open&key=' , TrelloApplication instance applicationUser key
								, '&token=' , TrelloApplication instance applicationUser token;
				get;
				response) contents
]

{ #category : #'api-test' }
UserConnector class >> getUserByUsername: aUsername [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url:
						'https://api.trello.com/1/members/' , aUsername , '?key=' , TrelloApplication instance applicationUser key , '&token='
								, TrelloApplication instance applicationUser token , '&cards=all';
				get;
				response) contents
]

{ #category : #'api-test' }
UserConnector class >> loginWith: aUsername key: aKey andToken: aToken [
	^ NeoJSONReader
		fromString:
			(ZnClient new
				url: 'https://api.trello.com/1/members/' , aUsername , '?key=' , aKey , '&token=' , aToken , '&cards=all';
				get;
				response) contents
]
