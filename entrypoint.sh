#!/bin/bash

# test is conf file is already present, if not copy the default one
if [ ! -f /etc/powerdns/pdns.conf ]; then
    cp -R /tmp/powerdns/* /etc/powerdns/
fi

# launch the PowerDNS service
pdns_server
