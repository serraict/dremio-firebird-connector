# Dremio ARP Firebird Connector

❌ not verified

## Building and Installation

1. In root directory with the pom.xml file run `mvn clean install`
2. Take the resulting .jar file in the target folder and put it in the \dremio\jars folder in Dremio
3. ❌ Take the Jaybird JDBC driver from (https://github.com/xerial/sqlite-jdbc) and put in in the \dremio\jars\3rdparty folder
4. Restart Dremio

## Adding a SQLite Source in Dremio

Once the connector has been added, log in to Dremio. 
Inside Dremio, click on the plus sign to add a new data source, 
❌ and select Firebird from the list of available sources. 
❌ In the 'New Firebird Source' window enter a name and the name of a Firebird database to connect to and click Save. 

## References

* Forked from [dremio-sqllite-connector](https://github.com/dremio-hub/dremio-sqllite-connector).
* <https://community.dremio.com/t/support-for-firebird-databases/503>
* [Jaybird JDBC connector for Firebird](https://firebirdsql.github.io/jaybird-manual/jaybird_manual.html)
* <https://github.com/serra/dremio-sqllite-connector>


