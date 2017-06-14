FROM benizar/postgres-ext


# Versions and sources
ENV POSTGIS_MAJOR 2.3
ENV POSTGIS_VERSION 2.3.2+dfsg-1~exp2.pgdg80+1
ENV PGROUTING_MAJOR 2.3
ENV PGROUTING_VERSION 2.3.0-1


# Installation
RUN apt-get update --fix-missing -y


# Postgis and friends
RUN apt-get install -y postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION
RUN apt-get install -y postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts=$POSTGIS_VERSION
RUN apt-get install -y postgis=$POSTGIS_VERSION
RUN apt-get install -y postgresql-$PG_MAJOR-pgrouting
RUN rm -rf /var/lib/apt/lists/*


## osm2pgrouting Requirements
#run apt-get install -y libpq-dev
#run apt-get install -y expat
#run apt-get install -y libboost-all-dev
#run apt-get install -y cmake


## osm2pgsql Requirements
#run apt-get install -y libexpat1-dev zlib1g-dev libbz2-dev libgeos-dev libgeos++-dev libproj-dev lua5.2 liblua5.2-dev


## compile osm2pgrouting
#run git clone https://github.com/pgRouting/osm2pgrouting.git
#run cd osm2pgrouting && cmake -H. -Bbuild && \
#    cd build/ && make && make install


## compile osm2pgsql
#run git clone git://github.com/openstreetmap/osm2pgsql.git
#run cd osm2pgsql && mkdir build && cd build && cmake .. \
#&& make && make install



# DB SETUP
ADD init-db.sh /docker-entrypoint-initdb.d/init-db.sh


