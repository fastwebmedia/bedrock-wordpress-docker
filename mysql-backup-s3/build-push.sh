#!/bin/sh
set -e

docker build -t fastwebmedia/mysql-backup-s3 .;
docker push fastwebmedia/mysql-backup-s3:latest
