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
    - "8126:8126"
  volumes_from:
    - volumes
volumes:
  image: busybox:latest
  container_name: unitycacheserver_data
  volumes:
    # Main Directory
    - /opt/cache
  command: /bin/echo
```

#### Dockerfile
```
FROM node:8-alpine

LABEL MAINTAINER="Erik Aulin erik@aulin.co"

RUN npm install unity-cache-server -g && \
    npm cache clean --force && \
    mkdir -p /opt/cache

CMD ["unity-cache-server", "-P", "/opt/cache"]
```

## Maintainers

* [Erik Aulin](mailto:erik@aulin.co)
