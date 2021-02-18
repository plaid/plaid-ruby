require_relative 'test_helper'

# Internal: The test for Plaid::Identity.
class PlaidIdentityTest < PlaidTest
  def test_get
    create_item initial_products: [:identity]

    identity_get_request = Plaid::IdentityGetRequest.new
    identity_get_request.access_token = access_token

    response = client.identity_get(identity_get_request)
    assert_kind_of(Plaid::IdentityGetResponse, response)

    refute_empty(response.accounts)

    response.accounts.each do |account|
      refute_empty(account.owners)
      account.owners.each do |identity|
        refute_empty(identity.addresses)
        refute_empty(identity.emails)
        refute_empty(identity.names)
        refute_empty(identity.phone_numbers)
      end
    end
  end

  def test_get_invalid_access_token
    identity_get_request = Plaid::IdentityGetRequest.new
    identity_get_request.access_token = BAD_STRING

    begin
      client.identity_get(identity_get_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end
end