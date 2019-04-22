#!/bin/bash
set -eu
source "./setEnv.sh"

SVC=${1:-'greeter'}
while true
do
  http --body $IP_ADDRESS "Host:$SVC.$NAMESPACE.example.com"
  sleep 3
done;