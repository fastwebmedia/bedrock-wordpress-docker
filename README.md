# Dockerized Wordpress using Bedrock

* Wordpress install based on [Bedrock](https://github.com/roots/bedrock).
* [wp-cli](https://wp-cli.org) support
* Utilizes [custom nginx config](https://github.com/perusio/wordpress-nginx).
* php 7.2, mariadb 10.3 and nginx 1.12
* mysql s3 backup

## docker-compose.yml

Change the `WP_HOME` and `WP_SITEURL` variables to your values. Add an admin username, password and email and a site title as shown in the `docker-compose.yml` file to create a fresh install.

From there, just:

```
docker-compose up
```

It will build and start all of the containers. It may take a while the first time. The `fpm` container has a lot to build. If they all build and start correctly, the `fpm` container will wait for the database host and port to become available. Once it is, and if Wordpress isn't already installed and all of the admin variables and the site title variable are present, a new installation using that information will be created. If that information is not provided, you can run the same install cammand using wp-cli commands.

## wp-cli

Once you have everything up and running, it's as simple as the below to run wp-cli commands.

```
docker exec fpm wp core version
```

## A note about the nginx configuraiton

It makes all urls that end in `install.php` as well as the `readme.html` require a password. This is done for security reasons. This does not currently create a password. All core, plugin and theme installations must be done by making a new base image or through a wp-cli command.

You can disable the password by providing an `ALLOW_INSTALL` environment variable with a string value of `yes`. You can see an example of this in the `docker-compose.yml` file.

## Docker Commands

Below are the docker commands required to build and publish to DockerHub.

### Build Image

```
cd nginx-wordpress
docker build -t fastwebmedia/nginx-bedrock-wordpress .
```

### Push Image to Docker Hub

`docker push fastwebmedia/nginx-bedrock-wordpress:latest`
