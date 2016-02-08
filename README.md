# Docker - Unity Cache Server

Unity Cache Server server container

## Usage

Run `docker-compose up -d` After a minute Unity Cache Server should be listening on ports 8125 and 8126.

#### docker-compose.yml
```
unitycacheserver:
  image: erikaulin/unitycacheserver:latest
  container_name: unitycacheserver
  ports:
    - "8125:8125" # legacy port
    - "8126:8126"
  volumes_from:
    - volumes
volumes:
  image: busybox:latest
  container_name: unitycacheserver_data
  volumes:
    # Main Directory
    - /opt/cache
    - /opt/cache5.0
  command: /bin/echo
```

#### Dockerfile
```
FROM debian:jessie
MAINTAINER Erik Aulin <erik@aulin.co>
ENV DEBIAN_FRONTEND=noninteractive

# Install prereqs
RUN apt-get update \
    && apt-get -qy --no-install-recommends install \
        unzip \
        cpio \
        curl \
        wget \
    && apt-get -q -y clean \
    && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/* \
    && rm -rf /usr/share/man/?? /usr/share/man/??_*

RUN mkdir /src
WORKDIR /src
COPY unitycacheserver /src/
RUN chmod a+x /src/unitycacheserver
ENTRYPOINT ["/src/unitycacheserver"]
```

#### unitycacheserver
```
#!/bin/bash
VERSION="5.3.2f1"
CMD=/opt/CacheServer/RunLinux.sh

if [ ! -f $CMD ]
then
    echo "Download and unpack Unity Cache Server"
    cd /opt
    wget http://netstorage.unity3d.com/unity/e87ab445ead0/CacheServer-${VERSION}.zip
    unzip CacheServer-${VERSION}.zip
    rm CacheServer-${VERSION}.zip
fi

echo "Starting Services"
/opt/CacheServer/RunLinux.sh
```

## Maintainers

* [Erik Aulin](mailto:erik@aulin.co)
