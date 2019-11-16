#cat bootstrap-docker-private-reg.sh | lxc exec kworker1 bash

echo "[TASK Docker private registry] Add hostname"
cp /etc/hosts /etc/hosts.backup
echo '10.25.192.118 docker.local' >> /etc/hosts
cat /etc/hosts

echo "[TASK  Docker private registry] Add insecure-registry to daemon.json"
echo "
{
  \"insecure-registries\" : [\"docker.local\"]
}
" >> /etc/docker/daemon.json

echo "[TASK  Docker private registry] Docker daemon reload"
systemctl reload docker >/dev/null 2>&1
