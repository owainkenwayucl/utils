#!/usr/bin/env python3

'''
  Python script to convert YouTube JSON subtitles to WebVTT format
  
  Owain Kenway
'''

# Convert numbers to strings, 0 padded to min 2 width.
def minwidth(number, w):
    number_s = str(number)
    if len(number_s) < w:
        n = w - len(number_s) 
        for i in range(n):
            number_s = "0" + number_s

    return number_s

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

    hours_s = minwidth(hours,2)
    minutes_s = minwidth(minutes,2)
    seconds_s = minwidth(seconds,2)
    ms_s = minwidth(ms, 3)


    return (hours_s + ":" + minutes_s + ":" + seconds_s + "." + ms_s)

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
def processline(line={'segs':[{'utf8':""}],'tStartMs':0,'dDurationMs':0}, counter=0):

    l = line['segs'][0]['utf8']

# ignore empty lines
    if l == "" :
        return ""

    t = 0
    d = 0
    text=""

# Tidy line
    l = l.strip()
    
# Work out times from the preamble
    t = line['tStartMs']
    d = line['dDurationMs']

# Replace some HTML entitles.
    l = l.replace("&#39;", "'")
    l = l.replace("&quot;", '"')

    return (str(counter) + "\n" + gents(t,d) + "\n" + l + "\n")

# Process a file.
def processfile(filename):
    import json
    xf = open(filename, 'r')

    data = json.load(xf)['events']

    xf.close()

    output = "WEBVTT\n"
    counter = 1
    for a in data:
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
        print("Usage:\n   " + sys.argv[0] + " <YouTube JSON subtitle file>")

    
