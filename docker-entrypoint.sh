#!/bin/bash

mkdir -p tmp/pids
rm -f tmp/pids/unicorn.pid
rm -f tmp/pids/server.pid

source ~/.bashrc

echo "installing dependencies..."
bundle install -j8

echo "starting up..."
exec "$@"
