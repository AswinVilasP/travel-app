#!/bin/bash

# Get current date and time in a readable format
TAG=$(date +'%d-%m-%Y-%H-%M')

# Tag the docker image
docker tag django:latest aswinvilasp/travel-app:$TAG

# Output the generated tag
echo "Generated Docker tag: $TAG"
docker image ls

# # pushing docker images to remote docker registry
echo "Pushing docker images to docker hub"

docker push aswinvilasp/travel-app:$TAG