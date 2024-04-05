# Dremio ARP Firebird Connector

❌ not verified

## Building and Installation

1. Download the [latest release jar from Github](https://github.com/serraict/dremio-firebird-connector/releases/)''
2. Take the resulting .jar file in the target folder and put it in the `/dremio/jars` folder in Dremio'
3. Run `./scripts/get_jaybird.sh` to download the [JDBC driver](https://firebirdsql.org/en/jdbc-driver/).
   It will be stored in `./target/3rdparty` and put in in the `/dremio/jars/3rdparty` folder
4. Restart Dremio

## Adding a Firebird Source in Dremio

Once the connector has been added, log in to Dremio.
Inside Dremio, click on the plus sign to add a new data source,
❌ and select Firebird from the list of available sources.
❌ In the 'New Firebird Source' window enter a name and the name of a Firebird database to connect to and click Save.

## Development

To run a local test database:

```shell
make firebird
```

This starts a docker container running firebird.
On the first run, the database gets initialized with test data.

To test on Serra Vine, run:

```shell
make test_on_serra_vine
```

### Requirements

* java version ?
* Tested with Docker v25.0.3, earlier versions might work too.
* Tested with Dremio version 24.3.2-202401241821100032-d2d8a497

## References

* Forked from [dremio-sqllite-connector](https://github.com/dremio-hub/dremio-sqllite-connector).
* <https://community.dremio.com/t/support-for-firebird-databases/503>
* [Jaybird JDBC connector for Firebird](https://firebirdsql.github.io/jaybird-manual/jaybird_manual.html)
* <https://github.com/serra/dremio-sqllite-connector>

