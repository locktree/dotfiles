#!/usr/bin/env python3

"""
A simple python script template.
@Author      : mitchell
@Last Update : Tue 30 Apr 2019 09:11:07 PM CEST
"""
import os
import sys
import argparse

def optionparser():
    """
    Function to parse the command line options.

       :return:   The parsed command line information
       :rtype:    tuple including the arguments and the program name
    """
    program_name = os.path.basename(sys.argv[0])
    program_longdesc = """Some description"""
    program_license  = "Copyright MIT"

    try:
        parser = argparse.ArgumentParser(
            prog = program_name,
            description = program_longdesc,
            epilog = program_license,
            add_help = True,
            formatter_class = argparse.ArgumentDefaultsHelpFormatter,
            )

        parser.add_argument(
            "-m",
            "--myvar",
            required = True,
            type = str,
            action = "store",
            dest = "myvar",
            help = "Set myvar.")

        return (parser.parse_args(), program_name)
    except Exception as erh:
        sys.stderr.write(program_name + ": " + repr(erh) + "\n")
        exit(2)

def main():
    args, program_name = optionparser()
    print ("Hello world")

if __name__ == '__main__':
    main()
###########################################################################
###                          E O F
###########################################################################
