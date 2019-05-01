#!/bin/sed -f
###########################################################################
#  Filename   : template.sed
#  Author     : mitchell
#  Description:
#  Last Update: Sun 28 Apr 2019 12:28:50 PM CEST
###########################################################################
## Syntax : ./template.sed [file]
##
## For each line, there will be a starting and ending tag added
##
s/^/<h1>/
s/$/<\/h1>/
###########################################################################
###                          E O F
###########################################################################
