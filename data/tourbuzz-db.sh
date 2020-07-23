createdb gis
psql -d gis -c 'create extension postgis; create extension hstore'
osm2pgsql --create --style /data/tourbuzz.style --database gis /data/noord-holland-latest.osm.pbf