#!/bin/bash 

set -eu

source "../setEnv.sh"

! kubectl -n $NAMESPACE delete -f "$TUTORIAL_HOME/04-scaling/knative/service-10.yaml"

sleep 3 

cat "$TUTORIAL_HOME/04-scaling/knative/service-10.yaml" | \
  sed 's~dev.local/rhdevelopers/greeter:0.0.1~quay.io/rhdevelopers/knative-tutorial-greeter:quarkus~g;' | \
  kubectl -n $NAMESPACE apply -f -

# Wait until pods are started
wait_for_all_pods $NAMESPACE