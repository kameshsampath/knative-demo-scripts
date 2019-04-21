#!/bin/bash

kubectl port-forward --namespace knative-monitoring \
  $(kubectl get pods --namespace knative-monitoring --selector=app=grafana  --output=jsonpath="{.items..metadata.name}") 3000 &

sleep 3

open http://localhost:3000

