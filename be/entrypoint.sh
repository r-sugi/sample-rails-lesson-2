#!/bin/bash
set -e

RAILS_PORT=3000
if [ -n "$PORT" ]; then
  RAILS_PORT=$PORT
fi

# Remove a potentially pre-existing server.pid for Rails.
rm -f tmp/pids/server.pid
gem install bundler -v 2.2.24
ruby -v
bundle -v
bundle config set --local clean true
bundle config set --local path /usr/local/bundle
bundle install -j4

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
