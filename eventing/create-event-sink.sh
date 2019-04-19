#!/bin/bash 

set -eu

source "../setEnv.sh"

echo $TUTORIAL_HOME

DESTINATION_IMAGE_NAME='quay.io/rhdevelopers/knative-tutorial-greeter:quarkus'

yq w "$TUTORIAL_HOME/06-eventing/knative/service.yaml" \
  spec.runLatest.configuration.revisionTemplate.spec.container.image $DESTINATION_IMAGE_NAME | \
  kubectl apply -n $NAMESPACE -f -

# Wait until pods are started
wait_for_all_pods $NAMESPACE
