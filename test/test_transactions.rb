require "date"

require_relative "test_helper"

# Internal: The test for Plaid::Transactions.
class PlaidTransactionsTest < PlaidTest # rubocop:disable Metrics/ClassLength
  START_DATE = (Date.today - 365)
  END_DATE = Date.today

  def setup
    create_item initial_products: [:transactions],
                transactions_start_date: START_DATE,
                transactions_end_date: END_DATE
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/LineLength
  # rubocop:disable Style/GuardClause

  # Helper method to get transactions - retry up to 5 times with
  # a backoff delay to wait out PRODUCT_NOT_READY errors
  def get_transactions_with_retries(access_token, start_date, end_date, count: nil, offset: nil, account_ids: nil, options: nil)
    num_retries = 5
    retries = 0
    while retries < num_retries
      retries += 1
      begin
        options_payload = {}
        options_payload[:account_ids] = account_ids unless account_ids.nil?
        options_payload[:count] = count unless count.nil?
        options_payload[:offset] = offset unless offset.nil?
        options_payload.merge!(options) unless options.nil?

        transactions_get_request = Plaid::TransactionsGetRequest.new
        transactions_get_request.access_token = access_token
        transactions_get_request.start_date = start_date
        transactions_get_request.end_date = end_date
        transactions_get_request.options = options_payload

        response = client.transactions_get(transactions_get_request)
      rescue Plaid::ApiError => e
        if retries < num_retries
          sleep(retries * 2)
          next
        else
          raise e
        end
      end
    end
    response
  end

  def test_get
    response = get_transactions_with_retries(access_token,
                                             START_DATE,
                                             END_DATE)

    refute_empty(response.accounts)
    refute_empty(response.transactions)

    account_id = response.accounts[0].account_id
    response = get_transactions_with_retries(access_token,
                                             START_DATE,
                                             END_DATE,
                                             account_ids: [account_id])
    refute_empty(response.transactions)

    response.transactions.each do |transaction|
      refute_nil(transaction.transaction_id)
      refute_nil(transaction.account_id)
      refute_nil(transaction.pending)
      refute_nil(transaction.transaction_type)
      refute_nil(transaction.payment_meta)
      refute_nil(transaction.date)
      refute_nil(transaction.name)
      refute_nil(transaction.amount)
      refute_nil(transaction.location)
      refute_nil(transaction.iso_currency_code)
    end
  end

  # # rubocop:enable Metrics/MethodLength
  # # rubocop:enable Metrics/LineLength
  # # rubocop:enable Style/GuardClause

  def test_get_date_objects
    response = get_transactions_with_retries(access_token,
                                             START_DATE,
                                             END_DATE)
    refute_empty(response.accounts)
    refute_empty(response.transactions)

    account_id = response.accounts[0].account_id
    response = get_transactions_with_retries(access_token,
                                             START_DATE,
                                             END_DATE,
                                             account_ids: [account_id])
    refute_empty(response.transactions)
  end

  def test_get_invalid_access_token
    begin
      get_transactions_with_retries(BAD_STRING, START_DATE, END_DATE)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end

  def test_get_invalid_dates
    begin
      get_transactions_with_retries(access_token, BAD_STRING, BAD_STRING)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_FIELD")
    end
  end

  def test_get_with_options
    response = get_transactions_with_retries(access_token,
                                             START_DATE,
                                             END_DATE,
                                             count: 2,
                                             offset: 1)
    assert_equal(2, response.transactions.length)
  end

  def test_get_with_additional_options
    response = get_transactions_with_retries(access_token,
                                             START_DATE,
                                             END_DATE,
                                             options: { count: 2,
                                                        offset: 1 })
    assert_equal(2, response.transactions.length)
  end

  def test_get_invalid_options
    begin
      get_transactions_with_retries(access_token,
                                    START_DATE,
                                    END_DATE,
                                    count: BAD_STRING,
                                    offset: BAD_STRING)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_FIELD")
    end
  end

  def test_refresh_invalid_access_token
    transactions_refresh_request = Plaid::TransactionsRefreshRequest.new
    transactions_refresh_request.access_token = BAD_STRING

    begin
      client.transactions_refresh(transactions_refresh_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end

  def test_refresh
    transactions_refresh_request = Plaid::TransactionsRefreshRequest.new
    transactions_refresh_request.access_token = access_token

    response = client.transactions_refresh(transactions_refresh_request)
  end
end
