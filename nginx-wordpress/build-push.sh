#!/bin/sh
set -e

docker build -t fastwebmedia/nginx-bedrock-wordpress .;
docker push fastwebmedia/nginx-bedrock-wordpress:latest
