"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author      : mitchell
" Purpose     : Vim settings
" Last Update : Sun 28 Apr 2019 12:24:50 PM CEST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
"           ¦     ¦    +---- Enable file type detection
"           ¦     +--------- Enable loading of indent file
"           +--------------- Enable loading of plugin files
set nocompatible              " NO compatibility to venerable old vi
set noexrc                    " Don't use local versions of .(g)vimrc/.exrc
set encoding=utf8             " Set utf8 as standard encoding
set noerrorbells              " Don't make noise
set novisualbell
set vb t_vb=                  " Disable any beeps or flashes on error
set autoread                  " Automatically reload changes if detected

let mapleader="\<SPACE>"      " My mapleader
let maplocalleader="\<SPACE>" " For specific filetypes for example

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  USER INTERFACE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                     " Syntax highlighting
set title                     " Set the title of the window in the terminal
set number                    " Do show line numbers
set relativenumber
"set colorcolumn=75           " Color the 75th column different
set cmdheight=2               " Height of the command bar
set scrolloff=10              " Keep 10 lines (top/bottom) for scope, Start
                              " scrolling when 8 lines away from margins
set scrolloff=9999            " Cursor always in the middle of screen
set sidescrolloff=10          " Keep 10 lines at the size. Horizontally
set scrolljump=5              " Nr of lines scrolled when hiting the border
set wrapmargin=8              " The number of characters from the right
                              " window border where wrapping starts
set shiftwidth=4              " Nr of spaces for each step of autoindent
set softtabstop=4             " When hitting tab or backspace, how many
                              " spaces should a tab be (see expandtab)
set tabstop=4                 " Number of visual spaces per TAB
set linebreak                 " Line Break
set textwidth=75              " Max width of text that is being inserted.
                              " A longer line will be broken after white
                              " space to get this width
set so=0                      " Set 0 lines to the cursor - when moving
                              " vertically using j/k. Normal Behavior
set cursorline                " Highligth current line
set wh=55                     " Minimum window heigh
set showcmd                   " Shows last command in bottom
set showmode                  " Display the current editing mode
set guioptions=eg             " Turn of scrollbars
set list
set listchars=tab:»·,trail:.
set showtabline=2             " Always

" When Vim wraps underlined text for display the underline continues in the
" empty space at the end of the line. This bothers me about hyperlinks
" because they get very long. Since hyperlinks don't contain whitespace the
" following is a reasonable workaround:
set breakat=\

" Speedup response to ESC key
set notimeout
set timeout
set timeoutlen=500     " Mapping delays
set ttimeoutlen=0      " Key code delays

" Highlight 76 column and further
let &colorcolumn=join(range(76,999),",")

set equalalways      " Multiple windows, when created, are equal in size
set splitbelow       " Create new window below current one
set splitright       " Create new window right current one

" Mouse stuff
if has ("mouse")
    set mouse=r                     " Fix for pasting via middle click
    set mousehide                   " Hide mouse when typing
    set mousemodel=popup_setpos     " Popupmenu rather than selecting
endif

" Don't add empty newlines at the end of (binary)files
set binary
set noeol

set report=0                        " Show all changes

" Make Vim put the current working directory in the xterm title on exit
let &titleold=getcwd()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  STATUSLINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2              " Always show the status line

set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%l,%v]
"              | | | | |  |   |      |  |      |  |
"              | | | | |  |   |      |  |      |  + current column
"              | | | | |  |   |      |  |      +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- modified flag in square brackets
"              +-- full path to file in the buffer

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  FILES AND BACKUPS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set the working directory to the current file
set autochdir

set noautowrite                     " Disable autowrite
set ffs=unix,dos,mac                " Use Unix as the standard file type
set history=9999                    " Big old History

set undofile                        " Save undo's after file closes
set undolevels=1000                 " Max number of undo
set undoreload=10000                " Max number lines to save for undo on
                                    " a buffer reload

set undodir=~/.vim/undodir          " Undo directory
set backupdir=~/.vim/backup         " Where to put backup files
set directory=~/.vim/temp           " Directory to place swap files

set backup                          " Make Backup Files
set updatecount=100                 " Switch every 100 chars, save swap
set updatetime=4000                 " Every 4000 ms

" Stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.md,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android
set wildignore+=*~,*.bak

" Don't create backups when editing files in certain directories
"set backupskip=/tmp/*,/private/tmp/*

" Turn backup off, since most stuff is in git etc anyway...
set nobackup                           " Do not keep backups after close
set nowritebackup                      " Do not keep backups while working
set noswapfile                         " Don't keep swp files either

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  SEARCH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch            " Enable incremental search
set hlsearch             " Highlight search results
set showmatch            " Show matching brackets when text cursor is over
set ignorecase           " Ignore case when searching
set smartcase            " If there are caps, go case-sensitive
set matchtime=5          " 0.5 to blink matching brackets

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  SPELL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal spell spelllang=en_us
" Default no spell check. Configure the language and turn off spell checking
set nospell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. SPACES, TABS, MOVING AROUND
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent                " Copy indent from current line when starting
                              " a new line typing <CR> in Insert mode or
                              " when using the "o" or "O" command

