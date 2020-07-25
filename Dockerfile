FROM postgis/postgis:10-3.0

LABEL maintainer="Milo van der Linden - https://www.tiltshiftapps.nl"

ENV PBF_URL=https://download.geofabrik.de/europe/germany/thueringen-latest.osm.pbf
ENV POSTGRES_DB=postgres
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=secret
ENV POSTGRES_HOST=localhost
ENV POSTGRES_PORT=5432
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           osm2pgsql wget \
      && rm -rf /var/lib/apt/lists/*
VOLUME /data
COPY ./data /data
COPY run.sh /run.sh
RUN chmod a+x /run.sh

RUN useradd -s /bin/bash osm

USER osm

ENTRYPOINT ["/run.sh"]