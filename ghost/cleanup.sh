#!/usr/bin/env bash -x

kubectl delete -f ghost.yml
kubectl delete -f ghost-volume-claim..yml
kubectl delete -f local-volume-ghost.yml