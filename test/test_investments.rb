require 'date'

require_relative 'test_helper'

# Internal: The test for Plaid::Investments.
class PlaidInvestmentsTest < PlaidTest # rubocop:disable Metrics/ClassLength
  def setup
    create_item initial_products: [:investments],
                transactions_start_date: '2019-05-28',
                transactions_end_date: '2019-06-12',
                transactions_await_results: true
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength

  def test_investment_transactions_get
    response = client.investments.transactions.get(access_token,
                                                   '2019-05-28',
                                                   '2019-06-12')
    refute_empty(response['accounts'])
    refute_empty(response['investment_transactions'])

    investment_account = response['accounts'].find do |account|
      account['type'] == 'investment'
    end
    account_ids = [investment_account['account_id']]
    response = client.investments.transactions.get(access_token,
                                                   '2019-05-28',
                                                   '2019-06-12',
                                                   account_ids: account_ids)
    refute_empty(response['investment_transactions'])
    response['investment_transactions'].each do |transaction|
      refute_nil(transaction['investment_transaction_id'])
      refute_nil(transaction['account_id'])
      refute_nil(transaction['date'])
      refute_nil(transaction['name'])
      refute_nil(transaction['amount'])
    end
  end

  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize

  def test_investment_transactions_get_date_objects
    response = client.investments.transactions.get(access_token,
                                                   '2019-05-28',
                                                   '2019-06-12')
    refute_empty(response['accounts'])
    refute_empty(response['investment_transactions'])

    investment_account = response['accounts'].find do |account|
      account['type'] == 'investment'
    end
    account_ids = [investment_account['account_id']]
    response = client.investments.transactions.get(access_token,
                                                   Date.parse('2019-05-28'),
                                                   Date.parse('2019-06-12'),
                                                   account_ids: account_ids)
    refute_empty(response['investment_transactions'])
  end

  # rubocop:enable Metrics/AbcSize

  def test_investment_transactions_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.investments.transactions.get(BAD_STRING,
                                          '2019-05-28',
                                          '2019-06-12')
    end
  end

  def test_investment_transactions_get_invalid_dates
    assert_raises(Plaid::InvalidRequestError) do
      client.investments.transactions.get(access_token, BAD_STRING, BAD_STRING)
    end
  end

  def test_investment_transactions_get_with_options
    response = client.investments.transactions.get(access_token,
                                                   '2019-05-28',
                                                   '2019-06-12',
                                                   count: 2,
                                                   offset: 1)
    assert_equal(2, response['investment_transactions'].length)
  end

  def test_investment_transactions_get_with_additional_options
    response = client.investments.transactions.get(access_token,
                                                   '2019-05-28',
                                                   '2019-06-12',
                                                   options: { count: 2,
                                                              offset: 1 })
    assert_equal(2, response['investment_transactions'].length)
  end

  def test_investment_transactions_get_invalid_options
    assert_raises(Plaid::InvalidRequestError) do
      client.investments.transactions.get(access_token,
                                          '2019-05-28',
                                          '2019-06-12',
                                          count: BAD_STRING,
                                          offset: BAD_STRING)
    end
  end

  # rubocop:disable Metrics/AbcSize

  def test_holdings_get
    response = client.investments.holdings.get(access_token)
    refute_empty(response.accounts)
    refute_empty(response.holdings)
    refute_empty(response.securities)

    investment_account = response['accounts'].find do |account|
      account['type'] == 'investment'
    end
    account_id = investment_account.account_id
    response = client.investments.holdings.get(access_token,
                                               account_ids: [account_id])
    response.holdings.each do |holding|
      assert_equal account_id, holding.account_id
    end

    options = { account_ids: [account_id] }
    response = client.investments.holdings.get(access_token,
                                               options: options)
    response.holdings.each do |holding|
      assert_equal account_id, holding.account_id
    end
  end

  # rubocop:enable Metrics/AbcSize

  def test_holdings_get_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.investments.holdings.get(BAD_STRING)
    end
  end

  def test_holdings_get_invalid_options
    assert_raises(Plaid::InvalidRequestError) do
      client.investments.holdings.get(access_token, account_ids: BAD_STRING)
    end
  end
end
