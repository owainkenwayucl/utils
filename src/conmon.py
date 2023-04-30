#!/usr/bin/env/python3

import subprocess
import argparse
import time
import datetime

PING_COMMAND = ['ping', '-c', '1']
TARGET_HOST = "www.google.com"
TIMER = 60

def test_connection(host):
	command = PING_COMMAND.copy()
	command.append(host)
	now = str(datetime.datetime.now())
	try:
		completed = subprocess.run(command, capture_output=True, encoding="UTF-8")
		if completed.returncode != 0:
			print(now + " Could not connect to " + host)
			
	except:
		print(now + " Could not connect to " + host + "[EXCEPTION]")

def _main():
	parser = argparse.ArgumentParser(description="Connection tester.")
	parser.add_argument("--host", metavar="host", type=str, default="www.google.com")
	parser.add_argument("-t", "--timer", metavar="timer", type=float, default=60)

	args = parser.parse_args()
	host = args.host
	TIMER = args.timer
	while True:
		now = time.time()
		test_connection(host)
		taken = time.time() - now
		_timer = TIMER - taken
		if _timer < 0:
			_timer = 0
		time.sleep(_timer)


if __name__ == "__main__":
	_main()
