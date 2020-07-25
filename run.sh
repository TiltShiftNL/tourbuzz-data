#!/bin/bash

export PGPASS=$POSTGRES_PASSWORD
export PGPASSWORD=$POSTGRES_PASSWORD

wget --no-check-certificate -O /data/data.osm.pbf $PBF_URL

osm2pgsql --username $POSTGRES_USER --database $POSTGRES_DB --host $POSTGRES_HOST --port $POSTGRES_PORT --create --slim -G --hstore --tag-transform-script /data/osm-data.lua -C 2048 --number-processes ${THREADS:-4} -S /data/osm-data.style /data/data.osm.pbf
