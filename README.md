Grafana Dashboards
- node exporter = 1860
- cadvisor = 14282
- postgres and mongo based on https://github.com/percona/grafana-dashboards/tree/main/dashboards
- redis based on https://github.com/oliver006/redis_exporter/tree/master/contrib

TODO
- rabbitmq https://github.com/rabbitmq/rabbitmq-server/tree/main/deps/rabbitmq_prometheus/docker

Quick Start

```bash
# git submodule status
docker network create monitoring-network
docker compose up -d
```
