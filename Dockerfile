FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
      squid \ 
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/squid.d
COPY squid.conf /etc/squid.d/squid.conf
RUN sed -i "1iinclude /etc/squid.d/*.conf" /etc/squid/squid.conf \
    && dpkg-reconfigure squid \
    && squid -z \
    && sleep 1 

VOLUME "/var/spool/squid"
CMD ["squid", "-N"]
