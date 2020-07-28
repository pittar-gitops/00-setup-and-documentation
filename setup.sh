#!/bin/bash

LANG=C
SLEEP_SECONDS=45

echo ""
echo "Installing Argo CD Operator."

oc apply -k argocd-operator/overlays/default

<<<<<<< HEAD
echo "Pause $SLEEP_SECONDS seconds for the creation and approval of the InstallPlan."
sleep $SLEEP_SECONDS
=======
echo "Pause 30 seconds for the creation and approval of the InstallPlan."
sleep 30
>>>>>>> 44d726fecb26be4da32e351e040fa9590c9026b9

oc rollout status deploy/argocd-operator -n argocd

echo "Listing Argo CD CRDs."
oc get crd | grep argo


echo "Deploying Argo CD instance"

oc apply -k argocd/overlays/default

echo "Waiting for Argo CD server to start..."

<<<<<<< HEAD
sleep $SLEEP_SECONDS
=======
sleep 30
>>>>>>> 44d726fecb26be4da32e351e040fa9590c9026b9

oc rollout status deploy/argocd-server -n argocd

echo "Argo CD ready!"
