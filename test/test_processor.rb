require_relative 'test_helper'

# Internal: The test for Plaid::Processor.
class PlaidProcessorTest < PlaidTest
  def setup
    create_item initial_products: [:auth]
  end

  def test_stripe_bank_account_token_create_invalid_account_id
    error = assert_raises(Plaid::InvalidRequestError) do
      client.processor.stripe.bank_account_token.create access_token,
                                                        BAD_STRING
    end

    assert_equal 'INVALID_FIELD', error.error_code
    first = /account_id must be a properly formatted/
    second = /account_id must be a valid account ID/

    assert_match(/#{first}|#{second}/, error.error_message)
  end

  def test_dwolla_processor_token_create_invalid_account_id
    error = assert_raises(Plaid::InvalidRequestError) do
      client.processor.dwolla.processor_token.create access_token,
                                                     BAD_STRING
    end

    assert_equal 'INVALID_FIELD', error.error_code
    assert_match(/account_id must be a properly formatted/, error.error_message)
  end

  def test_ocrolus_processor_token_create_invalid_account_id
    error = assert_raises(Plaid::InvalidRequestError) do
      client.processor.ocrolus.processor_token.create access_token,
                                                      BAD_STRING
    end

    assert_equal 'INVALID_FIELD', error.error_code
    assert_match(/account_id must be a properly formatted/, error.error_message)
  end

  def test_apex_processor_token_create_invalid_account_id
    error = assert_raises(Plaid::InvalidRequestError) do
      client.processor.apex.processor_token.create access_token,
                                                   BAD_STRING
    end

    assert_equal 'INVALID_FIELD', error.error_code
    first = /account_id must be a properly formatted/
    second = /account_id must be a valid account ID/

    assert_match(/#{first}|#{second}/, error.error_message)
  end
end
