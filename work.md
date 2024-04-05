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
