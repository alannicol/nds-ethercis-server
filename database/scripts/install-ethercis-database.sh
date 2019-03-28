echo "Installing ethercis database"

cp pg_hba.conf /var/lib/postgresql/data

su - postgres -c 'psql -c "CREATE USER root WITH SUPERUSER;"'

echo "Install ethercis dependencies"

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
git clone https://github.com/postgrespro/jsquery.git
cd jsquery
make USE_PGXS=1
make USE_PGXS=1 install

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

gradle flywayMigrate

echo "Remove directories"

cd / # go to root before clean up

#clean directories used for installation
rm -f -r /usr/lib/jvm/java-1.8-openjdk
rm -f -r /usr/lib/jvm/default-jvm
rm -f -r /jsquery
rm -f -r /ehrservice
rm -f -r /opt/gradle

echo "Done"