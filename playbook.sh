## Deployments ##
#TODO BlueGreen
#TODO Canary

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
