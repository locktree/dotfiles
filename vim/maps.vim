"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author      : mitchell
" Purpose     : Vim Mappings and Autocommands
" Last Update : Sun 28 Apr 2019 12:25:05 PM CEST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable pressing Shift k will open man page
nnoremap  K  <NOP>

" Annoying window
nnoremap  q: :q

" Go away ex mode, you suck
nnoremap Q <NOP>

" Fix page up and down
map   <PageUp>    <C-U>
map   <PageDown>  <C-D>
imap  <PageUp>    <C-O><C-U>
imap  <PageDown>  <C-O><C-D>

" Using the BackSpace and Delete keys: Deleting text in normal mode
noremap  <BS>   X
noremap  <DEL>  x

" Move vertically by vertical line(long,wrapped). Always navigate linewise
nnoremap  j  gj
nnoremap  k  gk
vnoremap  j  gj
vnoremap  k  gk

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap  H  ^
nnoremap  L  $
vnoremap  H  ^
vnoremap  L  g_

" Keep search matches in the middle of the window.
" zz centers the screen on the cursor, zv unfolds any fold if the cursor
" suddenly appears inside a fold.
nnoremap  n   nzzzv
nnoremap  N   Nzzzv
nnoremap  *   *zzzv
nnoremap  #   #zzzv
nnoremap  g*  g*zzzv
nnoremap  g#  g#zzzv

" Automatically jump to end of text you pasted
"vnoremap  <silent>  y  y`]
"vnoremap  <silent>  p  p`]
"nnoremap  <silent>  p  p`]

"This pastes the contents of a buffer just like p does, but it
"automatically adjusts the indent to match the line the cursor
"is on! This is excellent for moving code around
nnoremap  p ]p$

" Paste and indent (improved)
nnoremap  PP  P`[v`]=
nnoremap  pp  p`[v`]=

" Don't clobber registers when doing character deletes
nnoremap  x  "_x
nnoremap  X  "_X
nnoremap  s  "_s

" Comma always follwed by a space
inoremap  ,  ,<SPACE>

" Always use 'very magic' mode
nnoremap  /  /\v
nnoremap  /  /\V
nnoremap  ?  ?\V

" To the end of the last line
nnoremap  G  G$

" Make Y consistent with C and D
nnoremap  Y  y$

" Speed up viewport scrolling and center
nnoremap  <C-e>  5<C-e>
nnoremap  <C-y>  5<C-y>

