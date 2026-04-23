FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y \
    curl \
    wget \
    unzip \
    php-fpm \
    php-mysql \
    php-curl \
    php-mbstring \
    php-xml \
    php-zip

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

#ADD RIGHTS TO /run/php
RUN mkdir -p /run/php && chown www-data:www-data /run/php

#COPY WORDPRESS CONFIG AND SET THE WORK DIR
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d
WORKDIR /var/www/html

#COPY SETUP SCRIPT AND ADD RIGHTS
COPY ./tools/script.sh .
RUN chmod +x script.sh

#SET PORTS 9000 LIKE SUBJECT ASK
EXPOSE 9000

ENTRYPOINT ["/var/www/html/script.sh"]
CMD ["php-fpm8.2", "-F"]
