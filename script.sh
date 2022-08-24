#!/bin/bash

echo "Atuallizando servidor"

apt-get update
apt-get upgrade -y

apt-get install apache2 -y
apt-get install docker -y

echo "Subindo arquivos da aplicação"

mkdir /var/lib/docker/volumes/app/_data

cp index.php /var/lib/docker/volumes/app/_data

docker run --name web-server -dt -p 80:80 --mount type=volume,src=app.dst=/app/ webdevops/php-apache:alpine-php7

