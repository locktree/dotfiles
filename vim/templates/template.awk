#!/usr/bin/awk -f
###########################################################################
#  Filename   : template.awk
#  Author     : mitchell
#  Description: Template for building AWK programs
#  Last Update: Sun 28 Apr 2019 12:28:32 PM CEST
###########################################################################
## Syntax : ./template.awk [file]

function die (msg) {
    printf "%s:%d %s\n", FILENAME, FNR, msg > "/dev/stderr"
    exit 1
}

## Put initialization code here
BEGIN {
   ## Set the default values for any options here
   ## Do initialization for before the first line from file
}

## Now put the active code. Format: pattern { action }
{
   print
}

## Put closing code here. This will execute after the last line from file
END {
    ## Dump any final output here
    print "the end"
    die("print some die message")
}

###########################################################################
###                          E O F
###########################################################################
