#!/usr/bin/env python3

'''
  Python script to convert YouTube XML subtitles to SRT format
  It might be neater to use an XML library but I want to avoide 
  external dependencies, and pretending that it's not XML, it
  resembles a fairly simple text file.
  
  Owain Kenway
'''

# Convert a numeric time in ms to format used in SRT
# timestamp - the time in ms since start
# delta - extra time for calculating durations.
def timeconvert(timestamp=0, delta=0):
    wn = timestamp + delta
    hours = int(wn/(3600 * 1000))
    wn = wn - (hours * 3600 * 1000)
    minutes = int(wn/(60 * 1000))
    wn = wn - (minutes*60*1000)
    seconds = int(wn/1000)
    ms = wn-(seconds * 1000)

    return (str(hours) + ":" + str(minutes) + ":" + str(seconds) + "," + str(ms))

# Generate a title timestamp
# SRT format for time is:
# HH:mm:ss,ms --> HH:mm:ss,ms
def gents(timestamp=0, duration=0):

    b = timeconvert(timestamp, 0)
    e = timeconvert(timestamp, duration)

    return(b + " --> " + e)

# Generate a title from an XML line
# SRT format is:
# counter
# HH:mm:ss,ms --> HH:mm:ss,ms
# text
# \n
def processline(line="", counter=0):

# ignore empty lines
    if line.strip() == "" :
        return ""

    t = 0
    d = 0
    text=""

# Tidy line
    line = line.strip()
    line = line.strip("<p").strip("</p>").strip()

# Split into block about timing, and text block.
    tokens = line.split(">", 1)
    preamble = tokens.pop(0)
    
# Work out times from the preamble
    times = preamble.split(" ")
    t = int(times[0].strip("t=").strip('"').strip())
    d = int(times[1].strip("d=").strip('"').strip())

# The rest of the line is text.
    text = tokens[0]

# Replace some HTML entitles.
    text = text.replace("&#39;", "'")
    text = text.replace("&quot;", '"')

    return (str(counter) + "\n" + gents(t,d) + "\n" + text + "\n")

# Process a file.
def processfile(filename):
    data = ""
    xf = open(filename, 'r')
    fail=0

# read in the file and skip lines that aren't titles.
    for line in xf:
        k = line.strip()

        # ditch bad lines
        if k.startswith("<?xml"):
            fail = fail + 1
        elif k.startswith("<body>"):
            fail = fail + 1
        elif k.startswith("</body>"):
            fail = fail + 1
        elif k.startswith("</timedtext>"):
            fail = fail + 1
        elif k.startswith("<timedtext"):
            fail = fail + 1
        elif k.startswith("<p"):
            data = data + "\n" + k
        else:
            data = data + "\n" + k
        
    xf.close()

# Split the titles based on paragraphs as per YouTube XML spec.
    titles = data.split("</p>")

    output = ""

# Process the titles one at a time
    counter = 1
    for a in titles:
        output = output + "\n" + processline(a, counter)
        counter = counter + 1 

    return output

# Our normal main.  
# If we have an argument, convert otherwise print basic usage info.
if __name__ == '__main__':
    import sys
    
    if len(sys.argv) > 1:
       file=sys.argv[1]
       print(processfile(file))
    else:
        print("Usage:\n   " + sys.argv[0] + " <YouTube XML subtitle file>")

    
