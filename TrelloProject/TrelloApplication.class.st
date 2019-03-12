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

    Instance Variables
	applicationUser:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloApplication,
	#superclass : #Object,
	#instVars : [
		'applicationUser'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'TrelloProject-model'
}

{ #category : #'instance creation' }
TrelloApplication class >> instance [
	instance ifNil: [ Exception signal: 'You must create a TrelloApplication' ].
	^ instance
]

{ #category : #'instance creation' }
TrelloApplication class >> new: aKey token: aToken user: aUsername [
	instance := [ super new initialize: aKey token: aToken user: aUsername ]
		on: Error
		do: [ Error raise ].
	^ self instance
]

{ #category : #accessing }
TrelloApplication >> applicationUser [
	^ applicationUser
]

{ #category : #accessing }
TrelloApplication >> applicationUser: anObject [
	applicationUser := anObject
]

{ #category : #initialization }
TrelloApplication >> initialize: aKey token: aToken user: aUsername [
	| aDictionary |
	aDictionary := UserConnector loginWith: aUsername key: aKey andToken: aToken.
	self applicationUser: (UserFactory instance createFullUserWithKey: aKey token: aToken andUserDictionary: aDictionary).
	"self applicationUser boards: BoardOrchestrator getBoards."
	


]
