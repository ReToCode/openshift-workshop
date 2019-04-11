## Deployments ##
# Base deployment
oc create -f web-app-base.yaml

# Show rolling & recreate

# Blue Green/Canary
oc set route-backends web-app web-app=100 web-app-2=0

while true; do curl http://web-app-myproject.127.0.0.1.nip.io && sleep 1; echo '\n'; done

oc set route-backends web-app web-app=70 web-app-2=30

# Jobs
oc create -f job-simple.yaml
oc create -f job-cron.yaml
# Then show console & pods

## Operator ##
oc new-project operator
oc project operator
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:operator:default
oc create -f etcd-operator.yaml

oc project myproject
oc create -f my-cluster.yaml

# Show status in terminal
etcdctl cluster-health

# Kill a pod, show that it is recreated

## Service Broker ##
# Add Hello World Database (APB) to myproject
# Add Hello World (APB) to myproject
# Create a route for hello world
# Show bind secrets
