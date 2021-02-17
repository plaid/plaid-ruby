require_relative "test_helper"

# Internal: The test for Plaid::Liabilities.
class PlaidLiabilitiesTest < PlaidTest
  def test_get
    create_item initial_products: [:liabilities], institution_id: "ins_1"

    liabilities_get_request = Plaid::LiabilitiesGetRequest.new
    liabilities_get_request.access_token = access_token

    response = client.liabilities_get(liabilities_get_request)

    refute_empty(response.accounts)
    refute_empty(response.liabilities.to_hash)
    refute_empty(response.liabilities.student)
    refute_empty(response.liabilities.credit)
    assert_kind_of(Plaid::LiabilitiesGetResponse, response)

    account_id = response.accounts[7].account_id

    options_payload = {}
    options_payload[:account_ids] = [account_id]

    liabilities_get_request = Plaid::LiabilitiesGetRequest.new
    liabilities_get_request.access_token = access_token
    liabilities_get_request.options = options_payload

    response = client.liabilities_get(
      liabilities_get_request
    )
    assert_equal(1, response.liabilities.student.size)
  end

  def test_get_invalid_access_token
    liabilities_get_request = Plaid::LiabilitiesGetRequest.new
    liabilities_get_request.access_token = BAD_STRING

    begin
      client.liabilities_get(liabilities_get_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end
end