#!/bin/bash

# test is conf file is already present, if not copy the default one
if [ ! -f /etc/powerdns/pdns.conf ]; then
cp -R /tmp/powerdns/* /etc/powerdns/

sed -i '/launch\=/c\' /etc/powerdns/pdns.conf
sed -i -e 's/^/\#/' /etc/powerdns/pdns.d/pdns.local.gpgsql.conf

cat <<EOF >> /etc/powerdns/pdns.conf
recursor=$DNS_FORWARDER
launch=gpgsql
gpgsql-host=$PGSQL_HOST
gpgsql-user=$PGSQL_USER
gpgsql-dbname=$PGSQL_DBNAME
gpgsql-password=$PGSQL_PASSWD
EOF
fi

# launch the PowerDNS service
pdns_server

