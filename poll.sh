#!/bin/bash
set -eu
while true
do
  http --body $IP_ADDRESS 'Host:greeter.knativetutorial.example.com'
  sleep 3
done;