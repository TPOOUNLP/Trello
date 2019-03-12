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


    Implementation Points
"
Class {
	#name : #ListFactory,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'TrelloProject-factories'
}

{ #category : #'accessing instances and variables' }
ListFactory class >> instance [
	instance ifNil: [ instance := self new. ].
	^instance.
]

{ #category : #factory }
ListFactory >> createFullList: aListDictionary [
	| list |	
	list := List new: (aListDictionary at:'name') withId: (aListDictionary at: 'id').
	list cards: ((aListDictionary at:'cards') collect: [ :cardDictionary | CardFactory instance createFullCard: cardDictionary]).
	list cards do: [ :each | each list: list ].
	^list.
]

{ #category : #factory }
ListFactory >> createList: aListDictionary [
	^ListProxy new: (aListDictionary at:'name') withId: (aListDictionary at: 'id').
]
