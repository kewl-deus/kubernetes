docker run -d --restart=unless-stopped -p 2080:80 -p 2443:443 -v /var/opt/kubernetes/rancher:/var/lib/rancher rancher/rancher:latest
