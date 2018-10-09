#!/usr/bin/env bash -x

#enabling metrics-server, required to do scaling in minikube
minikube addons enable metrics-server

#launching ghost application
kubectl apply -f local-volume-ghost.yml
kubectl apply -f ghost-volume-claim.yml
kubectl apply -f ghost.yml

#set up a target average cpu utilization for all pods in the deployment
kubectl autoscale deployment ghost-deployment --cpu-percent=50 --min=1 --max=5
