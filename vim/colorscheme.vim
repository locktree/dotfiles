"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author      : mitchell
" Purpose     : Vim personal colorscheme
" Last Update : Sun 28 Apr 2019 12:24:58 PM CEST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            COLORSCHEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  COLOR SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set bg=dark
hi clear
syntax reset
set background=dark
set synmaxcol=2048                    " Syntax coloring lines that are
                                      " too long just slows down the world

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  COLOR SCHEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi Normal        ctermfg=Grey      ctermbg=Black
hi Cursor        ctermfg=Red       ctermbg=Green     "NOT Visual
hi LineNr        ctermfg=Grey      ctermbg=234
hi CursorLine    ctermfg=White     ctermbg=234       cterm=None
hi CursorLineNR  ctermfg=White     ctermbg=Black
"hi CursorColumn ctermfg=Grey      ctermbg=Black

" NUMBER COLUMNS
hi Folded        ctermfg=DarkGrey  ctermbg=Black
hi FoldColumn    ctermfg=DarkGrey  ctermbg=Black
hi SignColumn    ctermfg=DarkGrey  ctermbg=Black

" WINDOW/TAB DELIMITERS/LABEL(L)
hi VertSplit     ctermfg=Green     ctermbg=Green   " Vertically split
hi ColorColumn   ctermfg=Grey      ctermbg=234     " After 76th char, see
                                                   "  settings.vim

"TabLineSel  - The current active tab label
"TabLine     - The labels which are not currently active
"TabLineFill - The remaining of the tabline where there is no labels (bg)
set tabpagemax=15
hi TabLineSel    ctermfg=Black      ctermbg=Green cterm=bold
hi TabWinNumSel  ctermfg=Magenta    ctermbg=229   cterm=bold
hi TabNumSel     ctermfg=Black      ctermbg=229   cterm=bold

hi TabLine       cterm=underline ctermfg=Black    ctermbg=Red
hi TabWinNum     cterm=bold      ctermfg=Magenta  ctermbg=145
hi TabNum        cterm=bold      ctermfg=Black    ctermbg=145

" NAVIGATE/SEARCH
hi Directory     ctermfg=White   ctermbg=DarkBlue  " Directory names
hi Search        ctermfg=White   ctermbg=DarkBlue  " Last search pattern
hi IncSearch     ctermfg=White   ctermbg=DarkBlue  " Highlighting

" PROMPT/STATUS/STATTUSLINE(SL)/WILDCARDCOMPLETION(WC)
hi StatusLine    ctermfg=Green   ctermbg=Black    " SL of current window
hi StatusLineNC  ctermfg=Red     ctermbg=Black    " SL not-current windows
hi Question      ctermfg=Red     ctermbg=Black    " Prompt,yes/no questions
hi Title         ctermfg=Red     ctermbg=Black    " Titles for output
hi WildMenu      ctermfg=Red     ctermbg=Black    " Current match in WC

" SYNTAX
hi Constant      ctermfg=Blue       ctermbg=Black     " Any constant
hi Number        ctermfg=Green      ctermbg=Black     " Any number
hi Identifier    ctermfg=214        ctermbg=Black     " Variable identifier
hi Error         ctermfg=Grey       ctermbg=Black     " PL errors
hi String        ctermfg=Green      ctermbg=Black     " Any string constant

hi Type          ctermfg=Cyan       ctermbg=Black     " int, long, char
hi Character     ctermfg=Green      ctermbg=Black     " Char constant
hi Boolean       ctermfg=Green      ctermbg=Black     " Boolean constant
hi Float         ctermfg=Green      ctermbg=Black     " Float constant
hi Function      ctermfg=Grey       ctermbg=Black     " Function name

