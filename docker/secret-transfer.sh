kubectl get secret docker-local-registry-creds --namespace=default --export -o yaml |\
   kubectl apply --namespace=$1 -f -