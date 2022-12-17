run:
	-docker network create monitoring-network
	docker compose --env-file ./config.env up -d

build:
	git submodule init
	git submodule update

	cp ./grafana-jsonnet-libs/rabbitmq-mixin/dashboards/* ./grafana/dashboards
	cp ./grafana-jsonnet-libs/mongodb-mixin/dashboards/MongoDB_Instance.json ./grafana/dashboards/mongodb.json
	cp ./redis-exporter/contrib/redis-mixin/dashboards/redis-overview.json ./grafana/dashboards/redis.json

	# cp ./rabbitmq-server/deps/rabbitmq_prometheus/docker/grafana/dashboards:/dashboards

	curl -o ./grafana/dashboards/cadvisor.json https://grafana.com/api/dashboards/14282/revisions/1/download
	curl -o ./grafana/dashboards/node_exporter.json https://grafana.com/api/dashboards/1860/revisions/29/download
	curl -o ./grafana/dashboards/minio.json https://grafana.com/api/dashboards/13502/revisions/19/download

destroy:
	docker compose --env-file ./config.env down
	docker volume prune --force
