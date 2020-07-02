# Argo CD Setup

Install Argo CD Operator `0.0.8` from manifests.

# Setup (Script)

1. Login to your cluster with the `oc` cli with a user that has `cluster-admin` rights.
2. Run `./setup.sh`
3. Argo CD will be installed and integrated with OpenShift OAuth.

# Setup (Manual)

If you don't want to use the script, again as `cluster-admin`:
1. `oc apply -k argocd-operator/overlays/default`
2. Wait for operator to complete installation.
3. `oc apply -k argocd/overlays/default`
4. Wait for Argo CD instance to deploy.  Done!

# Sealed Secrets (optional)

To add the Sealed Secrets controller to your cluster.  This would have to be done for every cluster that uses Sealed Secrets.

`oc apply -k bootstrap`

This assumes you have you have a `sealed-secrets-secret.yaml` file in the `sealed-secrets` directory.  This file is in the `.gitignore` so that you don't commit it to your git repo accidentally.
