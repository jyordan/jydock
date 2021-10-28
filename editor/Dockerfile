FROM alpine:edge

USER root

WORKDIR /var/www/html

ENV VERSION 0.6.0

RUN apk --update add \
   vim \
   nano \
   bash \
   curl \
   git \
   g++ \
   make \
   openssh \
   openssl \
   openssl-dev \
   && rm -rf /var/cache/apk/*

RUN curl -L https://github.com/AGWA/git-crypt/archive/$VERSION.tar.gz | tar zxv -C /var/tmp
RUN cd /var/tmp/git-crypt-$VERSION && make && make install PREFIX=/usr/local

RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite