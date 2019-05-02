###########################################################################
# Author      : mitchell
# Purpose     : tcsh prompt
# Last Update : Sun 28 Apr 2019 08:58:36 PM CEST
###########################################################################
# %/      - The current working directory shown as /home/user/
# %~      - The current working directory with your own home directory shown as "~" and other users shown as "~user"
# %B (%b) - Start (stop) boldface mode
# %d      - The weekday in `Day' format
# %D      - The day in `dd' format
# %m      - The machine's hostname up until the first . (Ex: freebsd.yourdomain.com would show up as simply "freebsd")
# %M      - The machine's full hostname (Ex: freebsd.yourdomain.com)
# %n      - Displays the username you are logged on as
# %t      - Shows the time in 12 hour format (Ex: 4:04pm)
# %T      - Shows the time in 24 hour format (Ex: 16:04)
# %p      - Shows the "precise" time of day in 12 hour format (Ex: 4:04:01)
# %P      - Shows the "precise" time of day in 24 hour format (Ex: 16:04:01)
# %w      - The month in `Mon' format

alias precmd  'source ~/tools/dotfiles/shell/tcsh/prompt_extra.csh'
alias     cd  'chdir \!:* && precmd'
###########################################################################
##                              E O F
###########################################################################