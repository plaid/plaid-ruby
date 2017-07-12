require_relative 'test_helper'

# Internal: The test for Plaid::Client.
class PlaidClientTest < PlaidTest
  unless STUB_API
    def test_env_setting
      client = Plaid::Client.new(env: :sandbox,
                                 client_id: ENV['PLAID_RUBY_CLIENT_ID'],
                                 secret: ENV['PLAID_RUBY_SECRET'],
                                 public_key: ENV['PLAID_RUBY_PUBLIC_KEY'])
      assert_equal(Plaid.url_from_env(:sandbox), client.instance_variable_get(:@env))

      client = Plaid::Client.new(env: :development,
                                 client_id: ENV['PLAID_RUBY_CLIENT_ID'],
                                 secret: ENV['PLAID_RUBY_SECRET'],
                                 public_key: ENV['PLAID_RUBY_PUBLIC_KEY'])
      assert_equal(Plaid.url_from_env(:development), client.instance_variable_get(:@env))

      assert_raises(ArgumentError) do
        Plaid::Client.new(env: :BAD_ENV,
                          client_id: ENV['PLAID_RUBY_CLIENT_ID'],
                          secret: ENV['PLAID_RUBY_SECRET'],
                          public_key: ENV['PLAID_RUBY_PUBLIC_KEY'])
      end
    end
  end
end
