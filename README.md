# SHOWROOM

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

# Installation

A basic installation requires only applying the helm templates in your cluster.

```
helm template ./helm \
--set deployer.domain=apps.cluster-guid.sandbox.opentlc.com \
--set documentation.url=https://my-documentation.external.com | oc apply -f -
```

This helm chart lets you provide the git repo details of where the documentation is located.

OpenShift will build and deploy the documentation from the source code.

For that, you must have Openshift Pipelines (Tekton) avaiable in your cluster. Install it on your own or use this command next for your convenience:

```
oc create -f ./openshift-pipelines.yaml
```

Now you're ready to install by providing your own documentation source repository:

```
helm template ./helm \
--set deployer.domain=apps.cluster-guid.sandbox.opentlc.com \
--set documentation.repoUrl=https://github.com/tonykay/showroom-poc-2023-06 | oc apply -f -
```

## ArgoCD

```
oc create -f ./argocd/applicaton.yaml
```
