#!/bin/bash 

if [ -n "$1" ]; then
  ip=$(aws ec2 describe-instances --instance-ids ${1} --query 'Reservations[*].Instances[*].PublicIpAddress' --output text)
  if [ -n "$ip" ]; then
    echo $ip
  else
    >&2 echo ">>> ERROR <<< Machine has no IP address"
    exit 2
  fi
else
  >&2 echo $0 host-id
  exit 1
fi 
