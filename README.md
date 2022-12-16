Grafana Dashboards
- node exporter = 1860
- cadvisor = 14282
- ~~mongo exporter = 7353~~ (not actual but saved as an option)
- mongo exporter - https://github.com/grafana/jsonnet-libs/blob/master/mongodb-mixin/dashboards/MongoDB_Instance.json
- postgres based on https://github.com/percona/grafana-dashboards/tree/main/dashboards
```bash
python2 ./percona-grafana-dashboards/misc/convert-dash-from-PMM.py ./percona-grafana-dashboards/dashboards/PostgreSQL/PostgreSQL_Instance_Summary.json
cp ./percona-grafana-dashboards/dashboards/PostgreSQL/PostgreSQL_Instance_Summary.json ./grafana/dashboards/default/PostgreSQL_Instance_Summary.json
# and manual added in panel-sections field "datasource": "$datasource"
```
- redis based on https://github.com/oliver006/redis_exporter/tree/master/contrib
- ~~rabbitmq full version from https://github.com/rabbitmq/rabbitmq-server/tree/main/deps/rabbitmq_prometheus/docker~~ (not actual but saved as an option)
- rabbitmq - https://github.com/grafana/jsonnet-libs/blob/master/rabbitmq-mixin/dashboards

TODO
- [ ] minio dashboard & exporter
- [ ] nats dashboard & exporter
- [ ] nginx dashboard & exporter

Quick Start

```bash
# 1
cp ./config.env.example ./config.env

# 2
# create special user for mongodb
# # mongo v5*
# docker-compose exec -T mongo mongosh --authenticationDatabase admin --eval='db.getSiblingDB("admin").createUser({user: "mongodb_exporter",pwd: "mongodb_exporter123",roles: [{ role: "clusterMonitor", db: "admin" },{ role: "read", db: "local" }]})'
# # mongo v4*
# docker-compose exec -T mongo mongo -u mongo -p mongo123 admin --eval='db.getSiblingDB("admin").createUser({user: "mongodb_exporter2",pwd: "mongodb_exporter123",roles: [{ role: "clusterMonitor", db: "admin" },{ role: "read", db: "foobar" }]})'

# 3
# configure the other fields in to ./config.env

# 4
make run
```

Develop

For auto-update dashboards

```bash
make build
```
