# Download oc client
wget https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz
tar -xzf *.tgz
sudo mv oc kubectl /usr/bin

# Make sure docker is installed
# Add file
# /etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// --insecure-registry 172.30.0.0/16
systemctl daemons-reload
systemctl restart docker

# OC Cluster up
oc cluster up --routing-suffix=127.0.0.1.nip.io --public-hostname=127.0.0.1 --enable=service-catalog,router,registry,web-console,persistent-volumes,rhel-imagestreams,automation-service-broker

# More permissions :)
oc adm policy add-cluster-role-to-user cluster-admin developer

