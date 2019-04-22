#!/bin/bash

set -eu 

source "../setEnv.sh"
source "./buildEnv.sh"


yq w -i "$TUTORIAL_HOME/05-build/knative/container-registry-secret.yaml" 'metadata.annotations.[build.knative.dev/docker-0]' $REGISTRY_URL && \
yq w -i "$TUTORIAL_HOME/05-build/knative/container-registry-secret.yaml" stringData.username $REGISTRY_USERNAME && \
yq w -i "$TUTORIAL_HOME/05-build/knative/container-registry-secret.yaml" stringData.password $REGISTRY_PASSWORD


yq w -i "$TUTORIAL_HOME/05-build/knative/event-greeter-build.yaml" 'spec.steps[0].env[0].value' "/workspace/$CONTEXT_DIR" && \
yq w -i "$TUTORIAL_HOME/05-build/knative/event-greeter-build.yaml" 'spec.steps[0].workingDir' "/workspace/$CONTEXT_DIR" && \
yq w -i "$TUTORIAL_HOME/05-build/knative/event-greeter-build.yaml" 'spec.source.git.url' $SOURCE_REPO_URL && \
yq w -i "$TUTORIAL_HOME/05-build/knative/event-greeter-build.yaml" 'spec.source.git.revision' $SOURCE_REVISION && \
yq w -i "$TUTORIAL_HOME/05-build/knative/event-greeter-build.yaml" 'spec.steps[0].env[1].value' $DESTINATION_IMAGE_NAME


yq w -i "$TUTORIAL_HOME/05-build/knative/service.yaml" 'spec.runLatest.configuration.revisionTemplate.spec.container.image' $DESTINATION_IMAGE_NAME


kubectl apply -n $NAMESPACE -f "$TUTORIAL_HOME/05-build/knative/container-registry-secret.yaml" && \
kubectl apply -n $NAMESPACE -f "$TUTORIAL_HOME/05-build/knative/build-sa.yaml" && \
kubectl apply -n $NAMESPACE -f "$TUTORIAL_HOME/05-build/knative/m2-pvc.yaml"  && \
kubectl apply -n $NAMESPACE -f "$TUTORIAL_HOME/05-build/knative/container-storage-pvc.yaml"  && \
kubectl apply -n $NAMESPACE -f "$TUTORIAL_HOME/05-build/knative/event-greeter-build.yaml"