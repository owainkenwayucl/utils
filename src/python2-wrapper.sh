#!/bin/bash -l
# Wrapper to load the python2/recommended module and run python

module remove python3 python2 python
module load python2/recommended
python "$@"
