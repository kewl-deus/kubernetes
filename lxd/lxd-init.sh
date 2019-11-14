#sudo apt install lxd
getent group lxd
sudo gpasswd -a $user -a lxd
id $user
newgrp lxd #or logout/login

sudo systemctl status lxd

sudo lxc init

lxc launch images:centos/7 kmaster --profile k8s-master
lxc launch images:centos/7 kworker1 --profile k8s-worker

lxc exec kmaster bash

cat bootstrap.kube.sh | lxc exec kmaster bash
cat bootstrap.kube.sh | lxc exec kworker1 bash
cat bootstrap.kube.sh | lxc exec kworker2 bash

cat nfs-client-init.sh | lxc exec kworker1 bash
cat nfs-client-init.sh | lxc exec kworker2 bash



sudo cp /var/snap/lxd/common/lxd/storage-pools/default/containers/kmaster/rootfs/root/.kube/config ~/.kube/k8s-lxd.config