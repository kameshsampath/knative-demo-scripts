#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

export TUTORIAL_HOME=$DIR/knative-tutorial
export IP_ADDRESS="$(minikube ip):$(kubectl get svc istio-ingressgateway --namespace istio-system --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')"
export NAMESPACE='knativetutorial'

CMD=kubectl

# Loops until duration (car) is exceeded or command (cdr) returns success
function timeout() {
  SECONDS=0; TIMEOUT=$1; shift
  until eval $*; do
    sleep 5
    [[ $SECONDS -gt $TIMEOUT ]] && echo "ERROR: Timed out" && exit -1
  done
}

# Waits for all pods in the given namespace to complete successfully.
function wait_for_all_pods {
  timeout 300 "$CMD get pods -n $1 && [[ \$($CMD get pods -n $1 2>&1 | grep -c -v -E '(Running|Completed|Terminating|STATUS)') -eq 0 ]]"
}