#!/bin/bash

kubectl apply -f k8s/app/myvideo-configmap.yaml
kubectl apply -f k8s/app/myvideo-secret.yaml

kubectl apply -f k8s/app/myvideo-deployment.yaml
kubectl apply -f k8s/app/myvideo-hpa.yaml
kubectl apply -f k8s/app/myvideo-svc.yaml
