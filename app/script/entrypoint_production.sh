#!/bin/sh
echo -------------------------------
rm -f tmp/pids/server.pid
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rake assets:precompile
bundle exec rails s puma -p 3000 -b '0.0.0.0'
echo -------------------------------
