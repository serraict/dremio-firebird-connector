.phony : all
#
target/3rdparty:
	mkdir -p target/3rdparty
	./scripts/download_dependencies.sh 
build:
	mvn clean install
# Firebird
firebird:
	docker compose -f ./tests/firebird-docker-compose.yml up
stop_firebird:
	docker compose -f ./tests/firebird-docker-compose.yml down
# tests
setup_test: build target/3rdparty
	docker cp ./target/dremio-firebird-plugin*.jar dremio:/opt/dremio/jars/
	docker cp ./target/3rdparty/. dremio:/opt/dremio/jars/3rdparty/
	docker restart dremio
	