#!/bin/bash 

set -eu

source "../setEnv.sh"

cat "$TUTORIAL_HOME/04-scaling/knative/service-10.yaml" | \
  sed 's~dev.local/rhdevelopers/greeter:0.0.1~quay.io/rhdevelopers/knative-tutorial-greeter:sb~g;' | \
  kubectl -n $NAMESPACE apply -f -

# Wait until pods are started
wait_for_all_pods $NAMESPACE