FROM node:8-alpine

LABEL MAINTAINER="Erik Aulin erik@aulin.co"

RUN npm install unity-cache-server -g && \
    npm cache clean --force && \
    mkdir -p /opt/cache

CMD ["unity-cache-server", "-P", "/opt/cache"]