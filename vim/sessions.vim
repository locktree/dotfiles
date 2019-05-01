"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author      : mitchell
" Purpose     : Vim sessions
" Last Update : Sun 28 Apr 2019 12:24:22 PM CEST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         SESSIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MakeSession()
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    let b:filename = b:sessiondir . '/session.vim'
    exe "mksession! " . b:filename
endfunction

" I didn't want session files for every file I casually edit
" Updates a session, BUT ONLY IF IT ALREADY EXISTS
function! UpdateSession()
    let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        exe "mksession! " . b:sessionfile
        echo "updating session"
    endif
endfunction

" Loads a session if it exists
function! LoadSession()
    if argc() == 0
        let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
        let b:sessionfile = b:sessiondir . "/session.vim"
        if (filereadable(b:sessionfile))
            exe 'source ' b:sessionfile
        else
            echo "No session loaded."
        endif
    else
        let b:sessionfile = ""
        let b:sessiondir = ""
    endif
endfunction

"autocmd VimLeave * :call UpdateSession()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""