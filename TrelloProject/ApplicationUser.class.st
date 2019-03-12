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
	cards:		<Object>
	comments:		<Object>
	token:		<Object>
	userName:		<Object>


    Implementation Points
"
Class {
	#name : #ApplicationUser,
	#superclass : #Object,
	#instVars : [
		'username',
		'token',
		'key',
		'id',
		'fullName',
		'boards'
	],
	#category : #'TrelloProject-model'
}

{ #category : #'instance-creation' }
ApplicationUser class >> newWithKey: aKey token: aToken username: anUsername id: anId andFullname: aFullname [
	^ super new
		initializeWithKey: aKey
		token: aToken
		username: anUsername
		id: anId
		andFullname: aFullname
]

{ #category : #accessing }
ApplicationUser >> addBoard: aBoard [
	self boards add: aBoard
]

{ #category : #accessing }
ApplicationUser >> boards [	
	^ boards 
]

{ #category : #accessing }
ApplicationUser >> boards: anObject [
	boards := anObject
]

{ #category : #accessing }
ApplicationUser >> fullName [
	^ fullName
]

{ #category : #accessing }
ApplicationUser >> fullName: anObject [
	fullName := anObject
]

{ #category : #accessing }
ApplicationUser >> id [
	^ id
]

{ #category : #accessing }
ApplicationUser >> id: anObject [
	id := anObject
]

{ #category : #initialization }
ApplicationUser >> initializeWithKey: aKey token: aToken username: anUsername id: anId andFullname: aFullname [
	self
		key: aKey;
		token: aToken;
		username: anUsername;
		id: anId;
		fullName: aFullname.
]

{ #category : #accessing }
ApplicationUser >> key [
	^ key
]

{ #category : #accessing }
ApplicationUser >> key: anObject [
	key := anObject
]

{ #category : #accessing }
ApplicationUser >> token [
	^ token
]

{ #category : #accessing }
ApplicationUser >> token: anObject [
	token := anObject
]

{ #category : #accessing }
ApplicationUser >> username [
	^ username
]

{ #category : #accessing }
ApplicationUser >> username: anObject [
	username := anObject
]