set expandtab                 " Use the appropriate number of spaces to
                              " insert a <Tab>. Spaces are used in indents
                              " with '>' and '<' commands and
                              " when 'autoindent' is on.

set smarttab                  " When on, a <Tab> in front of a line inserts
                              " blanks according to 'shiftwidth'. 'tabstop'
                              " is used in other places. A <BS> will delete
                              " a 'shiftwidth' worth of space at the start
                              " of the line.

set smartindent               " Smart indent
set nowrap                    " NO wrap lines

set nostartofline             " Stop certain movements from always going to
                              " the first character of a line.

set wildmenu                  " Tab completion stuff, Better CL completion
set wildmode=list:longest,full

set copyindent                " Use existing indents for new indents
"set preserveindent           " Try to preserve indentation when shifting

set formatoptions=tcrql       " t - Autowrap to textwidth
                              " c - Autowrap comments to textwidth
                              " r - Autoinsert comment leader with <Enter>
                              " q - Allow formatting of comments with :gq
                              " l - Don't format already long lines

" Everything wraps
set whichwrap=b,s,h,l,<,>,~,[,]
"             | | | | | | | | |
"             | | | | | | | | +-- "]" Insert and Replace
"             | | | | | | | +-- "[" Insert and Replace
"             | | | | | | +-- "~" Normal
"             | | | | | +-- <Right> Normal and Visual
"             | | | | +-- <Left> Normal and Visual
"             | | | +-- "l" Normal and Visual (not recommended)
"             | | +-- "h" Normal and Visual (not recommended)
"             | +-- <Space> Normal and Visual
"             +-- <BS> Normal and Visual

set nojoinspaces              " Only insert single space after a '.', '?'
                              " and '!' with a join command

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  C-STUFF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Defines the keys that trigger an indent event
"set cinkeys

set cindent                                     " Indent on cinwords
set cinoptions=:s,ps,ts,cs
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case   " Indent keywords

set cpoptions=aABceFsmq
"             |||||||||
"             ||||||||+-- When joining lines, cursor between joined lines
"             |||||||+-- When a new match is created pause for .5
"             ||||||+-- Set buffer options when entering the buffer
"             |||||+-- :write command updates current file name
"             ||||+-- Automatically add <CR> to last line  when using :@r
"             |||+-- Searching continues at the end of the match at the
"             |||      cursor position
"             ||+-- A backslash has no special meaning in mappings
"             |+-- :write updates alternative file name
"             +-- :read updates alternative file name

" Define what are comments
set com&         " reset to default
set com^=sr:*\ -,mb:*\ \ ,el:*/ com^=sr://\ -,mb://\ \ ,el:///

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  VIMINFO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" viminfo: What info to store from an editing session in the viminfo file
" can be used at next session
set viminfo=%,\"100,'50,/50,:100,h,f0,n~/.vim/viminfo
"           | |     |   |   |    |  | |
"           | |     |   |   |    |  | +-viminfo file patch
"           | |     |   |   |    |  +---file marks 0-9,A-Z 0=NOT stored
"           | |     |   |   |    +------disable 'hlsearch'loading viminfo
"           | |     |   |   +-----------command line history saved
"           | |     |   +---------------search history saved
"           | |     +-------------------files marks saved
"           | +-------------------------lines saved each register
"           +---------------------------save/restore buffer list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=eol,start,indent  " Configure backspace as it should act
set iskeyword+=_,$,@,%,#        " None of these are word dividers
                                " @,48-57,_,192-255 are default
set nofoldenable                " Disable folding
set browsedir=current           " Which dir to use for file browsing
set matchpairs=(:),{:},[:],<:>  " List of characters we expect in balanced
                                " pairs
set shiftround                  " When at 3 spaces and i hit >>, go to 4,
                                " not to 5

" Changes the effect of the mksession command
set sessionoptions=blank        " Empty Windows
set sessionoptions+=buffers     " Hidden and unloaded buffers
set sessionoptions+=curdir      " The current directory
set sessionoptions+=globals     " Global variables that start with an
                                " uppercase letter and contain at least one
                                " lowercase letter. Only String and Number
                                " types are stored.
set sessionoptions+=help        " The help window
set sessionoptions+=options     " All options and Mappings
set sessionoptions+=resize      " Size of the vim window
set sessionoptions+=unix        " With Unix end-of-line format (single ),
                                " even when on Windows or DOS
set sessionoptions+=tabpages    " All tab pages
set sessionoptions+=winpos      " Position of the whole vim window
set sessionoptions+=winsize     " Window sizes

set selection=inclusive         " Defined behavior of selection
set selectmode=mouse,key        "
set linespace=0                 " Extra spaces between rows
set debug=msg                   " Error messages don't disappear after one
                                " second on startup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""