# Work

## Goal

Use data in Firebird databases as input to the semantic data model in Dremio at my clients.

## Vision

I install a Dremio ARP connector based on the Jaybird JDBC driver in my Dremio CE instance,
pass it a connection string and read the data.
The connector is publicly available, easily installable and useful.

## Backlog

* Remove everything SQLite and replace it with Firebird
* Remove SQLite JDC connector references (code and docs)
* Document how to test (consider adding testing environment in this repo?)
