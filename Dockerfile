FROM ruby:2.3-slim

MAINTAINER Kdanmobile <dev@kdanmobile.com>

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV PROJECT_ROOT /dojo

RUN mkdir -p $PROJECT_ROOT

WORKDIR $PROJECT_ROOT

COPY . .

RUN gem install bundler

RUN bundle install

EXPOSE 3000

CMD bundle exec rails s -p 3000 -b 0.0.0.0
