require "spec_helper.rb"

describe Plaidio, "config" do
  # Run the config before all.
  before(:all) do
    Plaidio.config do |config|
      config.customer_id = '1234'
      config.secret = 'password'
    end
  end
  
  # Tests the config
  it "returns the secret key and customer_id" do
    fred = Plaidio.call.new
    puts fred.inspect
  end
  
end