FROM java:8
WORKDIR /
ADD /lib/ethercis-1.3.0-SNAPSHOT-runtime.jar ethercis.jar
ADD /config /config
EXPOSE 8080
CMD java -jar ethercis.jar -propertyFile /config/services.properties