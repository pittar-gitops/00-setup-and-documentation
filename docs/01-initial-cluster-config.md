# 1. Setup: Deploy and Configure OpenShift GitOps Operator

A new OpenShift cluster does not have GitOps tooling installed by default - you have to install the OpenShift GitOps operator to deploy this functionality.  In order to install this operator and apply some custom configuration (edge-terminated TLS for the route, custom resource configuration for Argo CD), do the following:

1. Login to your cluster with `oc` as a *cluster-admin*
2. Run `./setup.sh`

After a few minutes, you will have an instance of Argo CD in the new `openshift-gitops` namespace.  This is a special instance of Argo CD that is meant for Cluster Admins.  This instance of Argo CD will be used to configure the cluster, install more Operators, and create "tenant" namespaces.

This patch will also instruct OpenShift GitOps to use Dex in order to use OpenShift to authenticate users.

Next: 2. Cluster-wide configuration