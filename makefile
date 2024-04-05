.phony : all

VERSION := $(shell git describe --tags)
ifeq ($(VERSION),)
    VERSION := 0.0.1
endif

# ----------------------------------------------
# CI
# ----------------------------------------------
package:
	mvn -B package -Drevision=$(VERSION) --file pom.xml
publish:
	mvn -B deploy -Drevision=$(VERSION) --file pom.xml

# ----------------------------------------------
# Local development
# ----------------------------------------------
assert_all_committed:
	@if [ -n "$$(git status --porcelain)" ]; then \
		echo "There are uncommitted changes or untracked files"; \
		exit 1; \
	fi

target/3rdparty:
	mkdir -p target/3rdparty
	./scripts/download_dependencies.sh 
build:
	@echo "Building version $(VERSION)..."
	mvn clean install -Drevision=$(VERSION)
release: assert_all_committed
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
	@docker network create serra-vine 2>/dev/null || true
	@docker compose -f ./tests/firebird-docker-compose.yml up
stop_firebird:
	@docker compose -f ./tests/firebird-docker-compose.yml down
# tests
test_on_serra_vine: assert_all_committed build target/3rdparty
	docker stop dremio || true
	docker run -v serra-vine_dremio-jars:/tmp --name janitor -d alpine tail -f /dev/null
	docker exec -it janitor sh -c 'rm -f /tmp/dremio-firebird*.jar'
	docker cp ./target/dremio-firebird-plugin*.jar janitor:/tmp/
	docker cp ./target/3rdparty/. janitor:/tmp/3rdparty/
	docker rm -f janitor
	docker start dremio
	