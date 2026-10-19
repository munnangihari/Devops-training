#!/bin/bash
kubectl get pods -n hrms
kubectl get svc -n hrms
kubectl logs -n hrms $(kubectl get pods -n hrms -o jsonpath='{.items[0].metadata.name}')
