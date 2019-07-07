"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author      : mitchell
" Purpose     : Function mappings
" Last Update : Sun 07 Jul 2019 04:03:33 PM CEST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         FUNCTION MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTION 1 - BASHRC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove annoying F1 help
inoremap <F1> <NOP>
nnoremap <F1> <NOP>
vnoremap <F1> <NOP>

map <F1>  :tabedit ~/dotfiles/shell/bashrc<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTION 2-4 - VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2>  :tabedit ~/dotfiles/vim/autogroups.vim<CR>
map <F3>  :tabedit ~/dotfiles/vim/maps.vim<CR>
map <F4>  :tabedit ~/dotfiles/vim/vimrc<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTION 5 - INFO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup info_files
    autocmd!
    autocmd FileType markdown nnoremap <buffer> <F5> :tabedit  ~/info/info_markdown.txt<CR>
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTION 6 - TESTING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType json      nnoremap <buffer> <F6>  :w<CR>:!clear;jsonlint-php %;<CR>
autocmd FileType yaml      nnoremap <buffer> <F6>  :w<CR>:!clear;yamllint %;<CR>
autocmd FileType sh,ksh    nnoremap <buffer> <F6>  :w<CR>:!clear;shellcheck %;./%<CR>
autocmd FileType python    nnoremap <buffer> <F6>  :w<CR>:!clear;
                                                    \echo "===========================FLAKE8=========================";
                                                    \flake8 %;
                                                    \echo "===========================PYLINT=========================";
                                                    \pylint-3 --rcfile=~/dotfiles/python/pylintrc %<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTION 7 - COMPILE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c       nnoremap <F7>  :w<CR>:!clear; gcc % -o %:r -Wall -Wextra -Wpedantic -O3 -ansi<CR>
autocmd FileType cpp     nnoremap <F7>  :w<CR>:!clear; g++ % -o %:r -Wall -Wextra -Wpedantic -O3 -std=c++11<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTION 8 - EXECUTE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c        nnoremap <buffer> <F8>  :w<CR>:!clear; ./%:r<CR>
autocmd FileType cpp      nnoremap <buffer> <F8>  :w<CR>:!clear; ./%:r<CR>
autocmd FileType python   nnoremap <buffer> <F8>  :w<CR>:!clear;python %<CR>
autocmd FileType sh,ksh   nnoremap <buffer> <F8>  :w<CR>:!clear; ./%<CR>
autocmd FileType markdown nnoremap <buffer> <F8>  :w<CR>:!~/dotfiles/scripts/md-prev "%:p"<CR>

"https://coderwall.com/p/ubekiw/preview-markdown-from-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTION 10 - MAXIMUZE CURRENT WINDOW
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap    <F10>       <C-\><C-N><C-W>_<C-W>\|
vmap        <F10>       <C-\><C-N><C-W>_<C-W>\|gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTION 11 - CHANGE WINDOW WIDTH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap    <F11>  <C-\><C-N>3<C-W><
vnoremap    <F11>  <C-\><C-N>3<C-W><gv
nnoremap  <S-F11>  <C-\><C-N>3<C-W>>
vnoremap  <S-F11>  <C-\><C-N>3<C-W>>gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTION 12 - CHANGE WINDOW HEIGHT
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap    <F12>  <C-\><C-N>3<C-W>-
vnoremap    <F12>  <C-\><C-N>3<C-W>-gv
nnoremap  <S-F12>  <C-\><C-N>3<C-W>+
vnoremap  <S-F12>  <C-\><C-N>3<C-W>+gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""