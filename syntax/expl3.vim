" Vim syntax file
" Language:         expl3
" Maintainer:       Takuto ASAKURA (wtsnjp)
" Latest Revision:  2017-05-20

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match   expl3ControlSequence         display contains=@NoSpell
      \ '\\[a-zA-Z_:@]\+'

runtime! syntax/initex.vim
unlet b:current_syntax

syn match   expl3Comment                 display
      \ contains=ALLBUT,initexComment,expl3Comment
      \ '^\s*%[CDM].*$'

if exists("g:expl3_delimiters")
  syn match   expl3Delimiter             display '[][{}]'
endif

syn match   expl3Repeat                  display contains=@NoSpell
      \ '\\\%(loop\|repeat\)\>'

syn match   expl3Command                 display contains=@NoSpell
      \ '\\\%(plainoutput\|TeX\)\>'
syn match   expl3BoxCommand              display contains=@NoSpell
      \ '\\\%(null\|strut\)\>'
syn match   expl3DebuggingCommand        display contains=@NoSpell
      \ '\\\%(showhyphens\|tracingall\|wlog\)\>'
syn match   expl3FontsCommand            display contains=@NoSpell
      \ '\\\%(bf\|\%(five\|seven\)\%(bf\|i\|rm\|sy\)\|it\|oldstyle\|rm\|sl\|ten\%(bf\|ex\|it\=\|rm\|sl\|sy\|tt\)\|tt\)\>'
syn match   expl3GlueCommand             display contains=@NoSpell
      \ '\\\%(\%(big\|en\|med\|\%(no\|off\)interline\|small\)skip\|\%(center\|left\|right\)\=line\|\%(dot\|\%(left\|right\)arrow\)fill\|[hv]glue\|[lr]lap\|q\=quad\|space\|topglue\)\>'
syn match   expl3InsertsCommand          display contains=@NoSpell
      \ '\\\%(\%(end\|top\)insert\|v\=footnote\)\>'
syn match   expl3JobCommand              display contains=@NoSpell
      \ '\\\%(bye\|fmt\%(name\|version\)\)\>'
syn match   expl3InsertsCommand          display contains=@NoSpell
      \ '\\\%(mid\|page\)insert\>'
syn match   expl3KernCommand             display contains=@NoSpell
      \ '\\\%(en\|\%(neg\)\=thin\)space\>'
syn match   expl3MacroCommand            display contains=@NoSpell
      \ '\\\%(active\|[be]group\|empty\)\>'
syn match   expl3PageCommand             display contains=@NoSpell
      \ '\\\%(\%(super\)\=eject\|nopagenumbers\|\%(normal\|ragged\)bottom\)\>'
syn match   expl3ParagraphCommand        display contains=@NoSpell
      \ '\\\%(endgraf\|\%(non\)\=frenchspacing\|hang\|item\%(item\)\=\|narrower\|normalbaselines\|obey\%(lines\|spaces\)\|openup\|proclaim\|\%(tt\)\=raggedright\|textindent\)\>'
syn match   expl3PenaltiesCommand        display contains=@NoSpell
      \ '\\\%(allow\|big\|fil\|good\|med\|no\|small\)\=break\>'
syn match   expl3RegistersCommand        display contains=@NoSpell
      \ '\\\%(advancepageno\|new\%(box\|count\|dimen\|fam\|help\|if\|insert\|language\|muskip\|read\|skip\|toks\|write\)\)\>'
syn match   expl3TablesCommand           display contains=@NoSpell
      \ '&\|\\+\|\\\%(cleartabs\|endline\|hidewidth\|ialign\|multispan\|settabs\|tabalign\)\>'

if !exists("g:expl3_no_math")
  syn region  expl3Math                  matchgroup=expl3Math
      \ contains=@expl3Math,@NoSpell
      \ start='\$' skip='\\\\\|\\\$' end='\$'
  syn region  expl3Math                  matchgroup=expl3Math
      \ contains=@expl3Math,@NoSpell keepend
      \ start='\$\$' skip='\\\\\|\\\$' end='\$\$'
endif

