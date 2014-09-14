require "spec_helper.rb"
describe Plaid, "Call" do
  before :all do |c|
    Plaid.config do |p|
      p.customer_id = 'test_id'
      p.secret      = 'test_secret'
    end
  end

  it "adds the test account and returns 200" do
    response = Plaid.call.add_account "amex",
                                      "plaid_test",
                                      "plaid_good",
                                      "test@gmail.com"
    expect(response[:code]).to eq(200)
  end

  it "retrieves test transactions sucessfully" do
    Plaid.call.add_account "amex",
                                      "plaid_test",
                                      "plaid_good",
                                      "test@gmail.com"

    response = Plaid.customer.get_transactions 'test'
    expect(response[:code]).to eq(200)
  end

  it "calls get_place and returns a response code of 200" do
    id = '52a77fea4a2eab775f004109'
    place = Plaid.call.get_place(id)
    expect(place[:code]).to eq(200)
  end

  it "returns a response code of 201" do
    Plaid.call.add_account("bofa","plaid_test","plaid_good","test@gmail.com")
  end

end

describe Plaid, "Customer" do
  before :all do |c|
    Plaid.config do |p|
      p.customer_id = 'test_id'
      p.secret      = 'test_secret'
    end
  end

  it "calls get_transactions and returns a response code of 200" do
    transactions = Plaid.customer.get_transactions("test")
    expect(transactions[:code]).to eq(200)
  end

  it "calls mfa_step and returns a response code of 200" do
    response = Plaid.call.add_account "us",
                                      "plaid_test",
                                      "plaid_good",
                                      "test@gmail.com"
    new_account = Plaid.customer.mfa_step("test","tomato")
    expect(new_account[:code]).to eq(200)
  end

  it "calls delete_account and returns a response code of 200" do
    message = Plaid.customer.delete_account("test")
    expect(message[:code]).to eq(200)
  end
end
