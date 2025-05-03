#!/bin/bash

# Apply namespaces
kubectl apply -f namespaces/aaa-ns.yml
kubectl apply -f namespaces/bbb-ns.yml
kubectl apply -f namespaces/ddd-ns.yml
kubectl apply -f namespaces/eee-ns.yml

# Apply deployments
kubectl apply -f deployments/aaa-deployment.yml
kubectl apply -f deployments/bbb-deployment.yml
kubectl apply -f deployments/ddd-deployment.yml
kubectl apply -f deployments/eee-deployment.yml

# Apply services
kubectl apply -f services/aaa-service.yml
kubectl apply -f services/bbb-service.yml
kubectl apply -f services/ddd-service.yml
kubectl apply -f services/eee-service.yml

# Apply ingress
kubectl apply -f ingress.yml
kubectl apply -f ingress.yml

# Define Load Balancer IP
LOAD_BALANCER_IP="74.220.28.127"

echo "Load Balancer IP: $LOAD_BALANCER_IP"

# Check if deployments are ready
deployments=(aaa-deployment bbb-deployment ddd-deployment eee-deployment)
for deployment in "${deployments[@]}"; do
    kubectl rollout status deployment/$deployment -n ${deployment%-deployment}-ns --timeout=60s
    if [ $? -ne 0 ]; then
        echo "Deployment $deployment failed to become ready."
        exit 1
    fi
done

echo "All deployments are ready."
echo "Applications deployed successfully!"
echo " "
echo "Access the applications via:"
echo "http://$LOAD_BALANCER_IP"
echo "http://$LOAD_BALANCER_IP/k2"
echo "http://$LOAD_BALANCER_IP/k3"
echo "http://$LOAD_BALANCER_IP/k4"
