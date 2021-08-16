require_relative "test_helper"

# Internal: The test for Plaid::Processor.
class PlaidProcessorTest < PlaidTest
  def setup
    create_item initial_products: [:auth]
  end

  def test_stripe_bank_account_token_create_invalid_account_id
    processor_token_create_request = Plaid::ProcessorStripeBankAccountTokenCreateRequest.new
    processor_token_create_request.access_token = access_token
    processor_token_create_request.account_id = BAD_STRING

    begin
      client.processor_stripe_bank_account_token_create processor_token_create_request
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_FIELD")
      assert_equal(json_response["error_message"], "account_id must be a valid account ID")
    end
  end

  def test_dwolla_processor_token_create_invalid_account_id
    processor_token_create_request = Plaid::ProcessorTokenCreateRequest.new
    processor_token_create_request.access_token = access_token
    processor_token_create_request.account_id = BAD_STRING
    processor_token_create_request.processor = "dwolla"

    begin
      client.processor_token_create processor_token_create_request
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_FIELD")
      assert_equal(json_response["error_message"], "account_id must be a valid account ID")
    end
  end

  def test_ocrolus_processor_token_create_invalid_account_id
    processor_token_create_request = Plaid::ProcessorTokenCreateRequest.new
    processor_token_create_request.access_token = access_token
    processor_token_create_request.account_id = BAD_STRING
    processor_token_create_request.processor = "ocrolus"

    begin
      client.processor_token_create processor_token_create_request
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_FIELD")
      assert_equal(json_response["error_message"], "account_id must be a valid account ID")
    end
  end
end
