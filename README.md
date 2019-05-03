
# nds-ethercis-server

This is a docker image for running v1.3 of ethercis server.


### Getting this running
The docker image is hosted on docker hub ([nesnds/ethercis-server](https://cloud.docker.com/u/nesnds/repository/docker/nesnds/ethercis-server)). 
Note that you should already have the ([ethercis-database-docker](https://github.com/ethercis/ethercis-database-docker)) running before creating this container.

#### Pull the image from docker hub, and then run it
The default environment variables will suit if you have not already changed them on your ethercis database. host.docker.internal is a special DNS that will resolve to the host machine on windows and macOS.
```
docker pull nesnds/ethercis-server
docker run --name ethercis-server -e DB_IP=host.docker.internal -e DB_PORT=5432 -e DB_USER=postgres -e DB_PW=postgres -p 8084:8080 nesnds/ethercis-server
Run the migration script mentioned below(temporary)
```

#### Temporary migration step

There is a temporary file \scripts\migration\v9_migration.sql which currently requires to be run against the database after this container is created due to a bug in https://github.com/ethercis/ehrservice/blob/remote-github/db/src/main/resources/db/migration/V9__feeder_audit.sql, this note should be removed once the bug is fixed.
Github issue - https://github.com/ethercis/ehrservice/issues/20
