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
	appKey:		<Object>


    Implementation Points
"
Class {
	#name : #TrelloProjectApplicationKeySetting,
	#superclass : #TrelloProjectSettings,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'TrelloProject-controllers'
}

{ #category : #'as yet unclassified' }
TrelloProjectApplicationKeySetting class >> applicationKeySettingOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #applicationKeySetting)
		order: 1;
		parent: #trelloProjectSettings;
		label: 'Application Key';
		target: TrelloProjectApplicationKeySetting;
		getSelector: #textValue;
		setSelector: #textValue:;
		notInStyle;
		default: '';
		ghostHelp: 'Application Key para TrelloProject';
		description: TrelloProjectApplicationKeySettingRequest messagePrompt
]

{ #category : #'as yet unclassified' }
TrelloProjectApplicationKeySetting class >> textValue [
	^ TrelloProjectApplicationKeySetting uniqueInstance textValue
]

{ #category : #'as yet unclassified' }
TrelloProjectApplicationKeySetting class >> textValue: aString [
	^ TrelloProjectApplicationKeySetting uniqueInstance checkAndSetTextValueWith: aString
]

{ #category : #'as yet unclassified' }
TrelloProjectApplicationKeySetting class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]
