" don't spell-check tokens containing underscores or digits
syntax match markdownNoSpellTok /\v<\w*[_0-9]\w*>/ contains=@NoSpell
