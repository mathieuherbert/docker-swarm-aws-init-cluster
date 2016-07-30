Create Swarm Cluster in AWS with Docker 1.12
===================

The script allows to initiate a swarm cluster in Amazon Web Services with Docker 1.12.
The script gives you at the end a cluster with one manager and two workers

Before
-------------
The following components have to be installed on the server and available in the PATH
```
Docker-engine : 1.12
Docker-machine : 0.8
```

You need to export theses variable to able docker-machine to launch ec2 instances
```
export AWS_ACCESS_KEY_ID={your access key id}
export AWS_SECRET_ACCESS_KEY= {your secret key}
export AWS_DEFAULT_REGION= { the default aws region, exemple eu-west-1}
```

You can also add theses variables in order to specify the VPC,  Security Group and AZ  to place your instances
```
export AWS_VPC_ID= {vpc-*}
export AWS_ZONE= {a or b or ...}
export AWS_SECURITY_GROUP= {sg-*}
```

Launch script
-------------

To launch the script :
```
bash init_cluster.sh
eval $(docker-machine env swarm-master);
```
Interact with your cluster
-------------
All docker commands are available, for example  :
```
docker node ls
docker service ls
```
Destroy the cluster
-------------
```
docker-machine rm swarm-master swarm-node-2 swarm-node-1 -y
```
