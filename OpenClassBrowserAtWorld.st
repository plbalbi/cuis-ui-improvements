'From Cuis 5.0 of 7 November 2016 [latest update: #3437] on 8 September 2018 at 9:05:12 pm'!
"Change Set:		OpenClassBrowserAtWorld
Date:			8 September 2018
Author:			Pablo

Allows the user to press CMD+b in the Wolrd desktop to open a class browser."!

!classDefinition: #MorphLauncher category: #CuisUIImprovements!
Object subclass: #MorphLauncher
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisUIImprovements'!

!MorphLauncher methodsFor: 'as yet unclassified' stamp: 'PB 9/8/2018 20:41:40'!
keyStroke: aKeyboardEvent
" POF itereation. Log the recieved key "

	aKeyboardEvent commandAltKeyPressed | aKeyboardEvent controlKeyPressed
		ifFalse: [ ^false ].

	aKeyboardEvent keyValue = $b numericValue ifTrue: [
		BrowserWindow openBrowser.
		^true.
		].

	Transcript log: 'Unhandled keyboardEvent with keyValue: ' , aKeyboardEvent keyValue asString .! !


!HandMorph methodsFor: 'events-processing' stamp: 'PB 9/8/2018 21:05:03'!
startKeyboardDispatch: aKeyboardEvent

	self keyboardFocus 
		ifNil: [ "No keyboard focus. Forward keyboardEvent to MorphLauncher"
			|morphLauncher|
			morphLauncher := MorphLauncher new.
			morphLauncher keyStroke: aKeyboardEvent.
		] 
		ifNotNil: [
			keyboardFocus handleFocusEvent: aKeyboardEvent 
		].
	self mouseOverHandler processMouseOver: self lastMouseEvent! !

