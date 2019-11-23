#!/bin/sh
echo -------------------------------
if [ -e /tmp/pids/server.pid ]; then
    rm -f /tmp/pids/server.pid;
fi

bundle exec rails db:migrate
bundle exec rails s -p 3000 -b '0.0.0.0'
echo -------------------------------