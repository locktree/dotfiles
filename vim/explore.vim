"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author      : mitchell
" Purpose     : Vim explore
" Last Update : Sun 28 Apr 2019 12:24:35 PM CEST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         EXPLORE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore
        let t:expl_buf_num = bufnr("%")
    endif
endfunction
map <silent> <TAB><TAB> :call ToggleVExplorer()<CR>

" Default to tree mode
let g:netrw_liststyle = 3
let g:netrw_banner = 0         " No Banner
let g:netrw_browse_split = 3   " Open in a new tab
"netrw_browse_split option
"    1 - open files in a new horizontal split
"    2 - open files in a new vertical split
"    3 - open files in a new tab
"    4 - open in previous window
let g:netrw_winsize = 50       " Width of directory explorer
let g:netrw_altv = 1
let g:netrw_sort_by = "time"
let g:netrw_sort_direction = "revese"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""