#!/bin/bash

echo "docker pull ruby:2.5.3"
docker pull ruby:2.5.3

echo "docker pull mysql:5.7"
docker pull mysql:5.7

echo "docker images"
docker images

# make Dockerfile
cat <<'EOF' > Dockerfile
FROM ruby:2.5.3
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs && rm -rf /var/lib/apt/lists/*
RUN gem install bundler
WORKDIR /tmp
COPY src/Gemfile Gemfile
COPY src/Gemfile.lock Gemfile.lock
RUN bundle install
ENV APP_HOME /app_name
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME
EOF


# make 'src' directory and cd 'src' directory
mkdir src && cd src


# make Gemfile
cat <<'EOF' > Gemfile
source 'https://rubygems.org'
gem 'rails'
EOF

# make Gemfile.lock()
touch Gemfile.lock


# cd ../
cd ../


# make docker-compose.yml
cat <<'EOF' > docker-compose.yml
version: '3'
services:
  db:
    image: mysql:5.7
    volumes:
      - ./src/db/mysql_data:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_DATABASE=root
    ports:
      - "3306:3306"
  web:
    build: .
    command: rails s -p 3000 -b '0.0.0.0'
    volumes:
      - ./src:/app_name
    ports:
      - "3000:3000"
    links:
      - db
    tty: true
    stdin_open: true
EOF

echo "docker-compose run web rails new . --force --database=mysql --skip-bundle"
docker-compose run web rails new . --force --database=mysql --skip-bundle

# cd 'src'
cd src

# fix Gemfile
echo "fix Gemfile(uncoment mini_racer)"
cat Gemfile | sed "s/# gem 'mini_racer'/gem 'mini_racer'/" > __tmpfile__
cat __tmpfile__ > Gemfile
rm __tmpfile__


# cd ../
cd ../


docker-compose build

# cd src/
cd src/


# fix config/database.yml
echo "fix config/database.yml"
cat config/database.yml | sed 's/password:$/password: root/' | sed 's/host: localhost/host: db/' > __tmpfile__
cat __tmpfile__ > config/database.yml
rm __tmpfile__

# cd ../
cd ../


echo "docker-compose run web rake db:create"
docker-compose run web rake db:create

echo "docker-compose up"
docker-compose up