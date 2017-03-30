# docker-php

docker-php is a PHP-FPM Server boxed in a Docker image built by [Tommy Lau](http://tommy.net.cn/).

## What is in this image?

This image is a php web development environment cooked based on the offical docker image `php:7.1-fpm-alpine`, and with the following enhancements.

Enabled:

- Enabled mysqli

```bash
docker pull tommylau/php:7.1
```

Start an instance:

```bash
docker run --name php -v /path/to/web:/var/www/html -d tommylau/php:7.1
```

This will start an instance, and you are ready to go.

## Link with other containers

To use this image to link with MySQL, you have to have a running MySQL instance, more information about MySQL docker image, please refer to official MySQL image at [https://store.docker.com/images/mysql](https://store.docker.com/images/mysql). Suppose you have a MySQL instance named **mysql_server**, we can link it in our php instance with the name **mysql** like this:

```bash
docker run --name php -v /path/to/web:/var/www/html --link mysql_server:mysql -d tommylau/php:7.1
```

Then in the instance, you can use the hostname `mysql` to connect to the database.
