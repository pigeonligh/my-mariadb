# My MariaDB

A docker image with mariadb and phpmyadmin, it is based on alpine.

### Port 

`80` for phpmyadmin
`3306` for mariadb

### Environment

`MYSQL_ROOT_PASSWORD` for root password, with `root123456` as default value

### Installation

```
docker pull pigeonligh/my-mariadb
docker volume create my-mariadb-volume
docker run -d -p 80:80 -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=root123456 \
    -v my-mariadb-volume:/var/lib/mysql \
    --name db \
    pigeonligh/my-mariadb
```

### Usage

Browse `127.0.0.1:80` to manage mysql.
