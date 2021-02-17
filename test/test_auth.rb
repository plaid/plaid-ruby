require_relative 'test_helper'

# Internal: The test for Plaid::Auth.
class PlaidAuthTest < PlaidTest
  def setup
    create_item initial_products: [:auth]
  end

  def test_get
    auth_get_request = Plaid::AuthGetRequest.new
    auth_get_request.access_token = access_token

    response = client.auth_get(auth_get_request)
    assert_kind_of(Plaid::AuthGetResponse, response)

    refute_empty(response.accounts)
    refute_nil(response.numbers)
    assert_kind_of(Plaid::AuthGetNumbers, response.numbers)

    account_id = response.accounts[0].account_id
    auth_get_request = Plaid::AuthGetRequest.new

    options_payload = {}
    options_payload[:account_ids] = [account_id]

    auth_get_request.access_token = access_token
    auth_get_request.options = options_payload

    response = client.auth_get(auth_get_request)
    assert_equal 1, response.numbers.ach.size
  end

  def test_get_invalid_access_token
    auth_get_request = Plaid::AuthGetRequest.new
    auth_get_request.access_token = BAD_STRING

    begin
      client.auth_get(auth_get_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end

  def test_get_invalid_options
    auth_get_request = Plaid::AuthGetRequest.new

    options_payload = {}
    options_payload[:account_ids] = [BAD_STRING]

    auth_get_request.access_token = access_token
    auth_get_request.options = options_payload

    begin
      client.auth_get(auth_get_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_FIELD")
    end
  end
end