#!/bin/bash 

set -eu

source "../setEnv.sh"

kubectl apply -n $NAMESPACE -f $TUTORIAL_HOME/04-scaling/knative/autoscaling-configmap.yaml