echo http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
kubectl -n kubernetes-dashboard describe secret dashboard-admin
kubectl proxy
