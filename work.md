# Work

## Goal

Use data in Firebird databases as input to the semantic data model in Dremio at my clients.

## Vision

I install a Dremio ARP connector based on the Jaybird JDBC driver in my Dremio CE instance,
pass it a connection string and read the data.
The connector is publicly available, easily installable and useful.

## Doing

* add username and password as a configuration option

## Backlog

* Create a first version of the adapter that can read integers from a test database.
* Easy test database setup so that contributors can quickly verify their work.
* Document how to test (consider adding testing environment in this repo?)

## Known issues

### Dremio crashes when adding new configuration fields

Changing the configuration class crashes Dremio if it has an existing data source for that configuration.
This is because it can not deserialize the stored configuration into an instance of the new class.
So i delete my data sources before updating.
We cannot do this in production obviously.
Not sure if this is important enough to fix.
