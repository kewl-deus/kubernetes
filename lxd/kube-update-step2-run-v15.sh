# find the latest 1.15 version in the list
#yum list --showduplicates kubeadm --disableexcludes=kubernetes

echo "[Upgrade 1.15] Install kubeadm"
yum upgrade -y kubeadm-1.15.6

echo "[Upgrade 1.15] Print version"
kubeadm version

if [[ $(hostname) =~ .*master.* ]]
then
  echo "[Upgrade 1.15] Show plan"
  kubeadm upgrade plan
fi

echo "[Upgrade 1.15] Apply upgrade"
#master node
if [[ $(hostname) =~ .*master.* ]]
then
  echo "[Upgrade 1.15] Upgrading Master"
  kubeadm upgrade apply v1.15.6 -y
fi
#worker node
if [[ $(hostname) =~ .*worker.* ]]
then
  echo "[Upgrade 1.15] Upgrading Worker"
  kubeadm upgrade node
fi

echo "[Upgrade 1.15] Install kubelet"
yum upgrade -y kubelet-1.15.6 kubectl-1.15.6

echo "[Upgrade 1.15] Restart kubelet"
systemctl daemon-reload
systemctl restart kubelet
systemctl status kubelet

