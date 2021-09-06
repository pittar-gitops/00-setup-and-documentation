# OpenShift GitOps / Argo CD

There are only a few things to do "manually" to seed your cluster to be bootstrapped using OpenShift GitOps (Argo CD).

## TL;DR

1. Login to your cluster with `oc` as a *cluster-admin*
2. Run `./setup.sh`

## Install the OpenShift GitOps Operator: Step by Step

You can install the OpenShift GitOps operator manually through the OpenShift UI, or, you can user `oc` or `kubectl` to install it:

```
$ oc apply -k https://github.com/redhat-canada-gitops/catalog/openshift-gitops-operator/overlays/stable-4.7
```

*Optional:* If you would like an edge-terminated route for the default instance of Argo CD with resource customizations, run the following command:

```
oc patch argocd openshift-gitops \
    -n openshift-gitops \
    --type='merge' \
    --patch "$(cat argocd-patch.yaml)"
```

And get the default admin user password:

```
oc get secret openshift-gitops-cluster \
    -n openshift-gitops \
    -o jsonpath='{.data.admin\.password}' | base64 -d
```

After a few minutes, you will have an instance of Argo CD in the new `openshift-gitops` namespace.  This is a special instance of Argo CD that is meant for Cluster Admins.  For developer GitOps workflows it is recommended to install another instance of Argo CD in a different namespace (still using this operator).  However, if you would like to use the default Argo CD instance in `openshift-gitops` for developer workflows as well, that's fine too!
