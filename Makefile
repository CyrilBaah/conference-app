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

cluster-info:
	@echo "Get cluster information..."
	kubectl cluster-info --context kind-$(CLUSTER_NAME)

get-nodes:
	@echo "Get cluster nodes..."
	kubectl get nodes -owide


help:
	@echo "Available targets:"
	@echo "  create-cluster - Create the Kind cluster"
	@echo "  get-cluster    - List available Kind clusters"
	@echo "  set-context    - Set kubectl context to the Kind cluster"
	@echo "  delete-cluster - Delete the Kind cluster"
	@echo "  help           - Display this help message"

.DEFAULT_GOAL := help
