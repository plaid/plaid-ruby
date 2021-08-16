require "date"

require_relative "test_helper"

# Internal: The test for Plaid::Investments.
class PlaidInvestmentsTest < PlaidTest # rubocop:disable Metrics/ClassLength
  START_DATE = (Date.today - 365)
  END_DATE = Date.today

  def setup
    create_item initial_products: [:investments],
                transactions_start_date: START_DATE,
                transactions_end_date: END_DATE
  end

  # rubocop:disable Metrics/MethodLength

  def test_investment_transactions_get
    investments_transactions_get_request = Plaid::InvestmentsTransactionsGetRequest.new
    investments_transactions_get_request.access_token = access_token
    investments_transactions_get_request.start_date = START_DATE
    investments_transactions_get_request.end_date = END_DATE

    response = client.investments_transactions_get(investments_transactions_get_request)

    refute_empty(response.accounts)
    refute_empty(response.investment_transactions)
    assert_kind_of(Plaid::InvestmentsTransactionsGetResponse, response)

    investment_account = response.accounts.find do |account|
      account.type == "investment"
    end

    account_ids = [investment_account.account_id]
    options_payload = {}
    options_payload[:account_ids] = account_ids

    investments_transactions_get_request = Plaid::InvestmentsTransactionsGetRequest.new
    investments_transactions_get_request.access_token = access_token
    investments_transactions_get_request.options = options_payload
    investments_transactions_get_request.start_date = START_DATE
    investments_transactions_get_request.end_date = END_DATE

    response = client.investments_transactions_get(investments_transactions_get_request)

    refute_empty(response.investment_transactions)
    assert_kind_of(Plaid::InvestmentsTransactionsGetResponse, response)

    response.investment_transactions.each do |transaction|
      refute_nil(transaction.investment_transaction_id)
      refute_nil(transaction.account_id)
      refute_nil(transaction.date)
      refute_nil(transaction.name)
      refute_nil(transaction.amount)
    end
  end

  # rubocop:enable Metrics/MethodLength

  def test_investment_transactions_get_date_objects
    investments_transactions_get_request = Plaid::InvestmentsTransactionsGetRequest.new
    investments_transactions_get_request.access_token = access_token
    investments_transactions_get_request.start_date = START_DATE
    investments_transactions_get_request.end_date = END_DATE

    response = client.investments_transactions_get(investments_transactions_get_request)

    refute_empty(response.accounts)
    refute_empty(response.investment_transactions)
    assert_kind_of(Plaid::InvestmentsTransactionsGetResponse, response)

    investment_account = response.accounts.find do |account|
      account.type == "investment"
    end

    account_ids = [investment_account.account_id]
    options_payload = {}
    options_payload[:account_ids] = account_ids

    investments_transactions_get_request = Plaid::InvestmentsTransactionsGetRequest.new
    investments_transactions_get_request.access_token = access_token
    investments_transactions_get_request.options = options_payload
    investments_transactions_get_request.start_date = START_DATE
    investments_transactions_get_request.end_date = END_DATE

    response = client.investments_transactions_get(investments_transactions_get_request)
    refute_empty(response.investment_transactions)
  end

  def test_investment_transactions_get_invalid_access_token
    begin
      investments_transactions_get_request = Plaid::InvestmentsTransactionsGetRequest.new
      investments_transactions_get_request.access_token = BAD_STRING
      investments_transactions_get_request.start_date = START_DATE
      investments_transactions_get_request.end_date = END_DATE

      client.investments_transactions_get(investments_transactions_get_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end

  def test_investment_transactions_get_invalid_dates
    begin
      investments_transactions_get_request = Plaid::InvestmentsTransactionsGetRequest.new
      investments_transactions_get_request.access_token = access_token
      investments_transactions_get_request.start_date = BAD_STRING
      investments_transactions_get_request.end_date = BAD_STRING

      client.investments_transactions_get(investments_transactions_get_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_FIELD")
    end
  end

  def test_investment_transactions_get_with_options
    options_payload = {}
    options_payload[:count] = 2
    options_payload[:offset] = 1

    investments_transactions_get_request = Plaid::InvestmentsTransactionsGetRequest.new
    investments_transactions_get_request.access_token = access_token
    investments_transactions_get_request.options = options_payload
    investments_transactions_get_request.start_date = START_DATE
    investments_transactions_get_request.end_date = END_DATE

    response = client.investments_transactions_get(investments_transactions_get_request)
    assert_equal(2, response.investment_transactions.length)
    assert_kind_of(Plaid::InvestmentsTransactionsGetResponse, response)
  end

  def test_investment_transactions_get_invalid_options
    begin
      options_payload = {}
      options_payload[:count] = BAD_STRING
      options_payload[:offset] = BAD_STRING

      investments_transactions_get_request = Plaid::InvestmentsTransactionsGetRequest.new
      investments_transactions_get_request.access_token = access_token
      investments_transactions_get_request.start_date = BAD_STRING
      investments_transactions_get_request.end_date = BAD_STRING

      client.investments_transactions_get(investments_transactions_get_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_FIELD")
    end
  end

  def test_holdings_get
    investments_holdings_get_request = Plaid::InvestmentsHoldingsGetRequest.new
    investments_holdings_get_request.access_token = access_token

    response = client.investments_holdings_get(investments_holdings_get_request)

    refute_empty(response.accounts)
    refute_empty(response.holdings)
    refute_empty(response.securities)

    investment_account = response.accounts.find do |account|
      account.type == "investment"
    end

    account_id = investment_account.account_id
    investments_holdings_get_request = Plaid::InvestmentsHoldingsGetRequest.new
    investments_holdings_get_request.access_token = access_token

    options_payload = {}
    options_payload[:account_ids] = [account_id]
    investments_holdings_get_request.options = options_payload

    response = client.investments_holdings_get(investments_holdings_get_request)

    response.holdings.each do |holding|
      assert_equal account_id, holding.account_id
    end
  end

  def test_holdings_get_invalid_access_token
    investments_holdings_get_request = Plaid::InvestmentsHoldingsGetRequest.new
    investments_holdings_get_request.access_token = BAD_STRING

    begin
      response = client.investments_holdings_get(investments_holdings_get_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end

  def test_holdings_get_invalid_options
    investments_holdings_get_request = Plaid::InvestmentsHoldingsGetRequest.new
    investments_holdings_get_request.access_token = access_token

    options_payload = {}
    options_payload[:account_ids] = [BAD_STRING]
    investments_holdings_get_request.options = options_payload

    begin
      response = client.investments_holdings_get(investments_holdings_get_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_FIELD")
    end
  end
end