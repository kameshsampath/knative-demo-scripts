#!/bin/bash 

set -eu

source "../setEnv.sh"

kubectl -n $NAMESPACE apply -f "$TUTORIAL_HOME/05-build/knative/service.yaml"

# Wait until pods are started
wait_for_all_pods $NAMESPACE