#!/bin/bash

set -eu

! kubectl -n $NAMESPACE delete services.serving.knative.dev greeter

! kubectl -n $NAMESPACE delete configurations.serving.knative.dev greeter
! kubectl -n $NAMESPACE delete routes.serving.knative.dev greeter

! kubectl -n $NAMESPACE delete services.serving.knative.dev event-greeter
! kubectl -n $NAMESPACE delete \
 cronjobsources.sources.eventing.knative.dev  event-greeter-cronjob-source