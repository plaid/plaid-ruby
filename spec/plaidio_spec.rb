require "spec_helper.rb"
require 'yaml'
require 'json'
describe Plaidio, "Call" do
  before :all do |c|
    keys = YAML::load(IO.read('./keys.yml'))
    config = Plaidio.config do |p|
      p.customer_id = keys['CUSTOMER_ID']
      p.secret = keys['SECRET']
    end
  end

  it "returns a response code of 200" do
    response = Plaidio.call.add_account("amex","plaid_test","plaid_good","test@gmail.com")
    expect(response[:code]).to eq(200)
  end

  it "calls get_place and returns a response code of 200" do
    place = Plaidio.call.get_place('52a77fea4a2eab775f004109')
    expect(place[:code]).to eq(200)
  end

  it "returns a response code of 201" do
    type = "bofa"
    username = "plaid_test"
    password = "plaid_good"
    email = "test@gmail.com"
    response = Plaidio.call.add_account(type,username,password,email)
  end

end

describe Plaidio, "Customer" do
  before :all do |c|
    keys = YAML::load(IO.read('./keys.yml'))
    config = Plaidio.config do |p|
      p.customer_id = keys['CUSTOMER_ID']
      p.secret = keys['SECRET']
    end
  end

  it "calls get_transactions and returns a response code of 200" do
    transactions = Plaidio.customer.get_transactions("test")
    expect(transactions[:code]).to eq(200)
  end

  it "calls mfa_step and returns a response code of 200" do
    new_account = Plaidio.customer.mfa_step("test","tomato")
    expect(new_account[:code]).to eq(200)
  end

  it "calls delete_account and returns a resonse code of 200" do
    message = Plaidio.customer.delete_account("test")
    expect(message[:code]).to eq(200)
  end
end
