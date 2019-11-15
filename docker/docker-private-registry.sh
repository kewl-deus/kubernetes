kubectl create secret generic docker-local-registry-creds \
    --from-file=.dockerconfigjson=~/.docker/config.json \
    --type=kubernetes.io/dockerconfigjson


#kubectl create secret docker-registry docker-local-registry-creds --docker-server=<your-registry-server> --docker-username=<your-name> --docker-password=<your-pword> --docker-email=<your-email>

kubectl get secret docker-local-registry-creds --output="jsonpath={.data.\.dockerconfigjson}" | base64 --decode