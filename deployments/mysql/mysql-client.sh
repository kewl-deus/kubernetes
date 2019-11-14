#client pod
kubectl run -it --rm --image=mysql:5.6 --restart=Never mysql-client -- mysql -h mysql -ppassword

#access via nodeport service: user=root, password=password, port=30306 (nodeport)
mysql -h kworker1 -P30306 -uroot -ppassword
