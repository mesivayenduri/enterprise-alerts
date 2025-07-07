#!/bin/bash

kubectl create secret generic alertmanager-development --from-file=./alertmanager.yaml -n development -o yaml --save-config | kubectl apply -n development -f -
