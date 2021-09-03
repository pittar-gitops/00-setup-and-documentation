#!/bin/bash

LANG=C
SLEEP_SECONDS=15

echo ""
echo "Installing OpenShift GitOps Operator."

oc apply -k https://github.com/redhat-cop/gitops-catalog/openshift-gitops-operator/overlays/stable?ref=main

sleep $SLEEP_SECONDS

echo "Waiting for default Argo CD instance to complete rollout."

oc rollout status deploy/openshift-gitops-server -n openshift-gitops

echo "Patching default Argo CD instance to use an edge terminated route and resource customizations."

oc patch argocd openshift-gitops -n openshift-gitops \
    --type='merge' \
    --patch "$(cat argocd-patch.yaml)"

echo "Printing default admin Argo CD password:"

oc get secret openshift-gitops-cluster \
    -n openshift-gitops \
    -o jsonpath='{.data.admin\.password}' | base64 -d

