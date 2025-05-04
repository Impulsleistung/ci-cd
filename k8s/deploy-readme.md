# Deployment Instructions

## Prerequisites

-   kubectl installed and configured to connect to your Civo Kubernetes cluster.
-   The KUBECONFIG environment variable must be set correctly.

## Deployment Steps

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/Impulsleistung/k8s.git
    cd k8s
    ```

2.  **Run the deployment script:**

    ```bash
    chmod +x deploy.sh
    ./deploy.sh
    ```

    This script will:

    *   Apply the namespace manifests.
    *   Apply the deployment manifests.
    *   Apply the service manifests.
    *   Apply the ingress manifest.
    *   Wait for the Load Balancer IP to be assigned.
    *   Check if all deployments are ready.
    *   Print the URLs to access the applications.

## Accessing the Applications

Once the script completes successfully, you can access the applications using the following URLs in your web browser:

*   Static Website: `http://74.220.28.127/` (Port 8081)
*   Gradio Text Converter: `http://74.220.28.127/app2` (Port 8082)
*   Docker Firefox: `http://74.220.28.127/app3` (Port 8084)
*   Sonar App: `http://74.220.28.127/app4` (Port 8085)

Replace `<LOAD_BALANCER_IP>` with the actual IP address output by the deployment script.

## Troubleshooting

*   If the deployments fail to become ready, check the pod logs for errors:

    ```bash
    kubectl get pods -n <namespace>
    kubectl logs <pod-name> -n <namespace>
    ```

*   If the Load Balancer IP is not assigned, ensure that the Ingress resource is correctly configured and that the Civo Load Balancer is functioning properly.
