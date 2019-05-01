"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author      : mitchell
" Purpose     : Vim functions
" Last Update : Sun 28 Apr 2019 12:24:17 PM CEST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show diff with last write (visual)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DiffOrig()
    let g:diffline = line('.') |
    \ vert new |
    \ set bt=nofile |
    \ r # |
    \ 0d_ |
    \ diffthis |
    \ :exe "norm! ".g:diffline."G" |
    \ wincmd p |
    \ diffthis |
    \ wincmd p
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show function name
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ShowFuncName()
    let lnum = line(".")
    let col = col(".")
    echohl ModeMsg
    echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
    echohl None
    call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! AppendModeline()
    let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    call append(line("$"), l:modeline)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove White Spaces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveWhiteSpaces()
    let save_cursor = getpos(".")
    " Trim end blank lines
    ":silent! %s#\($\n\s*\)\+\%$##
    " Replace groups of empty or whitespaces-only lines with one empty
    :silent! %s/\(\s*\n\)\{3,}/\r\r/ge
    " removing all trailing whitespace
    :silent! %s/\s\+$//e
    call setpos('.', save_cursor)
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When opening a file : Reopen at last position - Display info
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! GetFileInfo()
    let permissions = getfperm(expand('%:p'))
    echon  &filetype . ", " . GetFileSize() . ", " . permissions
endfunction
function! GetFileSize()
    let bytes = getfsize(expand('%:p'))
    if bytes <= 0
        return ""
    elseif bytes > 1024*1000*1000
        return (bytes / 1024*1000*1000) . "GB"
    elseif bytes > 1024*1000
        return (bytes / 1024*1000) . "MB"
    elseif bytes > 1024
        return (bytes / 1024) . "KB"
    else
        return bytes . "B"
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run gdb
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FileHeading
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The following code will add a function heading and position your
" cursor just after Description so that one can document as one proceeds
" with code:   ---> :call FileHeading()
" :FileHeading
function! FileHeading_c()
    let s:line=line(".")
    call setline(s:line,"/***********************************************")
    call append(s:line,  "* Filename   : ".expand("%"))
    call append(s:line+1,"* Author     : ".expand("$USER"))
    call append(s:line+2,"* Description:")
    call append(s:line+3,"* Date       : ".strftime("%b %d %Y"))
    call append(s:line+4,"* ********************************************/")
    unlet s:line
endfunction
autocmd FileType sh,ksh :command! FileHeading :call FileHeading_c()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format JSON
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format json, require python 2.6 or later - OK
command! FormatJSON %!python -m json.tool

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Format PrintColors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! PrintColors()
  let l:num = 255
  while l:num >= 0
    exec 'hi col_'.l:num.' ctermbg='.l:num.' ctermfg=white'
    exec 'syn match col_'.l:num.' "ctermbg='.l:num.':...." containedIn=ALL'
    call append(0, 'ctermbg='.l:num.':....')
    let l:num = l:num - 1
  endwhile
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EX | chmod +x
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! EX if !empty(expand('%'))
    \| write
    \| call system('chmod +x '.expand('%'))
    \| silent e
    \| else
    \| echohl WarningMsg
    \| echo 'Save the file first'
    \| echohl None
    \| endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                EOF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""