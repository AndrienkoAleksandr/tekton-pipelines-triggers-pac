#!/bin/bash

echo "[INFO] Install Tekton pipelines controllers"
oc new-project tekton-pipelines
oc adm policy add-scc-to-user anyuid -z tekton-pipelines-controller
oc adm policy add-scc-to-user anyuid -z tekton-pipelines-webhook

oc apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.notags.yaml

echo "[INFO] Install Tekton trigger and interceptor controllers"
oc adm policy add-scc-to-user anyuid -z tekton-triggers-controller
oc adm policy add-scc-to-user anyuid -z tekton-triggers-core-interceptors
oc adm policy add-scc-to-user anyuid -z tekton-triggers-webhook

oc apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml
oc apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/interceptors.yaml

echo "[INFO] Install pipeline as code operator "
oc apply -f https://raw.githubusercontent.com/openshift-pipelines/pipelines-as-code/stable/release.k8s.yaml
echo "[INFO] Expose pipeline-as-code controller route"
oc expose service pipelines-as-code-controller -n pipelines-as-code
