###########################################################################
# Author      : mitchell
# Purpose     : tcsh prompt
# Last Update : Sun 28 Apr 2019 08:57:39 PM CEST
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

set inside_git=`sh -c 'git rev-parse --is-inside-work-tree 2> /dev/null'`
if ( $?CLEARCASE_ROOT) then
    # Inside clearcase
    set view_name=""
    set view_name=`echo $CLEARCASE_ROOT | awk '{split($0,a,"/"); print a[3]}'`
    set prompt="%D %w %P %m \n${blue}[ ${view_name} ]${blue}%~ % "
    /sdev/user/sbin/x86_32-linux/xtitle \[${view_name}\] $cwd
else if ( "${inside_git}" == "true") then
    # Inside Git
    set workdir=`pwd`
    set git_branch=`sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'`
    if ( "$workdir" =~ /sdev_shared/* ) then
        set prompt="%D %w %P ${red}[ ${git_branch} ]${blue}%~ % "
    else
        set prompt="%D %w %P ${cyan}[ ${git_branch} ]${blue}%~ % "
    endif
    /sdev/user/sbin/x86_32-linux/xtitle \[${git_branch}\] $cwd
else
    # Not inside Clearcase or Git
    set prompt="%D %w %P %m %~ % "
    /sdev/user/sbin/x86_32-linux/xtitle \[-\] $cwd
endif
###########################################################################
##                          E O F
###########################################################################