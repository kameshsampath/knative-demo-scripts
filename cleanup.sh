#!/bin/bash

set -eu

! kubectl -n $NAMESPACE delete services.serving.knative.dev greeter 2> /dev/null

! kubectl -n $NAMESPACE delete configurations.serving.knative.dev greeter 2> /dev/null
! kubectl -n $NAMESPACE delete routes.serving.knative.dev greeter 2> /dev/null

! kubectl -n $NAMESPACE delete services.serving.knative.dev event-greeter 2> /dev/null
! kubectl -n $NAMESPACE delete \
 cronjobsources.sources.eventing.knative.dev  event-greeter-cronjob-source 2> /dev/null

! kubectl -n $NAMESPACE delete services.serving.knative.dev event-greeter 2> /dev/null
! kubectl -n $NAMESPACE delete builds.build.knative.dev event-greeter-build 2> /dev/null