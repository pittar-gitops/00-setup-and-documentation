#!/bin/bash

LANG=C
SLEEP_SECONDS=15

echo ""
echo "Installing OpenShift GitOps Operator."

oc apply -k https://github.com/redhat-canada-gitops/catalog/openshift-gitops-operator/overlays/stable-4.7

sleep $SLEEP_SECONDS

echo "Waiting for default Argo CD instance to complete rollout."

oc rollout status deploy/openshift-gitops-server -n openshift-gitops

echo "Patching default Argo CD instance to use an edge terminated route."

oc patch argocd openshift-gitops \
    -n openshift-gitops \
    --type=merge \
     -p='{"spec":{"server":{"insecure":true,"route":{"enabled":true,"tls":{"insecureEdgeTerminationPolicy":"Redirect","termination":"edge"}}}}}'

echo "Creating the default "sealed secrets" namespace and the default secret."

oc apply -k sealed-secrets-namespace

echo "Printing default admin Argo CD password:"

oc get secret openshift-gitops-cluster \
    -n openshift-gitops \
    -o jsonpath='{.data.admin\.password}' | base64 -d

