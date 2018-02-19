#!/bin/sh
set -e

docker build -t fastwebmedia/php71-fpm-bedrock-wordpress .;
docker push fastwebmedia/php71-fpm-bedrock-wordpress:latest
