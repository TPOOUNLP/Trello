Extension { #name : #MCWorkingCopyBrowser }

{ #category : #'*TrelloProject' }
MCWorkingCopyBrowser >> saveVersion [
	self canSave ifFalse: [ ^ self ].
	"fork the whole version creation  "
	(TrelloConnectionView new openWithSpec) modalRelativeTo: World.
	[self basicSaveVersionIn: self repository] fork.
]
