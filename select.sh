#!/bin/sh

IMAGE=`yq r /index.yaml 'indexes.*.image' | fzf --preview "yq r /index.yaml 'indexes.(image=={}).description'"`
yq w -i /work/docker-compose.yml services.simulator.image $IMAGE