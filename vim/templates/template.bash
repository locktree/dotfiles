#!/usr/bin/env bash
###########################################################################
##  FILENAME    : template.bash
##  VERSION     : 1.0
##  LAST UPDATE : Sun 28 Apr 2019 12:28:57 PM CEST
##  AUTHOR      : mitchell
##  DESCRIPTION : This is a script template
##  USAGE       : [SCRIPTNAME] [-hv] [-o[file]] args ...
##  USAGE       : $(basename $0) [-abch] [-f infile] [-o outfile]
##  USAGE       : $(basename $0)      <vfei command>  <eqp_name>  <recipe>
##  EXAMPLE     : fetchRecipeControl  RES_LIST        WS0303      WASHDOWN
##
##  OPTIONS
##    jkl[-lf:bmcdxh]
##        [-o] [file]           Set log file (default=/dev/null)
##        [-f] infile           Specify input file infile
##        [-o] outfile          Specify output file outfile
##        [-h], [--help]        Print this help and exit
##        [-v], [--verbose]     Verbose mode
##        [-x], [--debug]       Turn on debug information
##        [-q], [--quiet]       Quiet mode
##
##  PARAMETERS
##    $1 : MBX name       ${EMMBX}
##    $2 : MID            MID/A="LM2001"
##
##  EXIT CODES
##    0 ==> This script completed without error
##    1 ==> Usage error
##    2 ==> This script exited on a trapped signal
##
##  SHELL OPTIONS
##    set -o errexit    #(set -e)   Exit on command errors
##    set -o noexec     #(set -n)   Cmds are not executed,only syntax check
##    set -o nounset    #(set -u)   Exit if undefined variable is used
##    set -o pipefail   #           Exit if any part of the pipe fails
##    set -o verbose    #(set -v)   A trace of every cmd executed run
##    set -o xtrace     #(set -x)   Execution tracing debug messages
##
###########################################################################

###########################################################################
# USAGE MESSAGE
###########################################################################
usage() {
    exec >&2  ## redir stdout to stderr
    sed '2,/^###/p;d' "$0"
    exit 1
}

###########################################################################
# CONSTANTS VARIABLES
###########################################################################
## SCRIPT META DATA
readonly ARGS="$@"    ## Bash only
readonly ARGS1="$*"   ## Also for sh
readonly ARGNUM=$#
readonly PID=$$
#
readonly ENTIRE_SCRIPT_NAME="$(readlink -f $0)"
readonly SCRIPT_NAME="${0##*/}"
readonly SCRIPT_NAME="${ENTIRE_SCRIPT_NAME##*/}"
readonly SCRIPT_DIR="${ENTIRE_SCRIPT_NAME%/*}"

## TIME AND DATE
readonly DATE=$(date +'%Y%m%d')
readonly YEAR=${DATE:0:4}
readonly MON=${DATE:4:2}
readonly DAY=${DATE:6:2}
readonly NOW=$(date +'%Y%m%d_%H%M%S')
readonly EPOCH=$(date +%s)

## CONFIGURATION
readonly NR_OF_PARAMS_EXPECTED=0

## SET THE DEFAULTS
: ${VERBOSE:=0}
: ${DEBUG:=0}
: ${LOGFILE:="/var/log/${SCRIPT_NAME}.log"}
: ${LOCKFILE:="/tmp/${SCRIPT_NAME}.lockfile"}

###########################################################################
## GETOPTS FLAGS   ---> : AFTER options means argument required!
###########################################################################
while getopts ":hi:qvx" option; do  ## ":" up front means no error message!
    case "${option}" in
      h) usage
         ;;
      i) infile="${OPTARG}"
         echo "-i used: ${OPTARG}"
         ;;
      q) quiet='true'
         ;;
      v) verbose='yes'
         ;;
      x) set -x
         ;;
      :) printf "Option -%s requires an argument.\n" "${OPTARG}" >&2
         usage
         ;;
      ?) printf "Option -%s is invalid\n" "${OPTARG}" >&2
         usage
         ;;
      *) printf "Unknown error while processing options\n"  >&2
         usage
         ;;
    esac
done
shift $((OPTIND-1))  ##This tells getopts to move on to the next argument
#echo "There are <$#> remaining parameters which are <$@>"

###########################################################################
## TRAP
###########################################################################
signal_exit_with_signal_recognizing() {
    SIGNAL="$1"

    ## Handle Signal
    case ${SIGNAL} in
       INT)  printf "\n$(basename $0): Interrupted by user (CTRL+C)\n" 1>&2 ;;
      TERM)  printf "\n$(basename $0): Program terminated"             1>&2 ;;
         *)  printf "\n$(basename $0): Terminating on unknown signal"  1>&2 ;;
    esac

    ## Print info about current status
    printf "\n"                                         1>&2
    printf "%s\n" "#######  SIGNAL HANDLER ########"    1>&2
    printf "%s\n" "TIMESTAMP :  $(date +"%Y-%m-%d %T")" 1>&2
    printf "%s\n" "SCRIPT    :  $(basename $0)"         1>&2
    printf "%s\n" "LINE      :  ${LINENO}"              1>&2
    printf "%s\n" "SIGNAL    :  ${SIGNAL}"              1>&2
    printf "%s\n" "COMMAND   :  ${BASH_COMMAND}"        1>&2
    printf "%s\n" "USER      :  ${USER}"                1>&2

    ## Cleanup if needed
    cleanup

    exit 99
}
trap "signal_exit_with_signal_recognizing TERM" TERM HUP
trap "signal_exit_with_signal_recognizing INT"  INT

