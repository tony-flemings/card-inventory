#!/bin/sh
until nc -z db 3306; do
  echo "Waiting for MySQL..."
  sleep 2
done

node server.js
