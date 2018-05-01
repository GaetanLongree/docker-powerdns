FROM debian
LABEL maintainer="gaetanlongree@gmail.com"

RUN apt-get update && apt-get install pdns-server -y &&\
	cp -R /etc/powerdns/ /tmp/powerdns

EXPOSE 53/tcp 53/udp

ADD entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
