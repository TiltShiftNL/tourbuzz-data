FROM postgis/postgis:10-3.0

LABEL maintainer="Milo van der Linden - https://www.tiltshiftapps.nl"

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           osm2pgsql \
      && rm -rf /var/lib/apt/lists/*
VOLUME /data