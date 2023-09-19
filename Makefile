CLUSTER_NAME := dev

.PHONY: create-cluster get-cluster set-context delete-cluster help

create-cluster:
	@echo "Creating Kind cluster..."
	kind create cluster --config config.yml --name $(CLUSTER_NAME)

get-cluster:
	@echo "Getting Kind clusters..."
	kind get clusters

set-context:
	@echo "Setting kubectl context to $(CLUSTER_NAME)..."
	kubectl config use-context kind-$(CLUSTER_NAME)

delete-cluster:
	@echo "Deleting Kind cluster..."
	kind delete cluster --name $(CLUSTER_NAME)

install-nginxingresscontroller:
	@echo "Install NGINX Ingress Controller..."
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml

get-nginxingress:
	@echo "Get nginxingress pods..."
	kubectl get pods -n ingress-nginx -owide

get-logs:
	@echo "Get pods for logs command..."
	@echo "$ kubectl logs -f <name-app-xxx>"

cluster-info:
	@echo "Get cluster information..."
	kubectl cluster-info --context kind-$(CLUSTER_NAME)

get-nodes:
	@echo "Get cluster nodes..."
	kubectl get nodes -owide

get-pods:
	@echo "Get cluster pods..."
	kubectl get pods -owide

expose-frontend:
	@echo "Get port for frontend..."
	kubectl port-forward svc/fmtok8s-frontend -n default 8080:80


help:
	@echo "Available targets:"
	@echo "  create-cluster   - Create the Kind cluster"
	@echo "  get-cluster      - List available Kind clusters"
	@echo "  set-context      - Set kubectl context to the Kind cluster"
	@echo "  delete-cluster   - Delete the Kind cluster"
	@echo "  get-pods         - List all pods"
	@echo "  get-nodes        - List all nodes"
	@echo "  expose-frontend  - Makes frontend app accessible"
	@echo "  get-nginxingress - List all nginx ingress"
	@echo "  get-logs         - Get logs command"
	@echo "  help             - Display this help message"


.DEFAULT_GOAL := help
