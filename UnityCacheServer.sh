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
    update-rc.d unity_cache_server defaults
    touch /opt/CacheServer/unity_cache_server.log
fi

echo "Starting Services"
/etc/init.d/unity_cache_server start
tail -f /opt/CacheServer/unity_cache_server.log
