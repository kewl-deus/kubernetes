
#root passwor
kubectl create secret generic mysql-root-pass --from-literal=password=admin

#username + password
kubectl create secret generic mysql-user-pass --from-literal=username=demo --from-literal=password=omed

#url for database named 'mydb' and mysql service 'mysql-db'
kubectl create secret generic mysql-db-url --from-literal=database=mydb --from-literal=url='jdbc:mysql://mysql-db:3306/polls?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false'

echo -n 'jdbc:mysql://mysql-db:3306/polls?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false' | base64

amRiYzpteXNxbDovL215c3FsLWRiOjMzMDYvcG9sbHM/dXNlU1NMPWZhbHNlJnNlcnZlclRpbWV6b25lPVVUQyZ1c2VMZWdhY3lEYXRldGltZUNvZGU9ZmFsc2U=