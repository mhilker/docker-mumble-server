FROM debian:jessie

RUN apt-get update \
 && apt-get install -y \
    curl \
    bzip2 \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/murmur/ \
 && mkdir -p /var/lib/murmur/ \
 && mkdir -p /etc/murmur/

RUN curl -XGET "http://mumble.info/snapshot/murmur-static_x86-1.3.0~2586~g894ade2~snapshot.tar.bz2" -o /tmp/murmur.tar.bz2 \
 && curl -XGET "http://mumble.info/snapshot/murmur-static_x86-1.3.0~2586~g894ade2~snapshot.tar.bz2.sig" -o /tmp/murmur.sig \
 && tar -xvjf /tmp/murmur.tar.bz2 -C /tmp \
 && cp -R /tmp/murmur-static*/* /opt/murmur/ \
 && rm -rf /tmp/*

ADD murmur.ini /etc/murmur/murmur.ini

RUN adduser --disabled-password --gecos '' murmur \
  && chown -R murmur:murmur /opt/murmur

VOLUME ["/var/lib/murmur/"]

CMD ["/opt/murmur/murmur.x86", "-fg", "-ini", "/etc/murmur/murmur.ini"]
