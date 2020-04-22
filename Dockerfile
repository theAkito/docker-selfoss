FROM akito13/alpine

LABEL maintainer="Akito <the@akito.ooo>"
LABEL version="0.2.0"
LABEL description="Multipurpose rss reader, live stream, mashup, aggregation web application"

ARG VERSION=2.19
ARG COMMIT=f0759b2

ENV GID=991 UID=991 CRON_PERIOD=15m UPLOAD_MAX_SIZE=25M LOG_TO_STDOUT=false MEMORY_LIMIT=128M

RUN echo "@community http://nl.alpinelinux.org/alpine/v3.10/community" >> /etc/apk/repositories \
 && apk -U upgrade \
 && apk add -t build-dependencies \
    curl \
    git \
    p7zip \
 && apk add \
    musl \
    nginx \
    s6 \
    su-exec \
    libwebp \
    ca-certificates \
    php7@community \
    php7-fpm@community \
    php7-gd@community \
    php7-json@community \
    php7-zlib@community \
    php7-xml@community \
    php7-dom@community \
    php7-curl@community \
    php7-iconv@community \
    php7-mcrypt@community \
    php7-pdo_mysql@community \
    php7-pdo_pgsql@community \
    php7-pdo_sqlite@community \
    php7-ctype@community \
    php7-session@community \
    php7-mbstring@community \
    php7-simplexml@community \
    php7-xml \
    php7-xmlwriter \
    tini@community \
 && curl -sSL https://bintray.com/fossar/selfoss/download_file?file_path=selfoss-${VERSION}-${COMMIT}.zip \
    -o /selfoss.zip \
 && 7z x selfoss.zip \
 && rm selfoss.zip \
 && sed -i -e 's|base_url=|base_url=/|g' /selfoss/defaults.ini \
 && apk del build-dependencies \
 && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /
RUN chmod +x /usr/local/bin/run.sh /services/*/run /services/.s6-svscan/*
VOLUME /selfoss/data
EXPOSE 8888
ENTRYPOINT ["run.sh"]
