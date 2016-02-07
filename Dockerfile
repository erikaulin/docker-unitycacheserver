FROM debian:jessie
MAINTAINER Erik Aulin <erik@aulin.co>
ENV DEBIAN_FRONTEND=noninteractive

# Install prereqs
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

WORKDIR /opt

# Download and install CacheServer
ADD http://netstorage.unity3d.com/unity/e87ab445ead0/CacheServer-5.3.2f1.zip /opt
RUN unzip CacheServer-5.3.2f1.zip \
  && rm CacheServer-5.3.2f1.zip

CMD ["/opt/CacheServer/RunLinux.sh"]
