#!/usr/bin/env python3

# Very simple console tool to control Banshee.

def banstat():

  title = gettitle()
  artist = getartist()
  album = getalbum()

  print("\nCurrent track:\n")
  print("   Title:", title)
  print("  Artist:", artist)
  print("   Album:", album, "\n")
  

def getartist():
  from subprocess import run, PIPE
  return run(["banshee", "--query-artist"], stdout=PIPE).stdout.decode("utf-8").strip()[8:]

def getalbum():
  from subprocess import run, PIPE
  return run(["banshee", "--query-album"], stdout=PIPE).stdout.decode("utf-8").strip()[7:]

def gettitle():
  from subprocess import run, PIPE
  return run(["banshee", "--query-title"], stdout=PIPE).stdout.decode("utf-8").strip()[7:]

def n():
  from subprocess import run
  run(["banshee", "--next"])

def prev():
  from subprocess import run
  run(["banshee", "--previous"])

def play():
  from subprocess import run
  run(["banshee", "--play"])

def pause():
  from subprocess import run
  run(["banshee", "--pause"])

def getusercom():
  print("Next action: (.)next, (,)prev, (l)pause, (;)play, (e)xit:", end='')
  return input()
   
  
if __name__ == '__main__':
  g = True
  while g:
    banstat()
    x = getusercom()
    if x.lower() == "e":
      g = False
    if x.lower() == ".":
      n()
    if x.lower() == ",":
      prev()
    if x.lower() == "l":
      pause()
    if x.lower() == ";":
      play()



