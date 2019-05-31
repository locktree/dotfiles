#!/usr/bin/gawk
#--------------------------------------------------------------------------
# Author     : mitchell
# Purpose    : AWK os/filesystem
# Last Update: Thu 23 Aug 2018 10:16:43 AM CEST
#--------------------------------------------------------------------------

## 'quote' str for shell
function quote(str) {
    gsub(/'/, "'\\''", str)
    return "'" str "'"
}

function check11(u, missing) {
    if (u == 0 && u == "") {
        MISSING = 1
        return missing
    }
    MISSING = 0
    return u
}

function isreadable(path){
    return (system("test -r " quote(path)) == 0)
}

## Check prefox
function has_prefix(str, pre,    len2) {
    len2 = length(pre)
    return substr(str, 1, len2) == pre
}

###########################################################################

function filesize(path,    followlink, v, cmd) {
    cmd = "ls -ld " (followlink ? "-L " : "") quote(path) " 2>/dev/null"
    if (0 < (cmd | getline v)) {
        close(cmd)
        if (v ~ /^-/) {
            return head(v, " ", 5) ## filesize
        } else {
            return "" ## not regular file
        }
    } else {
        close(cmd)
        return -1   ## file doesn't exist
    }
}

function filetype(path,   followlink,  v, cmd) {
    cmd = "ls -ld " (followlink ? "-L " : "") quote(path) " 2>/dev/null"
    if (0 < (cmd | getline v)) {
        close(cmd)
        v = substr(v, 1, 1)  ## -dlcbsp
        if (v == "-")
            return "f" ## this ensures that error result < all non-error results
        else
            return v
    } else {
        close(cmd)
        return -1    ## file doesn't exist
    }
}

## basename returns the last element of pathname.
function basename(pathname, suffix) {
    sub(/\/$/, "", pathname)
    if (pathname == "") {
        return "/"
    }
    sub(/^.*\//, "", pathname)
    if (suffix != "" && has_suffix(pathname, suffix)) {
        pathname = substr(pathname, 1, length(pathname) - length(suffix))
    }
    return pathname
}

## dirname returns all but the last element of pathname, typically the pathname's directory.
function dirname(pathname) {
    if (!sub(/\/[^\/]*\/?$/, "", pathname)) {
        return "."
    } else if (pathname != "") {
        return pathname
    } else {
        return "/"
    }
}

## is_abs returns true if the path is absolute.
function is_abs(pathname) {
    return length(pathname) > 0 && has_prefix(pathname, "/")
}

# TODO
# tail not defined for negative nth (doesn't make sense, will always be none)
# negative nth with zero-length matches:
#   - head returns one element too early, or sometimes wrongly?
#   - matchstr diverges
function tail(str,  re, nth, m,  start, n) {
    nth = checkpos(nth, 1, "tail: third argument must be positive")
    re = check11(re, SUBSEP)
    if (nth == 1) {
        if (match(str, re)) {
            m = substr(str, RSTART + RLENGTH)
            RSTART += RLENGTH
            RLENGTH = length(m)
        }
        return m
    } else {
        RLENGTH = -1
        start = 1
        while (nth--) {
            if (RLENGTH > 0) {
                str = substr(str, RSTART + RLENGTH)
                start += RLENGTH - 1
            } else if (RLENGTH == 0) {
                start++
                if ((str = substr(str, RSTART + 1)) == "") {
                    nth--
                    break
                }
            }
            n = (RLENGTH > 0)
            if (!match(str, re)) break
            if (n && !RLENGTH) {
                assert(RSTART == 1 && nth >= 0)
                if ((str = substr(str, 2)) == "" || !match(str, re)) break
                start++
            }
            start += RSTART + n - 1
        }
        if (nth >= 0) {
            RSTART = 0
            RLENGTH = -1
        } else {
            m = substr(str, RSTART + RLENGTH)
            RSTART = start + RLENGTH
            RLENGTH = length(m)
        }
        return m
    }
}

# this returns items between "re"; matchstr returns what matches "re"
# 3rd argument to specify which item (-1 for last)
# defaults to re=SUBSEP nth=1st none=""
function head(str, re, nth,  none,   start, m, n) {
    if (nth != -1) {
        nth = checkpos(nth, 1, "head: third argument must be positive")
    }
    re = check11(re, SUBSEP)
    if (nth == 1) {
        if (match(str, re)) {
            RLENGTH = RSTART - 1
            str = substr(str, 1, RLENGTH)
        } else {
            RLENGTH = length(str)
        }
        RSTART = 1
        return str
    } else {
        # # to get arbitrary item, we just split
        # nf = split(str, aux, re)
        # if (nth == -1 && nf > 0)
        #     m = aux[nf]
        # else if (nth in aux)
        #     m = aux[nth]
        # split("", aux) # does it help to delete the aux array?
        # return m

        # I simplified and streamlined as much as I could, while still passing tests.
        m = (nth > 0) ? none : ""
        RLENGTH = -1
        start = 1
        while (nth--) {
            if (RLENGTH > 0) {
                str = substr(str, RSTART + RLENGTH)
                start += RSTART + RLENGTH - n
                m = (nth > 0) ? none : str
            } else if (RLENGTH==0) {
                start += RSTART + 1
                m = n ? substr(str, 2, 1) : str
                if ((str = substr(str, 2+n)) == "") {
                    if (!m || nth > 1) {
                        RSTART = 0
                        RLENGTH = -1
                        return none
                    } else if (nth-- > 0)
                        m = ""
                    else
                        start--
                    break
                }
            }
            n = (RLENGTH > 0)
            if (!match(str, re)) break
            if (RSTART > 1)
                m = substr(str, 1, RSTART-1)
            else
                m = (n && RLENGTH) ? "" : substr(m, 1, 1)
            start += n - 1
        }
        if (nth <= 0) {
            RSTART = start
            RLENGTH = length(m)
        }
        return m
    }
}

## returns pos or missing, else die(msg)
function checkpos(n, missing, msg) {
    if (int(n) == n) {
        if (n "" > 0) {
            MISSING = 0
            return n # explicit numbers are preserved
        } else if (msg && (n < 0 || n "" >=  0)) die(msg)
    } else if (msg) die(msg)
    MISSING = 1
    return missing
}
###########################################################################
###                                   EOF
###########################################################################
