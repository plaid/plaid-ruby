require 'date'

require_relative 'test_helper'

# Internal: The test for Plaid::Transactions.
class PlaidTransactionsTest < PlaidTest
  def setup
    create_item initial_products: [:transactions],
                transactions_start_date: '2016-01-01',
                transactions_end_date: '2017-01-01',
                transactions_await_results: true
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength

  def test_get
    response = client.transactions.get(access_token, '2016-01-01', '2017-01-01')
    refute_empty(response['accounts'])
    refute_empty(response['transactions'])

    account_id = response['accounts'][0]['account_id']
    response = client.transactions.get(access_token,
                                       '2016-01-01',
                                       '2017-01-01',
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

  def test_get_date_objects
    response = client.transactions.get(access_token, '2016-01-01', '2017-01-01')
    refute_empty(response['accounts'])
    refute_empty(response['transactions'])

    account_id = response['accounts'][0]['account_id']
    response = client.transactions.get(access_token,
                                       Date.parse('2016-01-01'),
                                       Date.parse('2017-01-01'),
                                       account_ids: [account_id])
    refute_empty(response['transactions'])
  end

  def test_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.transactions.get(BAD_STRING, '2016-01-01', '2017-01-01')
    end
  end

  def test_get_invalid_dates
    assert_raises(Plaid::InvalidRequestError) do
      client.transactions.get(access_token, BAD_STRING, BAD_STRING)
    end
  end

  def test_get_with_options
    response = client.transactions.get(access_token,
                                       '2016-01-01',
                                       '2017-01-01',
                                       count: 2,
                                       offset: 1)
    assert_equal(2, response['transactions'].length)
  end

  def test_get_with_additional_options
    response = client.transactions.get(access_token,
                                       '2016-01-01',
                                       '2017-01-01',
                                       options: { count: 2,
                                                  offset: 1 })
    assert_equal(2, response['transactions'].length)
  end

  def test_get_invalid_options
    assert_raises(Plaid::InvalidRequestError) do
      client.transactions.get(access_token,
                              '2016-01-01',
                              '2017-01-01',
                              count: BAD_STRING,
                              offset: BAD_STRING)
    end
  end
end
