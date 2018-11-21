#!/usr/bin/env python3

# Fortwrangler is a tool that attempts to resolve issues with fortran lines over standard length.

# Global libraries
import sys

# Global variables

# Strings inserted for continuation
CONTINUATION_ENDLINE = "&\n"
CONTINUATION_STARTLINE = "      &"

# Line length settings
MIN_LENGTH = len(CONTINUATION_STARTLINE) + len(CONTINUATION_ENDLINE) + 1
DEFAULT_LINE_LENGTH = 80
FIXED_LINE_LENGTH = 80 # We don't actually do fixed format files, but I prefer 80 col anyway.
FREE_LINE_LENGTH = 132

# I/O settings
STDERR = sys.stderr
STDOUT = sys.stdout 

# We can't use Python's string splitter as we want to handle string literals properly.
def string_split(s):
    inquotes=False
    retlist = []

    token = ""
    for character in s.strip():
        if character == " " and not inquotes:
            if not (token == ""):
                retlist.append(token)
                token = ""
            else:
                token = token + character
        elif character == '"' and not inquotes:
            inquotes = True
            token = token + character
        elif character == '"' and inquotes:
            inquotes = False
            token = token + character
        else: 
            token = token + character

    if not (token == ""):
        retlist.append(token)

    return retlist

# Fix a given file.
def force_fix_file(filename, maxlength=DEFAULT_LINE_LENGTH, output=STDOUT):
    with open(filename) as infile:
        for line in infile:
            if len(line) > maxlength + 1:

                tempstr=line[:(len(line) - (len(line.lstrip())-1)-1)]

                tokens = string_split(line)
                index = 0
                for t in tokens:   
                    if t == "!":
                        # Comments can be longer because the compiler just ignores them.
                        tempstr = tempstr +  " ".join(tokens[index:len(tokens)])
                        break
                    else:
                        if (len(tempstr + t + " " + CONTINUATION_ENDLINE)) < maxlength + 1:
                                tempstr = tempstr + t + " "
                        else:
                                if (t.startswith('"') and t.endswith('"')):
                                    tempstr = tempstr + t + " "
                                    while (len(tempstr) > maxlength + 1):
                                        outstr = tempstr[:(maxlength-1)] + CONTINUATION_ENDLINE
                                        output.write(outstr)
                                        tempstr = CONTINUATION_STARTLINE + tempstr[(maxlength-1):]
                                    output.write(tempstr)
                                    tempstr=""                           
                                else: 
                                    output.write(tempstr + " " + CONTINUATION_ENDLINE)
                                    tempstr=CONTINUATION_STARTLINE + " " + t + " "
                        index += 1
                output.write(tempstr + "\n")

            else:
                output.write(line)

# Only fix files if the violate the length rules!
def fix_file(filename, maxlength=DEFAULT_LINE_LENGTH, output=STDOUT):
    if not check_file(filename):
        force_fix_file(filename, maxlength, output)
    else:
        STDERR.write(filename + " not over line length, not modifying\n")

# Check to see if a file has lines longer than allowed, optionally report.
def check_file(filename, maxlength=DEFAULT_LINE_LENGTH, report=None):
    overlengthlines = {}
    counter = 0
    with open(filename) as f:
        for line in f:
            counter += 1
            if (len(line)) > maxlength + 1:  # New lines count in Python line length.
                overlengthlines[counter] = len(line)

    if report != None:
        report.write(filename +  ": " + str(len(overlengthlines)) + "\n")
        for a in overlengthlines.keys():
            report.write(str(a) + ": " + str(overlengthlines[a]) + "\n")

    return len(overlengthlines) == 0

# Our main procedure.
# Arguments at the command-line:
# -o <file> - write out to file instead of stdout
# -i <extension> - do in place
# -c - check only
# -w <number> - set line length
def main():
    import argparse 
    #check_file("example.f90", report=STDERR)
    #fix_file("example.f")

    maxlength = DEFAULT_LINE_LENGTH
    output = STDOUT

    parser = argparse.ArgumentParser(description="Fix free format Fortran files with invalid line lengths.")
    parser.add_argument("-c", action="store_true", help="Check only.")
    parser.add_argument("-i", metavar="ext", type=str, help="Do in place, back up copy with extension specified.")
    parser.add_argument("-w", metavar="linelength", type=int, help="Custom line length.")
    parser.add_argument("-o", metavar="outputfilename", type=str, help="Output to a file instead of STDOUT.")
    parser.add_argument("files", metavar="file", type=str, nargs="+",help="Files to fix.")

    args=parser.parse_args()

    if args.w != None:
        maxlength = args.w 

    if args.o and args.i:
        STDERR.write("Error - you cannot both write output to a separate file and write it in place.\n")
    else:
        if args.o != None:
            outfile = open(args.o, 'w')
            output = outfile
        if args.c:
            for a in args.files:
                check_file(a, maxlength=maxlength, report=output)
        elif args.i != None:
            import os
            for a in args.files:
                if not check_file(a):
                    STDERR.write("Fixing file: " + a + "\n")
                    os.rename(a, a + args.i)
                    inplacefile = open(a, 'w')
                    force_fix_file(a + args.i, maxlength=maxlength, output=inplacefile)
                    inplacefile.close()
        else:
            for a in args.files:
                fix_file(a, maxlength=maxlength, output=output)

        if args.o != None:
            outfile.close()




if __name__ == "__main__":
    main()