#!/bin/bash 

source "../setEnv.sh"

BUILD_POD=$(kail -n $NAMESPACE  -l build.knative.dev/buildName=event-greeter-build --dry-run | awk 'NR==2{print $2}')

kubectl get pod $BUILD_POD -o yaml | yq r - spec.initContainers[*].name
