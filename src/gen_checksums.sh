#!/bin/bash

hashcmd=${1:-sha256sum}

find . -type f -exec ${hashcmd} {} \;
