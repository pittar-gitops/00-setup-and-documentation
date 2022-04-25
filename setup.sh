#!/bin/bash

LANG=C
SLEEP_SECONDS=120

echo ""
echo "Installing OpenShift GitOps Operator."

oc apply -k https://github.com/redhat-cop/gitops-catalog/openshift-gitops-operator/overlays/gitops-1.5?ref=main

echo "Waiting $SLEEP_SECONDS for GitOps Operator to install."

sleep $SLEEP_SECONDS

echo "Waiting for default Argo CD instance to complete rollout."

oc rollout status deploy/openshift-gitops-server -n openshift-gitops

echo "Patching default Argo CD instance to use an edge terminated route and resource customizations."

oc patch argocd openshift-gitops -n openshift-gitops \
    --type='merge' \
    --patch "$(cat argocd-patch.yaml)"

echo "Done. Please wait for the Argo CD Operator to rollout the patch update."

