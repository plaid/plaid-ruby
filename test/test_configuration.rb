
require_relative "test_helper"

# Internal: The test for Plaid::Configuration.
class PlaidConfigurationTest < PlaidTest
  def test_api_host
    configuration = Plaid::Configuration.new
    configuration.server_index = 2

    assert_equal "https://sandbox.plaid.com",
                 configuration.base_url

    configuration.server_index = 1
    assert_equal "https://development.plaid.com",
                 configuration.base_url

    configuration.server_index = 0
    assert_equal "https://production.plaid.com",
                 configuration.base_url

    assert_raises(ArgumentError) do
      configuration.server_index = 3
      configuration.base_url
    end
  end
end