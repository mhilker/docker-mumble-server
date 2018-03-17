FROM debian:jessie

RUN apt-get update \
 && apt-get install -y \
    curl \
    bzip2 \
    inotify-tools \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/murmur/ \
 && mkdir -p /var/lib/murmur/ \
 && mkdir -p /etc/murmur/

RUN curl -XGET "https://raw.githubusercontent.com/mumble-voip/mumble-gpg-signatures/master/mumble-auto-build-2017.asc" -o /tmp/key.asc \
 && gpg --import /tmp/key.asc \
 && rm /tmp/key.asc \
 && curl -XGET "https://dl.mumble.info/murmur-static_x86-1.3.0~2586~g894ade2~snapshot.tar.bz2" -o /tmp/murmur.tar.bz2 \
 && curl -XGET "https://dl.mumble.info/murmur-static_x86-1.3.0~2586~g894ade2~snapshot.tar.bz2.sig" -o /tmp/murmur.sig \
 && gpg --verify /tmp/murmur.sig /tmp/murmur.tar.bz2 \
 && rm /tmp/murmur.sig \
 && tar -xvjf /tmp/murmur.tar.bz2 -C /tmp \
 && rm /tmp/murmur.tar.bz2 \
 && cp -R /tmp/murmur-static*/* /opt/murmur/ \
 && rm -rf /tmp/*

COPY conf/murmur.ini /etc/murmur/murmur.ini
COPY entrypoint.sh /opt/murmur/entrypoint.sh

RUN adduser --disabled-password --gecos '' murmur \
 && chown -R murmur:murmur /opt/murmur

VOLUME ["/var/lib/murmur/"]

ENTRYPOINT ["/opt/murmur/entrypoint.sh"]
CMD ["/opt/murmur/murmur.x86", "-fg", "-ini", "/etc/murmur/murmur.ini"]
