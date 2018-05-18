FROM debian
LABEL maintainer="gaetanlongree@gmail.com"

RUN apt-get update && apt-get install pdns-server -y && echo no | apt-get install pdns-backend-pgsql -y &&\
	cp -R /etc/powerdns/ /tmp/powerdns

EXPOSE 53/tcp 53/udp

ADD entrypoint.sh /

ENTRYPOINT ["bash", "/entrypoint.sh"]
