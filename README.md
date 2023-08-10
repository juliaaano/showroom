# SHOWROOM

Welcome to the showroom OpenShift application.

## Install

A basic install requires only applying the helm templates in your cluster.

```
helm template ./helm \
--set deployer.domain=apps.cluster-guid.sandbox.opentlc.com \
--set documentation.url=https://my-documentation.external.com | oc apply -f -
```

The same helm chart can lets OpenShift build and deploy the documentation from the source code.

For that, you must have Openshift Pipelines (Tekton) in your cluster. You may optionally install this way:

```
oc create -f ./openshift-pipelines.yaml
```

Now you're ready to install showroom by providing your own documentation source repository:

```
helm template ./helm \
--set deployer.domain=apps.cluster-guid.sandbox.opentlc.com \
--set documentation.repoUrl=https://github.com/tonykay/showroom-poc-2023-06 | oc apply -f -
```

## ArgoCD

It is possible to deploy the helm chart with ArgoCD. This repo provides an ArgoCD/Application for
your convenience.

```
oc create -f ./argocd/application.yaml
```

## Multi-user installation

The chart can be installed multiple times in one namespace per user. You control this in helm values.yaml.

An easy way to setup and manage a multi-user deployment is via the ArgoCD/ApplicationSet.

```
oc create -f ./argocd/applicatonset.yaml
```
