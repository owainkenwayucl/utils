# utils
Various small tools that I use to make my life easier.

Currently contains:

 * `ftc` - a short script to print all the files in a particular directory + subdirectories which contain a particular string.

 * `ytsrt.py` - a short program for converting YouTube XML subtitles into SRT format.

 * `jytsrt.py` - a short program for converting YouTube JSON subtitles into SRT format.

 * `jytvtt.py` - a short program for converting YouTube JSON subtities into VTT format.

 * `intsum`, `fpsum`, `fpmean` - tiny F77 programs which sum/mean all the numbers from `stdin` and put the output on `stdout`.  `intsum` does integer math, `fpsum`/`fpmean` double precision floating point.

 * `dir` - a shell wrapper to be more like the behaviour of DOS `dir` (WRT pagination, order) than GNU `dir`.

 * `bt.py` - an extremely basic tool to control Banshee from a console.

 * `amstrad2unix` - a command-line tool to convert files copied from Amstrad NC series computers to Unix/Linux format.

 * `unicode_pretty.hy` - a command-line tool to convert ASCII strings into pretty unicode text, e.g. 𝔅𝔩𝔞𝔠𝔨𝔩𝔢𝔱𝔱𝔢𝔯.

 * `python*-wrapper.sh` - commands to launch a python 2/3 interpreter with the "recommended" environment on UCL RC resources, regardless of python modules loaded.

 * `fortwrangler`/`fortwrangler.py` - convert non-compliant free format Fortran code to the correct line length.

 * `ADdate`/`addate.py` - convert Active Directory dates into either text or Unix epochs.

 * `aws-instance-status.py` - basically `qhost` for AWS, wraps `awscli`.

 * `aws-get-ip` - converts an AWS instance ID into an IP address safely (validates it to decrease opportunity for command injection), wraps `awscli`.
