#!/bin/bash

source ./setEnv.sh

while true
do
kubectl -n knative-serving get virtualservice -l serving.knative.dev/route=greeter -o yaml | yq r - 'items[0].spec.http[0].route[0].destination.host'
sleep .5
done