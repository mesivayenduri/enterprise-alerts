# enterprise-alerts
Alerts using prometheus

In this project, we are using Prometheus-operator to show alerts to specified mail IDs and teams channel.

## Prometheus-Operator
The Prometheus Operator provides Kubernetes native deployment and management of Prometheus and related monitoring components. It simplifies prometheus monitoring.

**Prometheus-Operator Setup**: </br>
  Use the below commands to install
Promethues Operator in your namespace,

Get latest from this command: </br>
curl -s https://api.github.com/repos/prometheus-operator/prometheus-operator/releases/latest | jq -cr .tag_name)

Use latest version here:</br>
curl -sL https://github.com/prometheus-operator/prometheus-operator/releases/download/${LATEST}/bundle.yaml | kubectl create -n {namespace} -f -

The above command will install required Custom Resource Definitions (CRDs) and it will pick the target application services with labels.

## Project Setup
1. Install Helm after prometheus operator
2. Clone this repo
3. Run scripts in alertmanager and msteams folders.
4. Run Helm installation command
```
git clone <url>
cd enterprise-alerts
sh alertmanager/scripts.sh && sh msteams/scripts.sh
helm install prometheus ./ --values=./dev/values.yaml
```

## Working

The alerting mechanism works like this:

Target Applications -> servicemonitor -> prometheus -> alertmanager -> prometheus-msteams 

**ServiceMonitor**: </br>
  It has the labels from which we should
select the target application services

**Prometheus**:</br>
  Prometheus is used for monitoring. In this project, we have set some alerts in prometheus
with prometheus_rules.yaml file, prometheus will constantly check for these alerts and will fire alerts.

**AlertManager**:</br>
  Alertmanager will pick the alerts fired by prometheus and share it to mails and teams in the 
format mentioned in alertmanager.yaml configuration file here.

**Prometheus-msteams**:</br>
  Prometheus MSTeams is used to configure the required teams channel webhook and it will
provide template for alert panels shown in teams channel
