#!/usr/bin/env bash
# Wrapper to load the python2/recommended module and run python

module remove python3 python2 python
module load python3/recommended
python3 "$@"
