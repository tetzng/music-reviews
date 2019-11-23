FROM ruby:2.6.5-alpine3.10
ENV LANG C.UTF-8

RUN \
apk add --no-cache --virtual build-dependencies --update \
  build-base \
  linux-headers \
  mariadb-client \
  mariadb-dev \
  tzdata \
  nodejs \
  yarn \
  libxml2-dev \
  libxslt-dev \
  curl-dev \
  make \
  gcc \
  libc-dev \
  g++ \
  imagemagick6-dev && \
  yarn install && \
  rm -rf /usr/local/bundle/cache/* /usr/local/share/.cache/* /var/cache/* /tmp/* && \
  apk del libxml2-dev curl-dev make gcc libc-dev g++

RUN gem install bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

EXPOSE 3000

ARG RAILS_ENV
RUN chmod +x app/script/entrypoint_production.sh
ENTRYPOINT ["/bin/sh", "-c","app/script/entrypoint_${RAILS_ENV}.sh" ]