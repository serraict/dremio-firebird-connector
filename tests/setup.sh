# this test assumes you have a running Dremio container named "dremio"
docker cp ../target/dremio-firebird-plugin*.jar dremio:/opt/dremio/jars/
docker cp ../target/3rdparty/. dremio:/opt/dremio/jars/3rdparty/
# restart the container:
docker restart dremio