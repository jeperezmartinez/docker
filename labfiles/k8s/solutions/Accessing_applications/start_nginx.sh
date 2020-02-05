#!/bin/bash

kubectl run nginx --image=nginx --replicas=2 --namespace=np-test
kubectl expose deployment nginx --port=80

