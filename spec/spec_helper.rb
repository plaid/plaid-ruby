require 'bundler/setup'
Bundler.setup

require 'plaidio' # and any other gems you need

Plaidio.config do |c|
  c.customer_id = '1234'
  c.secret = 'password'
end

RSpec.configure do |config|
  config.order = "random"
end