#!/usr/bin/env bash

which wolfram > /dev/null 2>&1
wsuccess=$?

if [ "$wsuccess" == "0" ]; then
  wolfram -script $@
else
  echo "Wolfram language not found."
  exit 1
fi
