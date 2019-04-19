#!/bin/bash

kail -l serving.knative.dev/configuration=event-greeter -c user-container --since=2h
