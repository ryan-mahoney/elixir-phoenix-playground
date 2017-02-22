#!/bin/bash

# Wait until PostgreSQL started and listens on port 5432.
while [ -z "`netstat -tln | grep 5432`" ]; do
  echo 'Waiting for PostgreSQL to start ...'
  sleep 1
done

# let it warm up...
sleep 5
runuser postgres -c '/usr/lib/postgresql/9.6/bin/createdb -E UTF8 hello_phoenix_dev'

cd /app/hello_phoenix && mix phoenix.server
