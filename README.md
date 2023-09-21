# Conference App

A Kubernetes Project Using Helm and Kind

## Prerequisites

Before you begin, ensure you have met the following requirements:

- [Docker](https://www.docker.com/) installed and running.
- [Kind](https://kind.sigs.k8s.io/docs/user/quick-start/) installed.
- [kubectl](https://kubernetes.io/docs/tasks/tools/) installed.
- [Helm](https://helm.sh/docs/intro/install/) installed.

## Setting up

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/CyrilBaah/conference-app.git
   cd conference-app
   ```
2. Run
    ```bash
    make create-cluster
    ```

3. Install NGINX Ingress Controller
    ```bash
    make install-nginxingresscontroller 
    ```

## Installing the Application using Helm
1. Run
    ```bash
    helm repo add fmtok8s https://salaboy.github.io/helm/
    helm repo update
    ```

2. Run: 
    ```bash
    helm install conference fmtok8s/fmtok8s-conference-chart
    ```

# Argo Rollout Installation | [Argo Rollout Docs](https://argoproj.github.io/argo-rollouts/installation/#controller-installation) 
1. Create namespace for argo-rollout
    ```
    kubectl create namespace argo-rollouts
    kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
    ```

2. Configure ingress-nginx
    ```
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
    ```

3. Install Plugin
    ```
    brew install argoproj/tap/kubectl-argo-rollouts
    ```
4. Displa dashboard
    ```
    kubectl argo rollouts dashboard
    ```
5. Open | http://localhost:3100/rollouts/default
## Reference

For more information and inspiration, you may refer to the [From Monolith to Kubernetes](https://github.com/salaboy/from-monolith-to-k8s) project by [salaboy](https://github.com/salaboy).
