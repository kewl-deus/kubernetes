echo "[Upgrade 1.16] Install kubeadm"
yum upgrade -y kubeadm-1.16.3 >/dev/null 2>&1

echo "[Upgrade 1.16] Print version"
kubeadm version

if [[ $(hostname) =~ .*master.* ]]
then
  echo "[Upgrade 1.16] Show plan"
  kubeadm upgrade plan
fi

echo "[Upgrade 1.16] Apply upgrade"
if [[ $(hostname) =~ .*master.* ]]
then
  kubeadm upgrade apply v1.16.3 -y >/dev/null 2>&1
fi
#worker node
if [[ $(hostname) =~ .*worker.* ]]
then
  kubeadm upgrade node >/dev/null 2>&1
fi

echo "[Upgrade 1.16] Install kubelet"
yum upgrade -y kubelet-1.16.3 kubectl-1.16.3 >/dev/null 2>&1

echo "[Upgrade 1.16] Restart kubelet"
systemctl daemon-reload >/dev/null 2>&1
systemctl restart kubelet >/dev/null 2>&1
systemctl status kubelet
