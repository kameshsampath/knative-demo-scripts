#!/bin/bash

set -eu

! kubectl -n $NAMESPACE delete services.serving.knative.dev greeter

! kubectl -n knativetutorial delete configurations.serving.knative.dev greeter
! kubectl -n knativetutorial delete routes.serving.knative.dev greeter