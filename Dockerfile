FROM chromamaster/alpine_arm32v7

MAINTAINER ChromaMaster <>
LABEL architecture="ARM32v7"

ENV DOKUWIKI_USER nobody
ENV DOKUWIKI_GROUP nogroup
ENV DOKUWIKI_VERSION 2018-04-22b
ENV DOKUWIKI_RELEASE_URL https://github.com/splitbrain/dokuwiki/archive/release_stable_${DOKUWIKI_VERSION}.tar.gz

WORKDIR /var/www/

# Installs php7 and nginx
RUN     apk add --no-cache \
        ca-certificates \    
        php7 \
        php7-gd \
        php7-phar \
        php7-bcmath \
        php7-calendar \
        php7-mbstring \
        php7-exif \
        php7-ftp \
        php7-openssl \
        php7-zip \
        php7-sysvsem \
        php7-sysvshm \
        php7-sysvmsg \
        php7-shmop \
        php7-sockets \
        php7-zlib \
        php7-bz2 \
        php7-curl \
        php7-simplexml \
        php7-xml \
        php7-opcache \
        php7-dom \
        php7-xmlreader \
        php7-xmlwriter \
        php7-tokenizer \
        php7-ctype \
        php7-session \
        php7-fileinfo \
        php7-iconv \
        php7-json \
        php7-posix \
        php7-fpm \
        nginx

RUN     ln -sf /dev/stdout /var/log/nginx/access.log \
    &&  ln -sf /dev/stderr /var/log/nginx/error.log

#ENV PUID=nobody PGID=nobody
RUN wget $DOKUWIKI_RELEASE_URL && \
    ls -l && \
    tar xvzf release_stable_${DOKUWIKI_VERSION}.tar.gz

#ADD --chown=nobody:nogroup release_stable_2018-04-22a.tar.gz dokuwiki

#RUN mv dokuwiki-release_stable_2018-04-22a dokuwiki

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME ["/var/www/html/data"]
EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
