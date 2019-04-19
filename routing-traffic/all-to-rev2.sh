#!/bin/bash 

set -eu

source "../setEnv.sh"

echo $TUTORIAL_HOME

REVISION_1=`kubectl -n $NAMESPACE get rev -l serving.knative.dev/configuration=greeter --sort-by="{.metadata.creationTimestamp}" | awk 'NR==2{print $1}'`
REVISION_2=`kubectl -n $NAMESPACE get rev -l serving.knative.dev/configuration=greeter --sort-by="{.metadata.creationTimestamp}" | awk 'NR==3{print $1}'`

cat "$TUTORIAL_HOME/03-configs-and-routes/route/route_all_to_revision.yaml" | yq w - 'spec.traffic[0].revisionName' $REVISION_2 | kubectl apply -n $NAMESPACE -f -
