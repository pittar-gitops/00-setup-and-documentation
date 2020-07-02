#!/bin/bash

LANG=C

echo ""
echo "Installing Argo CD Operator."

oc apply -k argocd-operator/overlays/default

echo "Pause 30 seconds for the creation and approval of the InstallPlan."
sleep 30

oc rollout status deploy/argocd-operator -n argocd

echo "Listing Argo CD CRDs."
oc get crd | grep argo


echo "Deploying Argo CD instance"

oc apply -k argocd/overlays/default

echo "Waiting for Argo CD server to start..."

sleep 30

oc rollout status deploy/argocd-server -n argocd

echo "Argo CD ready!"
