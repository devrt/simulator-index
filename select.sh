#!/bin/sh

IMAGE=`yq r /index.yaml 'indexes.*.image' | fzf --preview "yq r /index.yaml 'indexes.(image=={})'"`
echo "Updating docker-compose.yml to use ${IMAGE} simulation container..."
yq w -i /work/docker-compose.yml services.simulator.image $IMAGE
echo "done."
echo "Your simulation environment is ready."
echo "Please enter 'docker-compose up' to launch your environment."
