#!/bin/bash

oc delete --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.notags.yaml
oc delete --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
oc delete --filename https://raw.githubusercontent.com/openshift-pipelines/pipelines-as-code/stable/release.k8s.yaml
