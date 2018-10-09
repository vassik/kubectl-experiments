#!/usr/bin/env bash -x

#
WP_URL=$(minikube service ghost-service --url)
echo "Service to stress: $WP_URL"
STRESS_CMD="while true; do wget -q -O- ${WP_URL}; done"
kubectl run load-generator -it --rm --restart=Never --image=busybox -- /bin/sh -c "$(echo $STRESS_CMD)"