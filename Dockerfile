FROM 245200388354.dkr.ecr.us-east-1.amazonaws.com/docker-hub/library/ruby:3.0.0

# Create app directory
WORKDIR /usr/src/app

# Copy app to directory
COPY . /usr/src/app

ENV BUNDLER_VERSION 2.2.9
RUN gem update --system
RUN gem install bundler:2.2.9
RUN bundle install

CMD ["bundle", "exec", "rake", "test"]
