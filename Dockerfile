FROM ruby:2.4-alpine

WORKDIR /app

RUN apk add git
RUN gem install bundler:1.16.2

COPY Gemfile Gemfile.lock plaid.gemspec /app/

COPY lib/plaid/version.rb /app/lib/plaid/version.rb

RUN bundle install

COPY . /app
