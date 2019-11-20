kubectl patch statefulset nexus -p '{"spec":{"updateStrategy":{"type":"RollingUpdate"}}}' -n devtools

kubectl patch statefulset nexus --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/image", "value":"docker.local/nexus-repository-helm:3.15.2"}]'

kubectl patch statefulset nexus --type='json' -p='[{"op": "replace", "path": "/spec/template/spec/containers/0/image", "value":"docker.local/nexus-repository-helm:3.15.2"}]'
