#!/bin/bash

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

source "../setEnv.sh"

kubectl get rev -n $NAMESPACE -l serving.knative.dev/service=greeter --sort-by=.metadata.creationTimestamp -ocustom-columns-file="$DIR/revision-listing.txt"