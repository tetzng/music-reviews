#!/bin/sh
echo -------------------------------
rm -f tmp/pids/server.pid
bundle exec rails db:migrate
bundle exec puma -C puma.rb
echo -------------------------------