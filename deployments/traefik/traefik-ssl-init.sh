openssl req -newkey rsa:2048 -nodes -keyout tls.key -x509 -days 365 -out tls.crt

kubectl create secret generic traefik-cert --from-file=tls.crt --from-file=tls.key -n traefik-ingress

kubectl create configmap traefik-conf --from-file=traefik.toml -n traefik-ingress