require 'date'

require_relative 'test_helper'

# Internal: The test for Plaid::Transactions.
class PlaidTransactionsTest < PlaidTest # rubocop:disable Metrics/ClassLength
  def setup
    create_item initial_products: [:transactions],
                transactions_start_date: '2018-01-01',
                transactions_end_date: '2019-01-01'
  end

  # rubocop:disable Metrics/AbcSize
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
        response = client.transactions.get(access_token, start_date, end_date, account_ids: account_ids, count: count, offset: offset, options: options)
      rescue Plaid::ItemError => e
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
                                             '2018-01-01',
                                             '2019-01-01')
    refute_empty(response['accounts'])
    refute_empty(response['transactions'])

    account_id = response['accounts'][0]['account_id']
    response = get_transactions_with_retries(access_token,
                                             '2018-01-01',
                                             '2019-01-01',
                                             account_ids: [account_id])
    refute_empty(response['transactions'])
    response['transactions'].each do |transaction|
      refute_nil(transaction['transaction_id'])
      refute_nil(transaction['account_id'])
      refute_nil(transaction['pending'])
      refute_nil(transaction['transaction_type'])
      refute_nil(transaction['payment_meta'])
      refute_nil(transaction['date'])
      refute_nil(transaction['name'])
      refute_nil(transaction['amount'])
      refute_nil(transaction['location'])
      refute_nil(transaction['iso_currency_code'])
    end
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/LineLength
  # rubocop:enable Style/GuardClause

  def test_get_date_objects
    response = get_transactions_with_retries(access_token,
                                             '2018-01-01',
                                             '2019-01-01')
    refute_empty(response['accounts'])
    refute_empty(response['transactions'])

    account_id = response['accounts'][0]['account_id']
    response = get_transactions_with_retries(access_token,
                                             Date.parse('2018-01-01'),
                                             Date.parse('2019-01-01'),
                                             account_ids: [account_id])
    refute_empty(response['transactions'])
  end

  def test_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      get_transactions_with_retries(BAD_STRING, '2018-01-01', '2019-01-01')
    end
  end

  def test_get_invalid_dates
    assert_raises(Plaid::InvalidRequestError) do
      get_transactions_with_retries(access_token, BAD_STRING, BAD_STRING)
    end
  end

  def test_get_with_options
    response = get_transactions_with_retries(access_token,
                                             '2018-01-01',
                                             '2019-01-01',
                                             count: 2,
                                             offset: 1)
    assert_equal(2, response['transactions'].length)
  end

  def test_get_with_additional_options
    response = get_transactions_with_retries(access_token,
                                             '2018-01-01',
                                             '2019-01-01',
                                             options: { count: 2,
                                                        offset: 1 })
    assert_equal(2, response['transactions'].length)
  end

  def test_get_invalid_options
    assert_raises(Plaid::InvalidRequestError) do
      get_transactions_with_retries(access_token,
                                    '2018-01-01',
                                    '2019-01-01',
                                    count: BAD_STRING,
                                    offset: BAD_STRING)
    end
  end

  def test_refresh_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.transactions.refresh(BAD_STRING)
    end
  end

  def test_refresh
    client.transactions.refresh(access_token)
  end
end
