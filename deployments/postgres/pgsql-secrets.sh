#root password
kubectl create secret generic postgres-db-secret --from-literal=POSTGRES_USER=demo --from-literal=POSTGRES_PASSWORD=omed