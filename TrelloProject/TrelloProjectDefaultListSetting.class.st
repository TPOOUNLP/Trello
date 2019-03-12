"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #TrelloProjectDefaultListSetting,
	#superclass : #TrelloProjectSettings,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'TrelloProject-controllers'
}

{ #category : #'as yet unclassified' }
TrelloProjectDefaultListSetting class >> applicationKeySettingOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #defaultListSetting)
		order: 1;
		parent: #trelloProjectSettings;
		label: 'Default List';
		target: TrelloProjectDefaultListSetting;
		getSelector: #textValue;
		setSelector: #textValue:;
		notInStyle;
		default: '';
		ghostHelp: 'Name of the default list for special commits';
		description: TrelloProjectDefaultListSettingRequest messagePrompt
]

{ #category : #'as yet unclassified' }
TrelloProjectDefaultListSetting class >> textValue [
	^ TrelloProjectDefaultListSetting uniqueInstance textValue
]

{ #category : #'as yet unclassified' }
TrelloProjectDefaultListSetting class >> textValue: aString [
	^ TrelloProjectDefaultListSetting uniqueInstance checkAndSetTextValueWith: aString
]

{ #category : #accessing }
TrelloProjectDefaultListSetting class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new ]
]
