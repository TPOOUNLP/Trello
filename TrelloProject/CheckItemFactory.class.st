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


    Implementation Points
"
Class {
	#name : #CheckItemFactory,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'TrelloProject-factories'
}

{ #category : #'accessing instances and variables' }
CheckItemFactory class >> instance [
	instance ifNil: [ instance := self new. ].
	^instance.
]

{ #category : #factory }
CheckItemFactory >> createCheckItem: aCheckItemDictionary [
	^CheckItem newName: (aCheckItemDictionary at:'name')
				 id: (aCheckItemDictionary at:'id')
				 pos: (aCheckItemDictionary at:'pos')
				completed: ((aCheckItemDictionary at:'state') = 'complete').
]
