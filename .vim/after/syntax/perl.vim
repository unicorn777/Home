""
"" perl.vim for vim-syntax in ~/.vim/after/syntax
""
"" Made by SIGOURE Benoit
"" Mail   <sigoure.benoit@lrde.epita.fr>
""
"" Started on  Sat Dec 30 13:42:34 2006 SIGOURE Benoit
"" Last update Mon Jan  1 23:25:45 2007 SIGOURE Benoit
""

" Simple version of searches and matches
" Standard ViM syntax highlights m//, m##, m{} and m[] (and the !/ variant)
" but not the m<> and m() variants.
syn region perlMatch	matchgroup=perlMatchStartEnd start=+\<[m!]<+ end=+>[cgimosx]*+ contains=@perlInterpMatch
syn region perlMatch	matchgroup=perlMatchStartEnd start=+\<[m!](+ end=+)[cgimosx]*+ contains=@perlInterpMatch

" Same thing for substitutions
syn region perlMatch	matchgroup=perlMatchStartEnd start=+\<s<+ end=+>+ contains=@perlInterpMatch nextgroup=perlSubstitutionCmpSign skipwhite skipempty skipnl
syn region perlMatch	matchgroup=perlMatchStartEnd start=+\<s(+ end=+)+ contains=@perlInterpMatch nextgroup=perlSubstitutionParen skipwhite skipempty skipnl
syn region perlSubstitutionCmpSign	matchgroup=perlMatchStartEnd start=+<+  end=+>[ecgimosx]*+ contained contains=@perlInterpDQ
syn region perlSubstitutionParen	matchgroup=perlMatchStartEnd start=+(+  end=+)[ecgimosx]*+ contained contains=@perlInterpDQ

" Same thing for translator
syn region perlMatch	matchgroup=perlMatchStartEnd start=+\<\(tr\|y\)<+ end=+>+ contains=@perlInterpSQ nextgroup=perlTranslationCmpSign skipwhite skipempty skipnl
syn region perlMatch	matchgroup=perlMatchStartEnd start=+\<\(tr\|y\)(+ end=+)+ contains=@perlInterpSQ nextgroup=perlTranslationParen skipwhite skipempty skipnl
syn region perlTranslationCmpSign	matchgroup=perlMatchStartEnd start=+<+ end=+>[cds]*+ contained
syn region perlTranslationParen		matchgroup=perlMatchStartEnd start=+(+ end=+)[cds]*+ contained

" Strings and q, qq, qw and qr expressions
syn region perlQQ		matchgroup=perlStringStartEnd start=+\<qr<+  end=+>[imosx]*+ contains=@perlInterpMatch

" Special characters in strings and matches
syn match  perlSpecialMatch	"(?>" contained
