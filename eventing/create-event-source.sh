#!/bin/bash 

set -eu

source "../setEnv.sh"

yq w "$TUTORIAL_HOME/06-eventing/knative/event-source-svc.yaml" \
  spec.data '{"message": "Thank you for attending my Knative Session at GIDS 2019"}' | \
  kubectl apply -n $NAMESPACE -f -

# Wait until pods are started
wait_for_all_pods $NAMESPACE
