#!/bin/sh

php -S 0.0.0.0:80 -t /var/www/html &

mysqld_safe