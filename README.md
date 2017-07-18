# Magento 2.1 Dockerfile
- Based on `php:7.0-apache`.

[![Docker build](http://dockeri.co/image/roura/magento2.1)](https://hub.docker.com/r/roura/magento2.1/)

## Magento 2 installation made easy
After running this `Dockerfile` you will have:
- Debian Jessie
- PHP 7.0
- Apache 2.4
- Composer
- Node
- Grunt

## Requirements
Before running the container, you should prepare the following environment variables:
- $LANG
- $LANGUAGE
- $LC_ALL
- $MAGENTO_ADMIN_FIRSTNAME
- $MAGENTO_ADMIN_LASTNAME
- $MAGENTO_ADMIN_EMAIL
- $MAGENTO_ADMIN_USERNAME
- $MAGENTO_ADMIN_PASSWORD
- $MAGENTO_TIMEZONE
- $MAGENTO_DEFAULT_CURRENCY
- $MYSQL_HOST
- $MYSQL_USER
- $MYSQL_PASSWORD
- $MYSQL_DATABASE

Also, you'll need a database, as this container only has the web service.

### How to run
- Add `magento2.docker` at the end of your `/etc/hosts` file (i.e., `127.0.0.1 magento2.docker`)
- Run `docker-compose build && docker-compose up -d`
- Visit your newly-created [magento2.docker](http://magento2.docker/)
