FROM ruby:2.7.1

# Create app directory
WORKDIR /usr/src/app

# Copy app to directory
COPY . /usr/src/app

RUN bundle install

CMD ["bundle", "exec", "rake", "test"]