" Keep this after expl3Math, as we don’t want math mode started at a \$.
syn match   expl3CharacterCommand        display contains=@NoSpell
      \ /\\\%(["#$%&'.=^_`~]\|``\|''\|-\{2,3}\|[?!]`\|^^L\|\~\|\%(a[ae]\|A[AE]\|acute\|[cdHoOPStuvijlL]\|copyright\|d\=dag\|folio\|ldotp\|[lr]q\|oe\|OE\|slash\|ss\|underbar\)\>\)/

syn cluster expl3Math
      \ contains=expl3MathCommand,expl3MathBoxCommand,
      \ expl3MathCharacterCommand,expl3MathDelimiter,
      \ expl3MathFontsCommand,expl3MathLetter,expl3MathSymbol,
      \ expl3MathFunction,expl3MathOperator,expl3MathPunctuation,
      \ expl3MathRelation

syn match   expl3MathCommand             display contains=@NoSpell contained
      \ '\\\%([!*,;>{}|_^]\|\%([aA]rrowvert\|[bB]ig\%(g[lmr]\=\|r\)\=\|\%(border\|p\)\=matrix\|displaylines\|\%(down\|up\)bracefill\|eqalign\%(no\)\|leqalignno\|[lr]moustache\|mathpalette\|root\|s[bp]\|skew\|sqrt\)\>\)'
syn match   expl3MathBoxCommand          display contains=@NoSpell contained
      \ '\\\%([hv]\=phantom\|mathstrut\|smash\)\>'
syn match   expl3MathCharacterCommand    display contains=@NoSpell contained
      \ '\\\%(b\|bar\|breve\|check\|d\=dots\=\|grave\|hat\|[lv]dots\|tilde\|vec\|wide\%(hat\|tilde\)\)\>'
syn match   expl3MathDelimiter           display contains=@NoSpell contained
      \ '\\\%(brace\%(vert\)\=\|brack\|cases\|choose\|[lr]\%(angle\|brace\|brack\|ceil\|floor\|group\)\|over\%(brace\|\%(left\|right\)arrow\)\|underbrace\)\>'
syn match   expl3MathFontsCommand        display contains=@NoSpell contained
      \ '\\\%(\%(bf\|it\|sl\|tt\)fam\|cal\|mit\)\>'
syn match   expl3MathLetter              display contains=@NoSpell contained
      \ '\\\%(aleph\|alpha\|beta\|chi\|[dD]elta\|ell\|epsilon\|eta\|[gG]amma\|[ij]math\|iota\|kappa\|[lL]ambda\|[mn]u\|[oO]mega\|[pP][hs]\=i\|rho\|[sS]igma\|tau\|[tT]heta\|[uU]psilon\|var\%(epsilon\|ph\=i\|rho\|sigma\|theta\)\|[xX]i\|zeta\)\>'
syn match   expl3MathSymbol              display contains=@NoSpell contained
      \ '\\\%(angle\|backslash\|bot\|clubsuit\|emptyset\|epsilon\|exists\|flat\|forall\|hbar\|heartsuit\|Im\|infty\|int\|lnot\|nabla\|natural\|neg\|pmod\|prime\|Re\|sharp\|smallint\|spadesuit\|surd\|top\|triangle\%(left\|right\)\=\|vdash\|wp\)\>'
syn match   expl3MathFunction            display contains=@NoSpell contained
      \ '\\\%(arc\%(cos\|sin\|tan\)\|arg\|\%(cos\|sin\|tan\)h\=\|coth\=\|csc\|de[gt]\|dim\|exp\|gcd\|hom\|inf\|ker\|lo\=g\|lim\%(inf\|sup\)\=\|ln\|max\|min\|Pr\|sec\|sup\)\>'
syn match   expl3MathOperator            display contains=@NoSpell contained
      \ '\\\%(amalg\|ast\|big\%(c[au]p\|circ\|o\%(dot\|plus\|times\|sqcup\)\|triangle\%(down\|up\)\|uplus\|vee\|wedge\|bmod\|bullet\)\|c[au]p\|cdot[ps]\=\|circ\|coprod\|d\=dagger\|diamond\%(suit\)\=\|div\|land\|lor\|mp\|o\%(dot\|int\|minus\|plus\|slash\|times\)pm\|prod\|setminus\|sqc[au]p\|sqsu[bp]seteq\|star\|su[bp]set\%(eq\)\=\|sum\|times\|uplus\|vee\|wedge\|wr\)\>'
syn match   expl3MathPunctuation         display contains=@NoSpell contained
      \ '\\\%(colon\)\>'
syn match   expl3MathRelation            display contains=@NoSpell contained
      \ '\\\%(approx\|asymp\|bowtie\|buildrel\|cong\|dashv\|doteq\|[dD]ownarrow\|equiv\|frown\|geq\=\|gets\|gg\|hook\%(left\|right\)arrow\|iff\|in\|leq\=\|[lL]eftarrow\|\%(left\|right\)harpoon\%(down\|up\)\|[lL]eftrightarrow\|ll\|[lL]ongleftrightarrow\|longmapsto\|[lL]ongrightarrow\|mapsto\|mid\|models\|[ns][ew]arrow\|neq\=\|ni\|not\%(in\)\=\|owns\|parallel\|perp\|prec\%(eq\)\=\|propto\|[rR]ightarrow\|rightleftharpoons\|sim\%(eq\)\=\|smile\|succ\%(eq\)\=\|to\|[uU]parrow\|[uU]pdownarrow\|[vV]ert\)\>'

syn match   expl3ParameterDimen          display contains=@NoSpell
      \ '\\maxdimen\>'
syn match   expl3MathParameterDimen      display contains=@NoSpell
      \ '\\jot\>'
syn match   expl3ParagraphParameterGlue  display contains=@NoSpell
      \ '\\\%(\%(big\|med\|small\)skipamount\|normalbaselineskip\|normallineskip\%(limit\)\=\)\>'

syn match   expl3FontParameterInteger    display contains=@NoSpell
      \ '\\magstep\%(half\)\=\>'
syn match   expl3JobParameterInteger     display contains=@NoSpell
      \ '\\magnification\>'
syn match   expl3PageParameterInteger    display contains=@NoSpell
      \ '\\pageno\>'

syn match   expl3PageParameterToken      display contains=@NoSpell
      \ '\\\%(foot\|head\)line\>'

hi def link expl3Operator                Operator

hi def link expl3Delimiter               Delimiter

hi def link expl3ControlSequence         Identifier
hi def link expl3Comment                 Comment
hi def link expl3Include                 Include
hi def link expl3Repeat                  Repeat

hi def link expl3Command                 initexCommand
hi def link expl3BoxCommand              expl3Command
hi def link expl3CharacterCommand        initexCharacterCommand
hi def link expl3DebuggingCommand        initexDebuggingCommand
hi def link expl3FontsCommand            initexFontsCommand
hi def link expl3GlueCommand             expl3Command
hi def link expl3InsertsCommand          expl3Command
hi def link expl3JobCommand              initexJobCommand
hi def link expl3KernCommand             expl3Command
hi def link expl3MacroCommand            initexMacroCommand
hi def link expl3PageCommand             expl3Command
hi def link expl3ParagraphCommand        expl3Command
hi def link expl3PenaltiesCommand        expl3Command
hi def link expl3RegistersCommand        expl3Command
hi def link expl3TablesCommand           expl3Command

hi def link expl3Math                    String
hi def link expl3MathCommand             expl3Command
hi def link expl3MathBoxCommand          expl3BoxCommand
hi def link expl3MathCharacterCommand    expl3CharacterCommand
hi def link expl3MathDelimiter           expl3Delimiter
hi def link expl3MathFontsCommand        expl3FontsCommand
hi def link expl3MathLetter              expl3MathCharacterCommand
hi def link expl3MathSymbol              expl3MathLetter
hi def link expl3MathFunction            Function
hi def link expl3MathOperator            expl3Operator
hi def link expl3MathPunctuation         expl3CharacterCommand
hi def link expl3MathRelation            expl3Operator

hi def link expl3ParameterDimen          initexParameterDimen
hi def link expl3MathParameterDimen      initexMathParameterDimen
hi def link expl3ParagraphParameterGlue  initexParagraphParameterGlue
hi def link expl3FontParameterInteger    initexFontParameterInteger
hi def link expl3JobParameterInteger     initexJobParameterInteger
hi def link expl3PageParameterInteger    initexPageParameterInteger
hi def link expl3PageParameterToken      initexParameterToken

let b:current_syntax = "expl3"

let &cpo = s:cpo_save
unlet s:cpo_save
