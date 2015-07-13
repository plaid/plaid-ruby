require 'bundler/setup'
Bundler.setup

require 'plaid'
require 'pry' if ENV['DEBUG']

require 'webmock/rspec'
WebMock.allow_net_connect!

Plaid.config do |p|
  p.customer_id = 'test_id'
  p.secret = 'test_secret'
  p.environment_location = 'https://tartan.plaid.com/'
end
