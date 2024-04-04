.phony : all

VERSION := $(shell git describe --tags)

#
target/3rdparty:
	mkdir -p target/3rdparty
	./scripts/download_dependencies.sh 
build:
	@echo "Building version $(VERSION)..."
	mvn clean install -Drevision=$(VERSION)
release:
	@if [ -n "$$(git status --porcelain)" ]; then \
		echo "There are uncommitted changes or untracked files"; \
		exit 1; \
	fi
	@if [ "$$(git rev-parse --abbrev-ref HEAD)" != "master" ]; then \
		echo "Not on master branch"; \
		exit 1; \
	fi
	@if [ "$$(git rev-parse HEAD)" != "$$(git rev-parse origin/master)" ]; then \
		echo "Local branch is ahead of origin"; \
		exit 1; \
	fi
	@echo "Current version is $(VERSION)"
	@git push origin --tags
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
	