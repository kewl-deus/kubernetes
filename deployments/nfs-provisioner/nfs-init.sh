mkdir -p /var/opt/kubernetes/volumes
chown nobody:nogroup kubernetes/*
echo /var/opt/kubernetes/volumes 10.25.192.0/24(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure) >> /etc/exports

exportfs -rav
service nfs-kernel-server restart

#list exports
showmount -e localhost
#list clients
netstat -an |grep :2049