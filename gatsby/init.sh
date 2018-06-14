#!/bin/sh
set -e

cd "/var/www/html"

# # Initialize Gatsby or run YARN install if needed
if [ ! -e "$GATSBY_DIR/node_modules/" ]
then
  echo "Node modules is empty. Running npm install..."
  yarn install --non-interactive
	wait
fi

# Decide what to do
if  [ "$APP_ENV" == "development" ]
then
  echo "Removing Cache"
  rm -rf .cache
  
	echo "Running gatsby develop"
  rm -rf public
  gatsby develop --host 0.0.0.0

elif  [ "$APP_ENV" == "staging" ]
then
	echo "Running gatsby build (staging)"
  rm -rf public
  gatsby build
  gatsby serve --port 8000

elif  [ "$APP_ENV" == "production" ]
then
	echo "Running gatsby build (production)"
	rm -rf public
	gatsby build

else
  exec $@

fi
