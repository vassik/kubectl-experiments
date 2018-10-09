#!/usr/bin/env bash -x

kubectl delete -f local-volume-claim-wordpress.yml
kubectl delete -f mysql-deployment.yaml
kubectl delete -f wordpress-deployment.yaml