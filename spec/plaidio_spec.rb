require "spec_helper.rb"

describe Plaidio, "config" do
  # Run the config before all.
  before(:all) do

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