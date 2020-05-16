#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=docker.io/roysrus1/app:v2

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment app1 --image=$dockerpath

# Step 3:
# List kubernetes pods

kubectl get pods

# Step 4:
# Forward the container port to a host

kubectl expose deployment app1 --type=LoadBalancer --port=8000 --target-port=80
minikube service app1

kubectl describe service app1