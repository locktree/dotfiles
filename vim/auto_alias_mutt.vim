" This function, which is to be run only on a Mutt email message,
" finds all the addresses in the To, Cc, and Bcc headers. If
" no aliases exist for these addresses, they are added to the
" alias file.
function! AddMuttAliases()

  " This is where my alias file lives. Change this to something
  " that suits you.
  let aliasfile = $UU . '~/.mutt/aliases'

  " Why isn't there a match + matchstr? match only gives me the
  " start, which is not enough to extract the substring.
  " matchstr doesn't give me the location, which is not enough
  " information to advance forward.

  " Find all email addresses. My pattern may not be the best yet.
  let addresses = []
  silent vimgrep /^\(To\|Cc\|Bcc\):/j %
  for line in getqflist()
    let pattern = '[-A-z._]\+@[-A-z._]\+'
    let start = match(line.text, pattern)
    let address = matchstr(line.text, pattern, start)
    while address != ""
      call add(addresses, address)
      let start += len(address)
      let address = matchstr(line.text, pattern, start)
    endwhile
  endfor

  " Check to see if each is in aliases file. If not, add it.
  " Mutt's alias registration command has this form:
  "
  "   alias name address
  "
  " Usually the name is something short and mnemonic. I prefer
  " to continually work with people's addresses so that I'm not
  " too crippled when I lose my configuration.  So, my aliases
  " have this form:
  "
  "   alias address address
  "
  " Isn't this overly verbose? Yes. What have I gained? Well,
  " mutt will tab-complete the addresses for me. Verbosity
  " doesn't matter. And that's sweet.
  for address in addresses
    execute 'silent! vimgrep /' . address . '/j ' . aliasfile
    if len(getqflist()) == 0
      let aliasline = 'alias ' . address . ' ' . address
      silent! execute '!echo ' . aliasline . ' >> ' . aliasfile
    endif
  endfor
endfunction

autocmd BufWritePost /tmp/mutt-* call AddMuttAliases()
