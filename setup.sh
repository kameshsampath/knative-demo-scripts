#!/bin/bash

set -eu

if [ ! -d knative-tutorial ];
then 
 git clone -b release/0.4 https://github.com/redhat-developer-demos/knative-tutorial 
fi

# set the workspace for the demo
! kubectl create ns knativetutorial
kubens knativetutorial

