#!/usr/bin/env bash

for a in acqusition apidev-coop bzip crypt django-server pwd setup-tools telnet urlib3 urllib ssh-decorate
do
  $1 list $2 | grep --color=always $a
done
