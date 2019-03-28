#!/usr/bin/env bash

echo "Install Postgres"

mkdir -p install
cd install

echo "Fetching PostgreSQL"

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/PostgreSQL.list'

echo "Installing PostgreSQL"

sudo apt-get install postgresql-10

echo "Start PostgreSQL"

sudo service postgresql start

echo "Remove directories"

cd /
rm -rf -r /install

echo "Done"