" LANGUAGE CONSTRUCTS
hi Statement     ctermfg=Yellow     ctermbg=Black     " return, etc
hi Comment       ctermfg=Cyan       ctermbg=Black     " Comments
hi Conditional   ctermfg=Yellow     ctermbg=Black     " if,then,else,endif
hi Repeat        ctermfg=Yellow     ctermbg=Black     " for,do,while
hi Label         ctermfg=Yellow     ctermbg=Black     " case,default
hi Operator      ctermfg=Cyan       ctermbg=Black     " sizeof, +, *, etc
hi Keyword       ctermfg=Magenta    ctermbg=Black     " any other keyword
hi Exception     ctermfg=Cyan       ctermbg=Black     " try, catch, throw
hi Special       ctermfg=Red        ctermbg=Black     "
hi SpecialChar   ctermfg=Cyan       ctermbg=Black     " In a constant
hi Tag           ctermfg=Cyan       ctermbg=Black
hi Delimiter     ctermfg=Cyan       ctermbg=Black
hi SpecialComment  ctermfg=Cyan     ctermbg=Black     " Like \n in str
hi Debug         ctermfg=Cyan       ctermbg=Black     " Debug statements
hi StorageClass  ctermfg=Cyan       ctermbg=Black     " static, register
hi Structure     ctermfg=Cyan       ctermbg=Black     " structure,enum
hi Typedef       ctermfg=Cyan       ctermbg=Black     " A typedef

hi Todo          ctermfg=Red        ctermbg=Yellow  cterm=bold     " TODO

" C LIKE
hi PreProc       ctermfg=Magenta    ctermbg=Black     " like #include
hi Include       ctermfg=Magenta    ctermbg=Black     " #include
hi Define        ctermfg=Magenta    ctermbg=Black     " #define
hi Macro         ctermfg=Magenta    ctermbg=Black     " Same as define
hi PreCondit     ctermfg=Magenta    ctermbg=Black     " #if,#else,#endif

" DIFF
hi DiffAdd       ctermbg=Green      ctermfg=Black    " Added line
hi DiffDelete    ctermbg=Blue       ctermfg=Black    " Delete line
hi DiffChange    ctermbg=Red        ctermfg=Black    " Change line
hi DiffText      ctermbg=Yellow     ctermfg=Black    " Changed text

" COMPLETION MENU - POPUP MENU(PM)
hi Pmenu         ctermfg=Blue       ctermbg=Black     " PM normal item
hi PmenuSel      ctermfg=Blue       ctermbg=Black     " PM selected item
hi Pmenubar      ctermfg=Blue       ctermbg=Black     " PM scrollbar
hi PmenuThumb    ctermfg=Blue       ctermbg=Black     " PM thumb scrollbar

hi Pmenu         ctermfg=Black      ctermbg=Blue     " PM normal item
hi PmenuSel      ctermfg=Black      ctermbg=Green    " PM selected item
hi Pmenubar      ctermfg=Black      ctermbg=Green    " PM scrollbar
hi PmenuThumb    ctermfg=Black      ctermbg=Green    " PM thumb scrollbar

" SPELLING (SP=spellchecker)
hi SpellBad      ctermfg=Black      ctermbg=Red       " Not recognized by
hi SpellCap      ctermfg=Black      ctermbg=Red       " Not Capital
hi SpellLocal    ctermfg=Blue       ctermbg=Black     " Another region
hi SpellRare     ctermfg=Blue       ctermbg=Black     " Hardly ever used

" MESSAGE
hi ErrorMsg     ctermfg=Black    ctermbg=Red       " Error mes CL
hi MoreMsg      ctermfg=Grey     ctermbg=Yellow
hi WarningMsg   ctermfg=Grey     ctermbg=Yellow    " Warning mes
hi ModeMsg      ctermfg=Green    ctermbg=234       " Showmode mes -INSERT-

" VISUAL AID
hi Visual       ctermfg=Black    ctermbg=DarkCyan  " Visual mode selection
hi Ignore       ctermfg=Cyan     ctermbg=Black
hi VisualNOS    ctermfg=Grey     ctermbg=DarkBlue
hi SpecialKey   ctermfg=Cyan     ctermbg=Black
hi NonText      ctermfg=Blue     ctermbg=Black
hi MatchParen   ctermbg=blue     ctermbg=Yellow   cterm=bold

hi Underlined   cterm=underline

" These regular expressions are defined in the autocommands section
hi TrailingSpace          ctermbg=red
hi TrailingWhitespace     ctermbg=red
hi TabWhitespace          ctermbg=yellow
hi DoubleSpaceAfterPeriod ctermbg=red
hi parens                 ctermfg=red
hi mathstuf               ctermfg=Yellow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""