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

## Maintainers

* [Erik Aulin](mailto:erik@aulin.co)

## Credits

* [Jarnik](http://www.jarnik.com/1860-on-unity-asset-cache-server)
