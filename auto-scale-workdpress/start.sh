#!/usr/bin/env bash -x

#enabling metrics-server, required to do scaling in minikube
minikube addons enable metrics-server

#launching wordpress application
kubectl apply -f local-volume-claim-wordpress.yml
kubectl apply -f mysql-deployment.yaml
kubectl apply -f wordpress-deployment.yaml

#set up a target average cpu utilization for all pods in the deployment
kubectl autoscale deployment wordpress --cpu-percent=50 --min=1 --max=5
