#!/usr/bin/gawk -f
#--------------------------------------------------------------------------
# Author     : mitchell
# Purpose    : AWK array functions library
# Last Update: Thu 23 Aug 2018 10:16:49 AM CEST
#--------------------------------------------------------------------------
## Repeat text string
function rep(str, num,    res) {
    while (num--) res = res str;
    return res
}

## Check prefix
function hasprefix(str, pre,    len2) {
    len2 = length(pre)
    return substr(str, 1, len2) == pre
}

## Check suffix
function hassuffix(str, suf,    len1, len2) {
    len1 = length(str)
    len2 = length(suf)
    return len2 <= len1 && substr(str, len1 - len2 + 1) == suf
}

## left trim
function ltrim22(s) {
    sub(/^[ \t\r\n]+/, "", s);
    return s
}

## right trim
function rtrim22(s) {
    sub(/[ \t\r\n]+$/, "", s);
    return s
}

## trim
function trim22(s) {
    return rtrim(ltrim(s));
}

## Returns "string" with leading and trailing whitespace trimmed
function trim(str) {
    gsub(/^[[:blank:]]+|[[:blank:]]+$/, "", str);
    return str;
}

## Remove trailing and leading whitespace from string
function trim11(str) {
    if (match(str, /[^ \t\n].*[^ \t\n]/))
        return substr(str, RSTART, RLENGTH)
    else if (match(str, /[^ \t\n]/))
        return substr(str, RSTART, 1)
    else
        return ""
}

## remove trailing whitespace from string
function trimright(str) {
    if (match(str, /.*[^ \t\n]/))
        return substr(str, RSTART, RLENGTH)
    else
        return ""
}

## Remove leading whitespace from string
function trimleft(str) {
    if (match(str, /^[ \t\n]+/))
        return substr(str, RLENGTH+1)
    else
        return str
}

## Returns "string" backwards
function rev(str,    a, len, i, o) {
    # split string into character array
    len = split(str, a, "");
    # iterate backwards and append to the output string
    for (i=len; i>0; i--) {
        o = o a[i];
    }
    return o;
}

## Converts string to an array, one char per element, 1-indexed
## Returns the array length
function str_to_arr(str, arr) {
    return split(str, arr, "");
}

## Returns the string escaped so that it can be used in a shell command
function shell_esc(str) {
    gsub(/'/, "'\\''", str)
    return "'" str "'"
}
###########################################################################
###                                   EOF
###########################################################################
