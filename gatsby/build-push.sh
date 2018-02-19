#!/bin/sh
set -e

docker build -t fastwebmedia/gatsby .;
docker push fastwebmedia/gatsby:latest
