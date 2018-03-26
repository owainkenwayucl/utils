#!/bin/bash -l
# Wrapper to load the python3/recommended module and run python

module remove python3 python2 python
module load python3/recommended
python3 "$@"
