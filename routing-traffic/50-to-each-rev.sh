#!/bin/bash 

set -eu

source "../setEnv.sh"

REVISION_1=`kubectl -n $NAMESPACE get rev -l serving.knative.dev/configuration=greeter --sort-by="{.metadata.creationTimestamp}" | awk 'NR==2{print $1}'`
REVISION_2=`kubectl -n $NAMESPACE get rev -l serving.knative.dev/configuration=greeter --sort-by="{.metadata.creationTimestamp}" | awk 'NR==3{print $1}'`


cat "$TUTORIAL_HOME/03-configs-and-routes/route/route_rev1-50_rev2-50.yaml" | yq w - 'spec.traffic[0].revisionName' $REVISION_1 | yq w - 'spec.traffic[1].revisionName' $REVISION_2 |  kubectl apply -n knativetutorial -f -
