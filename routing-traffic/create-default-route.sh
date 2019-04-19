#!/bin/bash 

set -eu

source "../setEnv.sh"

echo $TUTORIAL_HOME

kubectl -n $NAMESPACE apply -f "$TUTORIAL_HOME/03-configs-and-routes/route/route_default.yaml"
