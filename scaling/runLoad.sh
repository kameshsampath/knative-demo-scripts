#!/bin/bash 

set -eu

source "../setEnv.sh"

 hey -z 30s -c 50 \
  -host "greeter.knativetutorial.example.com" \
  "http://${IP_ADDRESS?}?sleep=3&prime=10000&memload=100"
