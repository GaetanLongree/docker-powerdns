# docker-powerdns
PowerDNS deployment with PostgreSQL backend solution pre-installed.

This container can be paired with my [cajetan19/postgresql-powerdns](https://hub.docker.com/r/cajetan19/postgresql-powerdns/) container.

This container is directly configurable of a PostgreSQL database at runtime using the environment variables.

### PGSQL_HOST
*Default: 127.0.0.1*

IP address of the database host.

### PGSQL_DBNAME
*Default: dns*

Name of the database containing the PowerDNS schema.

### PGSQL_USER
*Default: admin*

User with at least read access to the PowerDNS database on the host.

### PGSQL_PASSWD
*Default: P@$$w0rd*

Password for the provided user.

### DNS_FORWARDER
*Default: 8.8.8.8*

IP address of the DNS server to forward unknown DNS requests.

## Sample `docker run`
```
docker run --detach \
-p 53:53/udp \
--env PGSQL_HOST=172.17.0.10 \
--env PGSQL_USER=pdns \
--env PGSQL_DBNAME=pdns \
--env PGSQL_PASSWD=V3ryS3cr3tP4$$w0rd \
--env DNS_FORWARDER=8.8.8.8 \
--volume /share/powerdns:/etc/powerdns \
--name powerdns \
cajetan19/powerdns-pgsql
```
