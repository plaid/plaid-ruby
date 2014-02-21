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

  it "returns a response code of 200" do
    type = "amex"
    username = "plaid_test"
    password = "plaid_good"
    email = "test@gmail.com"
    new_account = Plaidio.call.add_account(type,username,password,email)
    expect(new_account.code).to eq(200)
  end

  it "returns a response code of 200" do
    access_token = "test"
    transactions = Plaidio.customer(access_token).get_transactions
    expect(transactions.code).to eq(200)
  end
end