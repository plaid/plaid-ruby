require "spec_helper.rb"
require 'yaml'
describe Plaidio, "config" do
  before :all do |c|
    keys = YAML::load(IO.read('./keys.yml'))
    config = Plaidio.config do |p|
      p.customer_id = keys['CUSTOMER_ID']
      p.secret = keys['SECRET']
    end
  end
  
  # Tests the config
  it "returns the secret key and customer_id" do
    config = Plaidio.config do |c|
      c.customer_id = '1234'
      c.secret = 'password'
    end

    expect(config.instance_variable_get(:'@secret')).to eq('password')
    expect(config.instance_variable_get(:'@customer_id')).to eq('1234')
  end
  
end