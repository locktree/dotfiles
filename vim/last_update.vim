"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author      : mitchell
" Purpose     : Vim auto update
" Last Update : Sun 28 Apr 2019 12:24:41 PM CEST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         LAST UPDATE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-update multiple "keywords" before saving a file
" Within the 10 first lines, the matched lines are:
"  -Last [Cc]hange(d)
"  -Changed
"  -Last [Mm]odified
"  -Modified
"  -Last [Uu]pdate(d)
"  -Filename
"  -Author

autocmd! BufWritePre * :call s:keywords_to_update()

function! s:keywords_to_update()
    let pat = '\(\(Last\)\?\s*\([Cc]hanged\?\|[Mm]odified\|[Uu]pdated\?\)\s*:\s*\).*'
    let rep = '\1' . strftime("%a %d %b %Y %I:%M:%S %p %Z")
    call s:subst(1, 10, pat, rep)

    let pat = '\(\(filename\?\)\s*:\s*\).*'
    let rep = '\1' . bufname("%")
    call s:subst(1, 10, pat, rep)

    let pat = '\(\(author\?\)\s*:\s*\).*'
    let rep = '\1' . expand("$USER")
    call s:subst(1, 10, pat, rep)
endfunction

" subst taken from timestamp.vim
" subst( start, end, pat, rep): substitute on range start - end
function! s:subst(start, end, pat, rep)
    let lineno = a:start
    while lineno <= a:end
    let curline = getline(lineno)
    if match(curline, a:pat) != -1
        let newline = substitute( curline, a:pat, a:rep, '' )
        if( newline != curline )
            " Only substitute if we made a change
            "silent! undojoin
            keepjumps call setline(lineno, newline)
       endif
    endif
    let lineno = lineno + 1
    endwhile
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""