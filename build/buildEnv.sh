#!/bin/bash

# The Container Registry User Id
REGISTRY_USERNAME="${DOCKERHUB_USERNAME}"
# The Container Registry User Password
REGISTRY_PASSWORD="${DOCKERHUB_PASSWORD}"
# The Container Registry URL, defaults to https://index.docker.io
REGISTRY_URL='https://index.docker.io'

# The Source repository Git  URL default  https://github.com/redhat-developer-demos/knative-tutorial-greeter.git
SOURCE_REPO_URL=' https://github.com/redhat-developer-demos/knative-tutorial-greeter.git'
# The Source revision defaults to master
SOURCE_REVISION='master'
# The Context directory within sources repository which will be used during build
CONTEXT_DIR='java/quarkus'
# The fully qualified image name e.g. docker.io/foo/bar:v1.0
DESTINATION_IMAGE_NAME='docker.io/kameshsampath/gids2019-greeter'