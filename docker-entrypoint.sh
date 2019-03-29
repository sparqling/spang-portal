#!/bin/bash

mkdir -p tmp/pids
rm -f tmp/pids/unicorn.pid

source ~/.bashrc

echo "installing dependencies..."
bundle install -j8

echo "starting up..."
exec "$@"
