"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author      : mitchell
" Purpose     : Vim Autogroups
" Last Update : Tue 16 Jul 2019 09:21:37 PM CEST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight special characters/words
" The colors are defined in the colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup highlight_characters_and_words
    autocmd!
    " Highlight special characters
    autocmd BufRead,BufNewFile * syn match parens /[(){}]/
    autocmd BufRead,BufNewFile * syn match mathstuf /&&/

    " Highlight special spaces
    autocmd Filetype * match TrailingSpace "\s\+\n"
    autocmd Filetype * syn match TrailingWhitespace /\s\+$/
    autocmd Filetype * syn match TabWhitespace /[\t]/
    autocmd Filetype * syn match DoubleSpaceAfterPeriod /\.  /

    " Highlight conflict markers.
    autocmd Filetype * syn match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoreload dotfiles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup reload_dotfiles
    autocmd!
    autocmd BufWritePost  .vimrc       source $MYVIMRC
    autocmd BufWritePost *.vim         source $MYVIMRC
    autocmd BufWritePost ~/.Xresources call system('xrdb ~/.Xresources')
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim to load default templates on creating files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup templates
    autocmd!
    autocmd BufNewFile *.awk   0r ~/dotfiles/vim/templates/template.awk
    autocmd BufNewFile *.bash  0r ~/dotfiles/vim/templates/template.bash
    autocmd BufNewFile *.c     0r ~/dotfiles/vim/templates/template.c
    autocmd BufNewFile *.cpp   0r ~/dotfiles/vim/templates/template.cpp
    autocmd BufNewFile *.md    0r ~/dotfiles/vim/templates/template.md
    autocmd BufNewFile *.py    0r ~/dotfiles/vim/templates/template.py
    autocmd BufNewFile *.sed   0r ~/dotfiles/vim/templates/template.sed
    autocmd BufNewFile *.sh    0r ~/dotfiles/vim/templates/template.sh
    autocmd BufNewFile *.xml   0r ~/dotfiles/vim/templates/template.xml
    autocmd BufNewFile *.html  0r ~/dotfiles/vim/templates/template.html
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commenting blocks of code
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup comment_leader
    autocmd!
    autocmd   FileType   c,cpp,java     let b:comment_leader = '// '
    autocmd   FileType   sh,python,ksh  let b:comment_leader = '## '
    autocmd   FileType   tex            let b:comment_leader = '% '
    autocmd   FileType   vim            let b:comment_leader = '" '
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GIT file configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_git
    autocmd!
    autocmd Filetype gitcommit setlocal textwidth=72
    autocmd Filetype gitcommit setlocal spell
    autocmd Filetype gitcommit setlocal linebreak
    autocmd Filetype gitcommit setlocal noexpandtab

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the seventh line when editing a git commit message
    autocmd FileType gitcommit call setpos('.', [0, 7, 1, 0])

    " Enter Insert mode in git commit
    autocmd Filetype gitcommit if getline(1) != '' | startinsert | endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM file configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_vim
    autocmd!
    autocmd BufRead,BufNewFile *.vim set filetype=vim
    autocmd FileType vim setlocal expandtab
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PYTHON file configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_python
    autocmd!
    autocmd FileType python setlocal softtabstop=4
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal tabstop=4
    autocmd FileType python setlocal textwidth=80
    autocmd FileType python setlocal expandtab
    "autocmd Filetype python match ErrorMsg '\%>80v.\+'

    " These keywords start an extra indent in the next line when 'smartindent' or 'cindent' is set
    autocmd FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RST file configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_rst
    autocmd!
    autocmd FileType rst setlocal spell
    autocmd Filetype rst setlocal textwidth=74
    autocmd Filetype rst setlocal formatoptions+=nqt
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SHELL file configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_shell
    autocmd!
    autocmd FileType sh setlocal expandtab
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT file configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_text
    autocmd!
    autocmd FileType text setlocal spell
    autocmd FileType text setlocal noautoindent
    autocmd FileType text setlocal nocindent
    autocmd FileType text setlocal nosmartindent
    autocmd FileType text setlocal indentexpr=
    autocmd FileType text setlocal formatoptions-=t
    autocmd FileType text setlocal formatoptions-=c
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM HELP file configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_vim_help
    autocmd!
    autocmd FileType help setlocal nospell
    " NO COLORS IN THE VIM HELP
    hi TrailingSpace          ctermbg=black
    hi TrailingWhitespace     ctermbg=black
    hi TabWhitespace          ctermbg=black
    hi DoubleSpaceAfterPeriod ctermbg=black

    " Open help in a vertical split
    autocmd BufEnter *.txt if &buftype == 'help' | wincmd T | nnoremap <buffer> q :q<cr> | endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAKE file configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_make
    autocmd!
    "autocmd BufNewFile,BufRead Makefile setlocal nolist
    "autocmd FileType make setlocal nolist ts=4 sts=4 sw=4 noet
    "autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    " Preserve tab in makefiles
    autocmd FileType make setlocal noexpandtab
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MARKDOWN file configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_markdown
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mkd,mkdn,mark*} setlocal filetype=markdown
    autocmd FileType markdown setlocal expandtab
    autocmd FileType markdown setlocal shiftwidth=4
    autocmd FileType markdown setlocal softtabstop=4
    autocmd FileType markdown setlocal tabstop=4
    autocmd FileType markdown setlocal syntax=markdown
    autocmd Filetype markdown setlocal textwidth=80
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal linebreak
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal formatoptions-=tc

    autocmd FileType markdown nnoremap <leader>1 m`yypVr=``
    autocmd FileType markdown nnoremap <leader>2 m`yypVr-``
    autocmd FileType markdown nnoremap <leader>3 m`^i### <esc>``4l
    autocmd FileType markdown nnoremap <leader>4 m`^i#### <esc>``5l
    autocmd FileType markdown nnoremap <leader>5 m`^i##### <esc>``6l
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YAML file configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_yaml
    autocmd!
    autocmd Filetype yaml setlocal expandtab
    autocmd Filetype yaml setlocal shiftwidth=2
    autocmd FileType yaml setlocal softtabstop=2
    autocmd FileType yaml setlocal tabstop=2
    autocmd FileType yaml setlocal indentexpr=
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSON file configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_yaml
    autocmd!
    autocmd BufRead,BufNewFile *.json setlocal ft=json
    autocmd Filetype json setlocal expandtab
    autocmd Filetype json setlocal shiftwidth=2
    autocmd FileType json setlocal softtabstop=2
    autocmd FileType json setlocal tabstop=2
    autocmd FileType json nnoremap <buffer> <leader>pf :%!python -m json.tool<cr>     "pretty format json using python
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL file configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup filetype_general
    autocmd!

    " Disable syntax when editing huge files so vim stays snappy
    autocmd Filetype * if (getfsize(@%) > 500000) | setlocal syntax=OFF | endif

    " Set the title consistently
    autocmd BufEnter * let &titlestring="VIM - ".expand("%:p")

    " Remove White Spaces
    autocmd FileType * autocmd BufWritePre <buffer> :call RemoveWhiteSpaces()

    " Common abbreviations
    autocmd FileType * :iab  todo  <C-R>=expand(b:comment_leader)<CR> <TODO><<C-R>=expand("$USER")<CR>><<C-R>=strftime("%d/%m/%y %H:%M:%S> ->") <CR>
    autocmd FileType * :iab  bug   <C-R>=expand(b:comment_leader)<CR> <BUG><<C-R>=expand("$USER")<CR>><<C-R>=strftime("%d/%m/%y %H:%M:%S> ->") <CR>

    " Needed to highlight TODO in all files types!
    autocmd Filetype * :silent! call matchadd('Todo', 'TODO\|FIXME\|BUG', -1)

    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \     exe "normal! g'\"" |
        \ endif |
        \ call GetFileInfo()

    autocmd FocusLost   * :set number
    autocmd FocusGained * :set relativenumber
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber

    " This will change directory on startup to the current file's directory
    autocmd VimEnter * lcd %:p:h

    " Remove ^M line breaks when open a file
    autocmd BufReadPost * silent! :%s/\r$//g

    " Convert ^M to line breaks when open a file
    autocmd BufReadPost * silent! :%s/\r/\r/g

    " Parses the whole file to ensure the syntax coloring is present everywhere
    " and will not need to slow down vim because of the strange regexes being used
    " on the current line being drawn.
    " This is slow. Very slow. But it will only bugger you when you open the file,
    " or start to edit lines, which, in that case, it will only try to parse the
    " edited line or the lines affected by it (for example when you start a block
    " comment)
    " I prefer to waste my time opening the file instead of when I'm programming.
    autocmd BufEnter * :syntax sync fromstart
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Relative linenumbers disabled in insertmode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup numbertoggle
    autocmd!
    autocmd BufEnter,InsertLeave * set relativenumber
    autocmd BufLeave,InsertEnter * set norelativenumber
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""