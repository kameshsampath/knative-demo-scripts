#!/bin/bash 

set -eu

source "../setEnv.sh"

cat "$TUTORIAL_HOME/03-configs-and-routes/config/configuration-rev2.yaml" | \
  sed 's~dev.local/rhdevelopers/greeter:0.0.1~quay.io/rhdevelopers/knative-tutorial-greeter:quarkus~g;' | \
  kubectl -n $NAMESPACE apply -f -

# Wait until pods are started
wait_for_all_pods $NAMESPACE