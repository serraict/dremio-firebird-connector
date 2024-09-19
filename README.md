# Dremio ARP Firebird Connector

Althoough this connector needs testing and should not be considered production-ready,
I have been running it in a production environment for several months now without any significant problem.

## Installation

1. Download the [latest release jar from Github](https://github.com/serraict/dremio-firebird-connector/releases/)
2. Take the resulting .jar file in the target folder and put it in the `/dremio/jars` folder in Dremio'
3. Run `./scripts/get_jaybird.sh` to download the [JDBC driver](https://firebirdsql.org/en/jdbc-driver/).
   It will be stored in `./target/3rdparty` and put in in the `/dremio/jars/3rdparty` folder
4. Restart Dremio

## Adding a Firebird Source in Dremio

Once the connector has been installed, log in to Dremio.
Inside Dremio, click on the plus sign to add a new data source,
and select Firebird from the list of available sources.
In the 'New Firebird Source' window enter
[your Jaybird JDBC connection string](https://firebirdsql.github.io/jaybird-manual/jaybird_manual.html#connection-drivermanager)
and credentials, and hit `Save`.

## Development

To run a local test database:

```shell
make firebird
```

This starts a docker container running firebird.
It will be available on port 3050 on the host,
and on a docker network named `serra-vine`.
On the first run, the database gets initialized with test data.

To test on the Dremio instance hosted by Serra Vine, run:

```shell
make test_on_serra_vine
```

### Requirements

* Java version 8 and 11, Dremio plugins require Java 8.
* Tested with Docker v25.0.3, earlier versions might work too.
* Tested with Dremio version 24.3.2-202401241821100032-d2d8a497

## References

* Forked from [dremio-sqllite-connector](https://github.com/dremio-hub/dremio-sqllite-connector).
* <https://community.dremio.com/t/support-for-firebird-databases/503>
* [Jaybird JDBC connector for Firebird](https://firebirdsql.github.io/jaybird-manual/jaybird_manual.html)

Some reference implementations for other databases:

* <https://github.com/serra/dremio-sqllite-connector>
* <https://github.com/narendrans/dremio-snowflake/>
* <https://github.com/mmsmdali/dremio-clickhouse-arp-connector>
* <https://github.com/luciodaza/dremio-vertica-connector/>
* <https://github.com/Uqai-dev/dremio-db2-plugin> (by @dacopan)
