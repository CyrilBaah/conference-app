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

## Reference

For more information and inspiration, you may refer to the [From Monolith to Kubernetes](https://github.com/salaboy/from-monolith-to-k8s) project by [salaboy](https://github.com/salaboy).
