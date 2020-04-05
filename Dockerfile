FROM php:alpine3.11

RUN apk add --no-cache mariadb mariadb-client tzdata && \
    docker-php-ext-install mysqli && \
    rm -rf /var/cache/apk/*

RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/my.cnf && \
    sed -i  's/^skip-networking/#&/' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i '/^\[mysqld]$/a skip-host-cache\nskip-name-resolve' /etc/my.cnf && \
    sed -i '/^\[mysqld]$/a user=mysql' /etc/my.cnf && \
    echo -e '\n!includedir /etc/mysql/conf.d/' >> /etc/my.cnf && \
    mkdir -p /etc/mysql/conf.d/

ENV MYSQL_ROOT_PASSWORD=root123456

VOLUME /var/lib/mysql

ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

ADD run.sh /usr/local/bin/
CMD ["/usr/local/bin/run.sh"]

RUN rm -rf /var/www/html
ADD phpMyAdmin-4.9.5-all-languages.tar.gz /var/www/
RUN ln -s /var/www/phpMyAdmin-4.9.5-all-languages /var/www/html

EXPOSE 3306 80
