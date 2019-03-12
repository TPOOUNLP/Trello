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
	token:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloProjectTokenSetting,
	#superclass : #TrelloProjectSettings,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'TrelloProject-controllers'
}

{ #category : #'as yet unclassified' }
TrelloProjectTokenSetting class >> textValue [
	^ TrelloProjectTokenSetting uniqueInstance textValue
]

{ #category : #'as yet unclassified' }
TrelloProjectTokenSetting class >> textValue: aString [
	^ TrelloProjectTokenSetting uniqueInstance checkAndSetTextValueWith: aString
]

{ #category : #'as yet unclassified' }
TrelloProjectTokenSetting class >> tokenSettingOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #tokenSetting)
		order: 2;
		parent: #trelloProjectSettings;
		label: 'Token';
		target: TrelloProjectTokenSetting;
		getSelector: #textValue;
		setSelector: #textValue:;
		notInStyle;
		default: '';
		ghostHelp: 'Token para TrelloProject';
		description: TrelloProjectTokenSettingRequest messagePrompt
]

{ #category : #'as yet unclassified' }
TrelloProjectTokenSetting class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]
