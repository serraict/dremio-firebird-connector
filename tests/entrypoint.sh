#!/bin/bash
set -e

# Wait for Firebird server to initialize
/usr/local/firebird/bin/fbguard & sleep 10s 

echo "creating the test database ... "

# Create the test_dremio database
echo 'CREATE DATABASE "firebird:test_dremio.fdb";' | /usr/local/firebird/bin/isql -user SYSDBA -password masterkey

echo "creating the test data ... "

/usr/local/firebird/bin/isql -user SYSDBA -password masterkey firebird:/firebird/data/test_dremio.fdb -i /docker-entrypoint-initdb.d/create_test_database.sql

echo "done."