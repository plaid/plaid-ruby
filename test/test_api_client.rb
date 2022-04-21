require 'faraday'

require_relative "test_helper"

# Internal: The test for API Client
class APIClientTest < PlaidTest
  def test_api_client_exposes_farday_connection
    configuration = Plaid::Configuration.new
    configuration.server_index = Plaid::Configuration::Environment["sandbox"]
    configuration.timeout = NETWORK_TIMEOUT
    configuration.api_key["PLAID-CLIENT-ID"] = ENV["PLAID_RUBY_CLIENT_ID"]
    configuration.api_key["PLAID-SECRET"] = ENV["PLAID_RUBY_SECRET"]
    configuration.api_key["Plaid-Version"] = "2020-09-14"

    api_client = Plaid::ApiClient.new(
      configuration
    )

    assert_kind_of(Faraday::Connection, api_client.connection)
  end
end
