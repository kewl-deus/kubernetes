#sudo apt install lxd
getent group lxd
sudo gpasswd -a $user -a lxd
id $user
newgrp lxd #or logout/login

sudo system status lxd

sudo lxd init

lxd launch images:centos/7 kmaster --profile k8s-master
lxd launch images:centos/7 kworker1 --profile k8s-worker

lxd exec kmaster bash

cat bootstrap.kube.sh | lxd exec kmaster bash



sudo cp /var/snap/lxd/common/lxd/storage-pools/default/containers/kmaster/rootfs/root/.kube/config ~/.kube/k8s-lxd.config