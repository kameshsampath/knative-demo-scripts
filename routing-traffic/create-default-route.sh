#!/bin/bash 

set -eu

source "../setEnv.sh"

kubectl -n $NAMESPACE apply -f "$TUTORIAL_HOME/03-configs-and-routes/route/route_default.yaml"
