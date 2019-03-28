#!/usr/bin/env bash

echo "install Database"

sudo sed -i '1ihost all all 0.0.0.0\/0 trust' /etc/postgresql/10/main/pg_hba.conf

echo "Create database"

git clone https://github.com/ethercis/ehrservice || { echo "Could not clone ethercis/ehrservice repository, exiting..." && exit 1; }
cd ehrservice/db
su - postgres -c "psql < /ehrservice/db/createdb.sql"

echo "Migrate database"

wget https://services.gradle.org/distributions/gradle-4.3-bin.zip

mkdir -p /opt/gradle
unzip -d /opt/gradle gradle-4.3-bin.zip
export PATH=$PATH:/opt/gradle/gradle-4.3/bin

#perform the migration
gradle flywayMigrate

echo "Remove directories"

cd /
rm -rf -r /ehrservice
rm -f -r /opt/gradle

echo "Done"