" And center
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" And center
nnoremap } }zz
nnoremap { {zz

" And center, this will slow down a lot!
"nnoremap j jzz
"nnoremap k kzz

" Join lines and restore cursor location
nnoremap  J  mjJ`j

" Join lines in reverse order
"nnoremap  <C-j>  ddpkJ

" Map auto complete of (, ", ', [
inoremap  (   ()<LEFT>
inoremap  [   []<LEFT>
inoremap  {   {}<LEFT>
inoremap  '   ''<LEFT>
inoremap  `   ``<LEFT>
inoremap  "   ""<LEFT>
vnoremap  (   s()<ESC>P<RIGHT>%
vnoremap  [   s[]<ESC>P<RIGHT>%
vnoremap  {   s{}<ESC>P<RIGHT>%
xnoremap  '   s''<ESC>P<RIGHT>%
xnoremap  "   s""<ESC>P<RIGHT>%
xnoremap  `   s``<ESC>P<RIGHT>%

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap  '  `
nnoremap  `  '

" Since I never use the ; key anyway, this is a optimization for almost
" all Vim cmds, as I don't have to press the Shift key to form chords to
" enter ex mode.
nnoremap  ;  :
nnoremap  <leader>;  ;

" Indentation
nnoremap  >  >>
nnoremap  <  <<
xnoremap  >  >gv
xnoremap  <  <gv

" word in brackets
nnoremap w{ viw<esc>a}<esc>hbi{<esc>lel

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PERSONAL MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy save/close
"nnoremap   q     :q<CR>
nnoremap   ;w     :w<CR>
nnoremap   ;W     :w<CR>
nnoremap   ;q     :q<CR>
nnoremap   ;Q     :q<CR>
nnoremap   ;WQ    :wq<CR>
nnoremap   ;wq    :wq<CR>
nnoremap   ;qall  :qall<CR>

" Window navigation. Move between splits (windows)
nnoremap  <C-l>  <C-w>l
nnoremap  <C-h>  <C-w>h
nnoremap  <C-k>  <C-w>k
nnoremap  <C-j>  <C-w>j

" Window navigation. Move between splits (windows)
nnoremap  <RIGHT>  <C-w>l
nnoremap  <LEFT>   <C-w>h
nnoremap  <UP>     <C-w>k
nnoremap  <DOWN>   <C-w>j

" Cycle through tabs with <tab>
nnoremap  <S-TAB>  gT

" Go down a page rather than left a character
nnoremap  <CR>  <C-f>

" Esc is far away, jj is easier then Esc. Much faster:)
inoremap  jj  <ESC>
inoremap  jk  <ESC>

" Move current line/selected lines up and down
nnoremap  <C-DOWN>  :move+<CR>==
nnoremap  <C-UP>    :move-2<CR>==
inoremap  <C-DOWN>  <ESC>:move+<CR>==gi
inoremap  <C-UP>    :move-2<CR>==gi
vnoremap  <C-DOWN>  :move'>+<CR>gv=gv
vnoremap  <C-UP>    :move-2<CR>gv=gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search and replace word under cursor
nnoremap  <LEADER>*  :%s/\<<C-r><C-w>\>//<LEFT>
vnoremap  <LEADER>*  "hy:%s/\V<C-r>h//<LEFT>

" Allows to easily change the current word and all occurrences to something
" else. The difference between this and the previous mapping is that the
" mapping below pre-fills the current word for you to change.
nnoremap <LEADER>** :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <LEADER>** y:%s/<C-r>"/<C-r>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A - ADD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-a 1:    Around with Parts w/ #'s
noremap  <C-a>1 yyPVr#yyjp
inoremap <C-a>1 <esc>yyPVr#yyjpA

" Ctrl-a 2:    underline Section Level 1 w/ ='s
noremap  <C-a>2 yypVr=
inoremap <C-a>2 <esc>yypVr=A

" Commenting blocks of code. Comment and Uncomment. SEE OOK AUTOGROUPS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
autocmd   FileType   c,cpp,java           let b:comment_leader = '// '
autocmd   FileType   sh,python,ksh        let b:comment_leader = '## '
autocmd   FileType   conf,fstab           let b:comment_leader = '## '
autocmd   FileType   mail                 let b:comment_leader = '> '
autocmd   FileType   vim                  let b:comment_leader = '" '
nnoremap  <silent>   <C-a>3 :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
nnoremap  <silent>   <C-a>4 :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" D- DIFF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMDIFF version
nnoremap  <LEADER>di  :call DiffOrig()<CR>

" TEXTUAL version
nnoremap  <LEADER>do  :w !diff % -<CR>

" TKDIFF version
nnoremap  <LEADER>dd  :w !cat > /tmp/tempFile && tkdiff /tmp/tempFile % <CR>

nnoremap  <LEADER>dg  :!git diff<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" G - FORMAT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent all lines (preserves cursor position)
nnoremap  <LEADER>gg  v<ESC>gg=Ggvzz<ESC>
inoremap  <LEADER>gg   <ESC>gg=G``zz
vnoremap  <LEADER>gg   <ESC>gg=Ggvzz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" H - HIGHLIGHT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight the last inserted text
nnoremap  <LEADER>hl  `[v`]

" Toggle search highlighting
nnoremap  <LEADER>hh  :set hlsearch!<Bar>set hlsearch?<CR>

" Hightlight word under cursor: Case insensitive, partial match inclusive.
nnoremap  <LEADER>hu  :set hlsearch<CR>:let @/='<C-r><C-w>\c'<CR>

" Find merge conflict markers
nnoremap <LEADER>hc /\v^[<=>]{7}( .*\|$)<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I - INFO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap  <LEADER>if  :call ShowFuncName() <CR>

" Show highlight group at the cursor
nnoremap <silent><LEADER>ii :echo
\ "hi=" . synIDattr(synID(line("."),col("."),1),"name") .
\ " trans=" . synIDattr(synID(line("."),col("."),0),"name") .
\ " lo=" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" M - MODELINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <LEADER>ml :call AppendModeline()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Q - QUOTES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wrap a word in double quotes
nnoremap  <LEADER>qd  viw<ESC>a"<ESC>hbi"<ESC>lel

" Wrap a word in single quotes
nnoremap  <LEADER>qs  viw<ESC>a'<ESC>hbi'<ESC>lel

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" S - SAVE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ss = toggle spell
" sn = Next misspelled word
" sp = Previous mispelled word
" sa = Add word to dictionary
" s? = List alternative words
map <LEADER>ss  :setlocal spell!<cr>
map <LEADER>sn  ]s
map <LEADER>sp  [s
map <LEADER>sa  zg
map <LEADER>s?  z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" T - TAB
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap  <LEADER>tm  :tabmove  <CR>
nnoremap  <LEADER>tf  :tabfirst <CR>
nnoremap  <LEADER>tn  :tabnew   <CR>
nnoremap  <LEADER>th  :tabprev  <CR>
nnoremap  <LEADER>tl  :tabnext  <CR>
nnoremap  <LEADER>tc  :tabclose <CR>
nnoremap  <LEADER>to  :tabonly  <CR>

" Open the file corresponding to the source/header actually opened.
" it replace .c with .h in the file name, eg. file.cpp -> file.hpp
" You must set your path correctly so that :find will find it.
nnoremap  <LEADER>ts  :find %:t:s,.c,.foo,:s,.h,.c,:s,.foo,.h,<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SPLITS AND TABS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
" Quick moves to splits and tab
nnoremap  ,e  :e    <C-r>=expand("%:p:h")<CR>/
nnoremap  ,s  :sp   <C-r>=expand("%:p:h")<CR>/
nnoremap  ,v  :vsp  <C-r>=expand("%:p:h")<CR>/
nnoremap  ,t  :tabe <C-r>=expand("%:p:h")<CR>/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" W - WINDOWS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window Vertical
nnoremap  <LEADER>wv  :vsp<CR>
" Window Horizontal
nnoremap  <LEADER>wh  :sp<CR>
" Close window
nnoremap  <LEADER>wq  :clo<CR>

" Splitting windows
"nnoremap  <C-v>  <C-w>v
"nnoremap  <C-s>  <C-w>s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""