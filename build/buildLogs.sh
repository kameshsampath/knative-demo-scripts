#!/bin/bash

source "../setEnv.sh"

kail -n $NAMESPACE -l build.knative.dev/buildName=event-greeter-build --since=2h 