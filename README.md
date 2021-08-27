# OpenShift GitOps / Argo CD

There are only a few things to do "manually" to seed your cluster to be bootstrapped using OpenShift GitOps (Argo CD).

## Install the OpenShift GitOps Operator

You can install the OpenShift GitOps operator manually through the OpenShift UI, or, you can user `oc` or `kubectl` to install it:

```
$ oc apply -k https://github.com/redhat-canada-gitops/catalog/openshift-gitops-operator/overlays/stable-4.7
```

*Optional:* If you would like an edge-terminated route for the default instance of Argo CD, run the following command:

```
$ oc patch argocd openshift-gitops \
    -n openshift-gitops \
    --type=merge \
    -p='{"spec":{"server":{"insecure":true,"route":{"enabled":true,"tls":{"insecureEdgeTerminationPolicy":"Redirect","termination":"edge"}}}}}'
```

And get the default admin user password:

```
$ oc get secret openshift-gitops-cluster \
    -n openshift-gitops \
    -o jsonpath='{.data.admin\.password}' | base64 -d
```

## Sealed Secrets

In my clusters I use Bitnami Sealed Secrets to securely store Kubernetes `Secrets` in git.  Since my secrets are already encrypted in my repositories, I need to seed my cluster with the expected secret.  Of course, this can't be stored in git!  I have this known secret stored on my local machine, and I seed it into an empty cluster with:

```
$ oc apply -k sealed-secrets-namespace
```

