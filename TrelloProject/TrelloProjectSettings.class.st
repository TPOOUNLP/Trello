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
	#name : #TrelloProjectSettings,
	#superclass : #Object,
	#instVars : [
		'textValue'
	],
	#category : #'TrelloProject-controllers'
}

{ #category : #'as yet unclassified' }
TrelloProjectSettings class >> areEmptyConnectionSettings [
	| emptySetting |
	emptySetting := TrelloProjectApplicationKeySetting uniqueInstance textValue.
	emptySetting = ''
		ifTrue: [ ^ true ]
		ifFalse: [ 
			emptySetting := TrelloProjectTokenSetting uniqueInstance textValue.
			emptySetting = ''
				ifTrue: [ ^ true ]
				ifFalse: [ 
					emptySetting := TrelloProjectUserSetting uniqueInstance textValue.
					emptySetting = ''
						ifTrue: [ ^ true ]
						ifFalse: [ ^ false ] ] ]
]

{ #category : #'as yet unclassified' }
TrelloProjectSettings class >> clearSavedConnectionSettings [
	TrelloProjectApplicationKeySetting uniqueInstance textValue: ''.
	TrelloProjectTokenSetting uniqueInstance textValue: ''.
	TrelloProjectUserSetting uniqueInstance textValue: ''
]

{ #category : #'as yet unclassified' }
TrelloProjectSettings class >> textValue [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TrelloProjectSettings class >> textValue: aString [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TrelloProjectSettings class >> trelloProjectSettingOn: aBuilder [
	<systemsettings>
	(aBuilder group: #trelloProjectSettings)
		label: 'TrelloProject';
		description: 'TrelloProject Settings'
]

{ #category : #'as yet unclassified' }
TrelloProjectSettings class >> uniqueInstance [
	self subclassResponsibility
]

{ #category : #manipulating }
TrelloProjectSettings >> checkAndSetTextValueWith: aString [
	| s allowed |
	aString ifNil: [ ^ self ].
	s := ''.
	allowed := ($A to: $Z) , ($a to: $z) , ($0 to: $9).
	aString
		do: [ :c | 
			(allowed includes: c)
				ifTrue: [ s := s , c asString ] ].
	self textValue: s
]

{ #category : #initialization }
TrelloProjectSettings >> initialize [
	super initialize.
	textValue := ''
]

{ #category : #manipulating }
TrelloProjectSettings >> reset [
	textValue := ''
]

{ #category : #accessing }
TrelloProjectSettings >> textValue [
	^ textValue
]

{ #category : #accessing }
TrelloProjectSettings >> textValue: anObject [
	textValue := anObject
]
