require_relative 'test_helper'

# Internal: The test for Plaid::Client.
class PlaidClientTest < PlaidTest
  def test_api_host
    client = Plaid::Client.new(env: :sandbox,
                               client_id: ENV['PLAID_RUBY_CLIENT_ID'],
                               secret: ENV['PLAID_RUBY_SECRET'])
    assert_equal 'https://sandbox.plaid.com',
                 client.instance_variable_get(:@api_host)

    client = Plaid::Client.new(env: :development,
                               client_id: ENV['PLAID_RUBY_CLIENT_ID'],
                               secret: ENV['PLAID_RUBY_SECRET'])
    assert_equal 'https://development.plaid.com',
                 client.instance_variable_get(:@api_host)

    assert_raises(ArgumentError) do
      Plaid::Client.new(env: :BAD_ENV,
                        client_id: ENV['PLAID_RUBY_CLIENT_ID'],
                        secret: ENV['PLAID_RUBY_SECRET'])
    end
  end
end
