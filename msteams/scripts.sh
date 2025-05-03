#!/bin/bash

base64 card.tmpl | tr -d \\n | sed "1s|^|    |" > base64.txt
cat ./msteams-card-config.yaml ./base64.txt | kubectl apply -n development -f -

kubectl apply -n development -f ./msteams-config.yaml

kubectl apply -n development -f ./prometheus-msteams.yaml
