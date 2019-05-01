
# nds-ethercis-server

This is a docker image for running v1.3 of ethercis server.

### Configuration Notes

To point the server at a different database, modify the services.properties file "server.persistence.jooq.url" value. Currently it points at 172.18.0.10 where we expect to the database to be hosted.


### Getting this running
The docker can be ran by either cloning the repo or grabbing the image from docker hub, both are detailed below. Note that you should already have the ([ethercis-database-docker](https://github.com/ethercis/ethercis-database-docker)) running before hand on port 172.18.0.10 (default).

Also note, the below docker commands assumes there has already been a network called `dev-network` created.
```
docker network create --subnet=172.18.0.0/16 dev-network
```

#### Steps to get this running
```
git clone <this repo>
docker build --tag=nesnds/ethercis-server .
docker run --name ethercis-server --net dev-network --ip 172.18.0.11 -p 8080:8080 nesnds/ethercis-server
Run the migration script mentioned below (temporary)
```

#### Alternatively pull the image from docker hub, and then run it
```
docker pull nesnds/ethercis-server
docker run --name ethercis-server --net dev-network --ip 172.18.0.11 -p 8080:8080 nesnds/ethercis-server
Run the migration script mentioned below(temporary)
```

#### Temporary migration step

There is a temporary file \scripts\migration\v9_migration.sql which currently requires to be run after the container is initialised due to a bug in https://github.com/ethercis/ehrservice/blob/remote-github/db/src/main/resources/db/migration/V9__feeder_audit.sql