###########################################################################
##       SIMPLE TRAP
###########################################################################
signal_exit_simple() {
    cleanup
}
trap signal_exit_simple INT

###########################################################################
##       IGNORE SOME SIGNALS, DO NOTHING
###########################################################################
trap '' SIGINT SIGQUIT SIGTSTP

###########################################################################
###       CLEANUP
###########################################################################
cleanup() {
    printf "%s\n" "Starting cleanup..."  1>&2
    ## Remove temporary files
    ## Restart services
    ## ...

    remove_lockfile

    #FILE="/file/to/clean/up.txt"
    #[ -f "${FILE}" ] && rm --force "${FILE}" && printf "%s\n" "Removing ${FILE}..."  1>&2

    printf "%s\n" "Finished cleanup..."  1>&2

    return 0
}

###########################################################################
##       ERROR EXIT
###########################################################################
error_exit() {
    echo -e "${SCRIPT_NAME}: ${1:-"Unknown Error"}" >&2
    cleanup
    exit 1
}

###########################################################################
##   LOCKFILE
###########################################################################
## TWO implementation possible:
##   1. STOP script when the script is already running
##   2. KILL the currently running script, because it's probably hanging
create_lockfile() {
	if [ -z "${LOCKFILE}" ]; then
	    printf "%s\n" "NO LOCKFILE SPECIFIED"
	else
        if [ -f "${LOCKFILE}" ]; then
            ## OPTION 1 : STOP THE SCRIPT WHEN THE SCRIPT IS ALREADY RUNNING
            #printf "%s\n" "Script is already running\!"
            #printf "%s\n" "PID : $(cat ${LOCKFILE})"
            #exit 99

            ## OPTIONS 2 : KILL THE CURRENTLY RUNNING SCRIPT
            printf "%s\n" "Kill the currently running script..."
            kill -15 $(cat "${LOCKFILE}")
            printf "%s\n" "...removed"
        else
            printf "%s\n" $$ > "${LOCKFILE}"
        fi
   fi
}

remove_lockfile() {
    if [ -z "${LOCKFILE}" ]; then
	    printf "%s\n" "NO LOCKFILE SPECIFIED"
	else
        [ -f "${LOCKFILE}" ] && rm -f "${LOCKFILE}"
    fi
}

###########################################################################
##       MAIN BODY
###########################################################################
main () {
    #create_lockfile
    #[ "${DEBUG}" = "ON" ] && printf "%s\n" "Start debugging"
    START_TIME=$(date +'%s')
    printf "%s\n" "
    ######################################################################
    ##   STARTING...
    ##   SCRIPT: ${SCRIPT_NAME}
    ##   ARGS  : ${ARGS}
    ##   DATE  : ${NOW}
    ##   USER  : ${USER}
    ######################################################################
    "

    printf "%s\n" "
    ###############################
    ### PUT MY CODE HERE
    ###############################
    "

    END_TIME=$(date +'%s')
    EXECUTION_TIME=$(( ${END_TIME} - ${START_TIME} ))
    printf "%s\n" "
    ######################################################################
    ##   FINISHING ...
    ##   DATE     : ${NOW}
    ##   EXEC TIME: ${EXECUTION_TIME}
    ######################################################################
    "

    cleanup
    return 0
}

## Write all logging to terminal and a log file
exec &> >(tee -a "${LOGFILE}")

## Import Libraries
[ -f "~/LIB/log" ] && . ~/LIB/log && printf "%s" "sourced lib/log.."  1>&2

## For testing purposes
[ -f "$0.override" ] && . $0.override >/dev/null 2>&1

## Check the number of parameters
[ $# -ne ${NR_OF_PARAMS_EXPECTED} ] && ( printf "%s\n" "Illegal number of parameters" && usage )

## Boot strap the script
main "$@"

# Check exit status
[ $? -eq 0 ] && printf "%s\n" "main Successful executed!" || printf "%s\n" "ERROR in main!"

#---------------------------------------------------------------------------
#                         \\\\ ////
#                         \\ - - //
#                            @ @
#                    ---oOOo-( )-oOOo---
#---------------------------------------------------------------------------
# vim: syntax=sh cc=76 tw=79 ts=4 sw=4 sts=4 et sr
###########################################################################
##                          EOF
###########################################################################
