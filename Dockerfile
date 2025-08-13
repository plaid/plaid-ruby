# Note: This image is also built in CircleCI, so limit references to internal repositories.
# Keep this in sync with the image in plaid-ruby-release Jenkinsfile
FROM ruby:3.2.0

# Create app directory
WORKDIR /usr/src/app

# Copy app to directory
COPY . /usr/src/app

ENV BUNDLER_VERSION 2.2.9
RUN gem update --system
RUN gem install bundler:2.2.9
RUN bundle install

CMD ["bundle", "exec", "rake", "test"]
