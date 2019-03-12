"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State the name of the class with one line description: For example, I'm xxx the root of the hierarchy of visitor objects.
.
For the Responsibility part: Three sentences about my main responsibility, what I'm doing, what services do I offer.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- what is the way to create instances is a plus.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	card:		<Object>
	content:		<Object>
	id:		<Object>
	user:		<Object>


    Implementation Points
"
Class {
	#name : #Comment,
	#superclass : #Object,
	#instVars : [
		'id',
		'user',
		'content'
	],
	#category : #'TrelloProject-model'
}

{ #category : #'instance creation' }
Comment class >> new: aContent from: aUser withId: aId [
	^ super new initialize: aContent from: aUser withId: aId
]

{ #category : #accessing }
Comment >> content [

^content
]

{ #category : #accessing }
Comment >> content:aContent [

 content:= aContent.
]

{ #category : #accessing }
Comment >> id [ 

^id 
]

{ #category : #accessing }
Comment >> id: aId [

id:=aId.
]

{ #category : #initialization }
Comment >> initialize: aContent from:aUser withId:aId [

self content:aContent.
self user:aUser.
self id:aId.
]

{ #category : #printing }
Comment >> printString [
	^ self content. 
]

{ #category : #accessing }
Comment >> user [

^user.
]

{ #category : #accessing }
Comment >> user:aUser [

user:=aUser.
]
