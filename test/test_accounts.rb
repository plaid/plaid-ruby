require_relative "test_helper"

# Internal: The test for Plaid::AccountsGetRequest.
class PlaidAccountsTest < PlaidTest
  def setup
    create_item initial_products: [:transactions]
  end

  def test_get
    accounts_get_request = Plaid::AccountsGetRequest.new
    accounts_get_request.access_token = access_token

    response = client.accounts_get(accounts_get_request)
    refute_empty(response.to_hash)
    assert_kind_of(Plaid::AccountsGetResponse, response)

    account_id = response.accounts[0].account_id

    options_payload = {}
    options_payload[:account_ids] = [account_id]
    accounts_get_request.options = options_payload

    response_w_id = client.accounts_get(accounts_get_request)
    assert_equal(1, response_w_id.accounts.size)
  end

  def test_get_invalid_access_token
    accounts_get_request = Plaid::AccountsGetRequest.new
    accounts_get_request.access_token = BAD_STRING

    begin
      client.accounts_get(accounts_get_request)
    rescue Plaid::ApiError => e
      assert_equal(e.data["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end

  def test_get_invalid_options
    accounts_get_request = Plaid::AccountsGetRequest.new
    accounts_get_request.access_token = access_token

    options_payload = {}
    options_payload[:account_ids] = [BAD_STRING]
    accounts_get_request.options = options_payload

    begin
      client.accounts_get(accounts_get_request)
    rescue Plaid::ApiError => e
      assert_equal(e.data["error_code"], "INVALID_FIELD")
    end
  end

  def test_balance_get
    balance_get_request = Plaid::AccountsBalanceGetRequest.new
    balance_get_request.access_token = access_token

    response = client.accounts_balance_get(balance_get_request)
    refute_empty(response.accounts)
    assert_kind_of(Plaid::AccountsGetResponse, response)

    account_id = response.accounts[0].account_id

    options_payload = {}
    options_payload[:account_ids] = [account_id]

    accounts_balance_get_request = Plaid::AccountsBalanceGetRequest.new
    accounts_balance_get_request.access_token = access_token
    accounts_balance_get_request.options = options_payload

    response_w_id = client.accounts_balance_get(accounts_balance_get_request)
    assert_equal 1, response_w_id.accounts.size
  end

  def test_balance_get_invalid_access_token
    accounts_balance_get_request = Plaid::AccountsBalanceGetRequest.new
    accounts_balance_get_request.access_token = BAD_STRING

    begin
      client.accounts_balance_get(accounts_balance_get_request)
    rescue Plaid::ApiError => e
      assert_equal(e.data["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end

  def test_balance_get_invalid_options
    options_payload = {}
    options_payload[:account_ids] = [BAD_STRING]

    accounts_balance_get_request = Plaid::AccountsBalanceGetRequest.new
    accounts_balance_get_request.access_token = access_token
    accounts_balance_get_request.options = options_payload

    begin
      client.accounts_balance_get(accounts_balance_get_request)
    rescue Plaid::ApiError => e
      assert_equal(e.data["error_code"], "INVALID_FIELD")
    end
  end
end