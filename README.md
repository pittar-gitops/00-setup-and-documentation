# GitOps Working Example for Admins and Development Team Tenants

## Intro

This GitHub organization, [pittar-gitops](https://github.com/pittar-gitops/), contains a small-scale multi-repository example of using GitOps (and Argo CD in particular) to:

* Setup a new cluster with OpenShift GitOps / Argo CD
* Bootstrap the cluster with common configuration and cluster services (e.g. operators)
* Deploy a "developer" instance of Argo CD for application lifecycle management
* Create "tenant" namespaces and assign them to the "developer" Argo CD instance to be managed
* Deploy application environments - inclucing CI/CD pipelines - using tenant GitOps repositories.

This demo uses [Bitnami Sealed Secrets](https://github.com/bitnami-labs/sealed-secrets) to safely store k8s Secrets in git repositories.  Due to the fact that you obviously can't commit your Sealed Secrets certificate secret to git, this demo is not a "general purpose" demo that anyone can deploy.  I may update this demo in the future to remove the use of Sealed Secrets, however, for not I feel it's more important to show at least one way to safely manage Secrets in a GitOps workflow. 

## Process and Repository Descriptions

The following describes the process to take a new (empty) cluster and fully configure it, as well as build and deploy the tenant environments and applications.

The steps involved in configuring the cluster are broken into a number of repositories - each to be managed by a different team or "tenant".  These are:

* Initial Cluster Configuration
* Cluster-wide Configuration
* Tenant: DevOpos Tooling
* Tenant: PetClinic Project Team
* Tenant: Contoso University Project Team
* Tenant: Game of Life Project Team
* Tenant: Harry Potter Magic Projec Team



### 2. Cluster Configuration and Tenant Management

Now that the cluster-scoped Argo CD instance is ready, it's time to load the cluster up!

For the sake of simplicity, I have included all "cluster admin" configuration in a single "mono-repo".  This could be broken up into multiple repositories if desired.

### 3. Tenant: Common tools

### 4. Tenant: .Net - Contoso Development Team

### 5. Tenant: Java / Quarkus - Game of Life Development Team

### 6. Tenant: Java / SpringBoot - Pet Clinic Development Team
