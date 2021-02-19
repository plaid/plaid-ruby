FROM ruby:2.7.1

# Create app directory
WORKDIR /usr/src/app

# Copy app to directory
COPY . /usr/src/app

RUN gem install bundler:2.2.9
RUN bundle install

CMD ["bundle", "exec", "rake", "test"]