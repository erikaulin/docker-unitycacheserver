FROM debian:jessie
MAINTAINER Erik Aulin <erik@aulin.co>
ENV DEBIAN_FRONTEND=noninteractive

# install prereqs
RUN apt-get update \
    && apt-get -qy --no-install-recommends install \
        unzip \
        cpio \
        curl \
        sed \
        wget \
    && apt-get -q -y clean \
    && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* \
    && rm -rf /usr/share/man/?? /usr/share/man/??_*

RUN mkdir /src
WORKDIR /src
COPY UnityCacheServer.sh /src/
COPY unity_cache_server /etc/init.d/
RUN chmod a+x /src/UnityCacheServer.sh
RUN chmod a+x /etc/init.d/unity_cache_server
ENTRYPOINT ["/src/UnityCacheServer.sh"]
