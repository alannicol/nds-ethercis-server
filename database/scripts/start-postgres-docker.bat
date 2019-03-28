SET QEWD_PATH=%1
docker run --rm --name ethercis-db -e POSTGRES_PASSWORD=postgres -d -p 5432:5432 -v %QEWD_PATH%\ethercis-db:/data postgres:10