#!/bin/bash

set -eu

source "../setEnv.sh"

PIN_REVISION=`kubectl get rev -n $NAMESPACE -l serving.knative.dev/service=greeter -l serving.knative.dev/configurationGeneration=1 | awk 'NR==2{print $1}'`

cat "$TUTORIAL_HOME/02-basics/knative/service-pinned.yaml" | \
  sed 's~dev.local/rhdevelopers/greeter:0.0.1~quay.io/rhdevelopers/knative-tutorial-greeter:sb~g;' | \
  yq w - "spec.release.revisions[+]" $PIN_REVISION | \
  kubectl -n $NAMESPACE apply -f -

# Wait until pods are started
wait_for_all_pods $NAMESPACE