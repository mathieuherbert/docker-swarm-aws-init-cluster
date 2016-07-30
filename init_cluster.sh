#!/bin/bash

echo "Create Master"
docker-machine create --driver amazonec2 --amazonec2-instance-type t2.medium swarm-master
echo "Create Node 1"
docker-machine create --driver amazonec2 --amazonec2-instance-type t2.medium swarm-node-1
echo "Create Node 2"
docker-machine create --driver amazonec2 --amazonec2-instance-type t2.medium swarm-node-2

echo "Initiate Cluster"
docker-machine ssh swarm-master sudo docker swarm init --advertise-addr eth0:2377
echo "Get Token"
SWARM_TOKEN=$(docker-machine ssh swarm-master sudo docker swarm join-token worker -q)
echo "Node 1 join cluster"
docker-machine ssh swarm-node-1 sudo docker swarm join --token $SWARM_TOKEN --listen-addr `docker-machine ip swarm-node-1`:2377 `docker-machine ip swarm-master`:2377
echo "Node 2 join cluster"
docker-machine ssh swarm-node-2 sudo docker swarm join --token $SWARM_TOKEN --listen-addr `docker-machine ip swarm-node-2`:2377 `docker-machine ip swarm-master`:2377
