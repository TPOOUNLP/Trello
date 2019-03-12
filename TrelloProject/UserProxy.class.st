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
	id:		<Object>
	key:		<Object>
	token:		<Object>


    Implementation Points
"
Class {
	#name : #UserProxy,
	#superclass : #ProtoObject,
	#instVars : [
		'key',
		'token',
		'id'
	],
	#category : #'TrelloProject-proxies'
}

{ #category : #'instance creation' }
UserProxy class >> newWithKey: aKey token: aToken andId: anId [
	^ super new initializeWithKey: aKey token: aToken andId: anId
]

{ #category : #proxy }
UserProxy >> doesNotUnderstand: aMessage [
	| user |
	user := UserOrchestrator getCurrentUser .
	self become: user.
	^self perform: aMessage selector withArguments: aMessage arguments.
]

{ #category : #accessing }
UserProxy >> id [
	^ id
]

{ #category : #accessing }
UserProxy >> id: anObject [
	id := anObject
]

{ #category : #initialization }
UserProxy >> initializeWithKey: aKey token: aToken andId: anId [
	key := aKey.
	token := aToken.
	id := anId
]

{ #category : #accessing }
UserProxy >> key [
	^ key
]

{ #category : #accessing }
UserProxy >> key: anObject [
	key := anObject
]

{ #category : #printing }
UserProxy >> printString [
	^ self id
]

{ #category : #accessing }
UserProxy >> token [
	^ token
]

{ #category : #accessing }
UserProxy >> token: anObject [
	token := anObject
]
