#!/usr/bin/env bash

echo "Installing ethercis dependencies"

echo "Installing dependencies"
apt-get update
apt-get install python python-dev python-pip
apt-get install postgresql-contrib
apt-get install postgresql-server-dev-10
apt-get install ca-certificates
apt-get install build-essential
apt-get install git
apt-get install flex
apt-get install bison
apt-get install wget
apt-get install unzip
apt-get install openjdk-8-jdk
pip install pgxnclient

echo "Installing temporal_tables extension"
pgxn install temporal_tables

echo "Installing jsquery extension"
git clone https://github.com/postgrespro/jsquery || { echo "Could not clone jsquery repository, exiting..." && exit 1; }
cd jsquery
make USE_PGXS=1
make install USE_PGXS=1

echo "Done"