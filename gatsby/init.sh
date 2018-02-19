#!/bin/sh
set -e

export GATSBY_DIR="/var/www/html"

# # Initialize Gatsby or run YARN install if needed
if [ ! -e "$GATSBY_DIR/node_modules/" ]
then
  echo "Node modules is empty. Running npm install..."
	cd $GATSBY_DIR
  yarn install --non-interactive
	wait
fi

# Decide what to do
# if  [ "$APP_ENV" == "development" ]
# then
	echo "Running gatsby develop"
  rm -rf $GATSBY_DIR/public
  cd $GATSBY_DIR
  gatsby develop
#
# elif  [ "$APP_ENV" == "staging" ]
# then
# 	echo "Running gatsby build (staging)"
#   rm -rf $GATSBY_DIR/public
#   gatsby build
#   gatsby serve --port 8000
#
# elif  [ "$APP_ENV" == "production" ]
# then
# 	echo "Running gatsby build (production)"
# 	rm -rf $GATSBY_DIR/public
# 	gatsby build
#
# else
#   exec $@
#
# fi
