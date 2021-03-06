running
check: aMethod forCritiquesDo: aCriticBlock
	| className classNameIndex |
	(aMethod methodClass isMeta) ifFalse: [ ^ self ].
	className := aMethod methodClass soleInstance name.      
	classNameIndex := aMethod selector 
		indexOfSubCollection: className
		startingAt: 1.
		
	classNameIndex > 0 ifTrue: [ aCriticBlock cull: (
		(self 
			critiqueFor: aMethod
			withInterval: (classNameIndex to: classNameIndex + className size ))
			tinyHint: className;
			yourself) ]