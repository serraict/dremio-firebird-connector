set -e

mkdir -p ./target/deploy
# set release variable:
export RELEASE="v0.0.22"

#use curl to download the release
curl -L https://github.com/serraict/dremio-firebird-connector/releases/download/$RELEASE/dremio-firebird-plugin-$RELEASE.jar -o ./target/deploy/dremio-firebird-plugin-$RELEASE.jar

docker cp ./target/deploy/dremio-firebird-plugin-*.jar dremio:/opt/dremio/jars/
docker restart dremio