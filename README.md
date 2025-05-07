# enterprise-alerts
Alerts using prometheus

In this project, we are using Prometheus-operator to show alerts to specified mail IDs and teams channel.

## Prometheus-Operator
The Prometheus Operator provides Kubernetes native deployment and management of Prometheus and related monitoring components. It simplifies prometheus monitoring

**Prometheus-Operator Setup**
Use the below commands to install Promethues Operator in your namespace,

LATEST=$(curl -s https://api.github.com/repos/prometheus-operator/prometheus-operator/releases/latest | jq -cr .tag_name)
curl -sL https://github.com/prometheus-operator/prometheus-operator/releases/download/${LATEST}/bundle.yaml | kubectl create -n {namespace} -f -

The above command will install required Custom Resource Definitions (CRDs) and it will pick the target application services with labels.

## Project Setup
Apply all the kubernetes files with kubectl command, and run script.sh files in directories with those files instead of applying the files directly.

## Working

The alerting mechanism works like this:

Target Applications -> servicemonitor -> prometheus -> alertmanager -> prometheus-msteams 

ServiceMonitor:
  It has the labels from which we should select the target application services

Prometheus:
  Prometheus is used for monitoring. In this project, we have set some alerts in prometheus
with prometheus_rules.yaml file, prometheus will constantly check for these alerts and will fire alerts.

AlertManager:
  Alertmanager will pick the alerts fired by prometheus and share it to mails and teams in the 
format mentioned in alertmanager.yaml configuration file here.

Prometheus-msteams:
  Prometheus MSTeams is used to configure the required teams channel webhook and it will
provide template for alert panels shown in teams channel