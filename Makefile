init:
	-docker network create monitoring-network
	git submodule init
	git submodule update

run: init
	docker compose up -d
