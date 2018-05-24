FROM debian
LABEL maintainer="gaetanlongree@gmail.com"

ENV PGSQL_HOST 127.0.0.1
ENV PGSQL_USER admin
ENV PGSQL_DBNAME dns
ENV PGSQL_PASSWD P@$$w0rd
ENV DNS_FORWARDER 8.8.8.8

RUN apt-get update && apt-get install pdns-server -y && echo no | apt-get install pdns-backend-pgsql -y &&\
	cp -R /etc/powerdns/ /tmp/powerdns

EXPOSE 53/tcp 53/udp

VOLUME /etc/powerdns

ADD entrypoint.sh /

ENTRYPOINT ["bash", "/entrypoint.sh"]
