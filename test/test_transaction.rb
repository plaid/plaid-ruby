require 'test_helper'

# Internal: The test for Plaid::Transaction.
class PlaidTransactionTest < MiniTest::Test
  def test_initialization
    trans = Plaid::Transaction.new(parsed_transaction_data)

    assert_equal '0AZ0De04KqsreDgVwM1RSRYjyd8yXxSDQ8Zxn', trans.id
    assert_equal 'XARE85EJqKsjxLp6XR8ocg8VakrkXpTXmRdOo', trans.account_id
    assert_equal Date.new(2014, 7, 21), trans.date
    assert_equal 200, trans.amount
    assert_equal 'ATM Withdrawal', trans.name
    assert_equal({ location: { 'city' => 'San Francisco', 'state' => 'CA' } },
                 trans.meta)
    assert_equal({ 'city' => 'San Francisco', 'state' => 'CA' }, trans.location)

    refute trans.pending
    refute_predicate trans, :pending?

    assert_equal({ location: { 'city' => 1, 'state' => 1 }, name: 1 },
                 trans.score)
    assert_equal({ primary: :special }, trans.type)

    assert_equal %w(Transfer Withdrawal ATM), trans.category_hierarchy
    assert_equal '21012002', trans.category_id
    assert_equal 'Nw83eMkqVXSaZvM17aVqtoOwLo1nOAipXeZ74',
                 trans.pending_transaction_id
    assert_equal '1000001', trans.reference_number
  end

  def test_pending
    trans = Plaid::Transaction.new(parsed_transaction_data(pending: true))

    assert trans.pending
    assert_predicate trans, :pending?
  end

  def test_string_representation
    trans = Plaid::Transaction.new(parsed_transaction_data)

    s = '#<Plaid::Transaction id="0AZ0De04KqsreDgVwM1RSRYjyd8yXxSDQ8Zxn", '\
        'account_id="XARE85EJqKsjxLp6XR8ocg8VakrkXpTXmRdOo", date=2014-07-21, '\
        'amount=200, name="ATM Withdrawal", pending=false>'

    assert_equal s, trans.to_s
    assert_equal s, trans.inspect
  end

  private

  def parsed_transaction_data(pending: false)
    { '_account' => 'XARE85EJqKsjxLp6XR8ocg8VakrkXpTXmRdOo',
      '_id' => '0AZ0De04KqsreDgVwM1RSRYjyd8yXxSDQ8Zxn',
      'amount' => 200,
      'date' => '2014-07-21',
      'name' => 'ATM Withdrawal',
      'meta' => {
        'location' => {
          'city' => 'San Francisco',
          'state' => 'CA' } },
      'pending' => pending,
      '_reference_number' => '1000001',
      '_pendingTransaction' => 'Nw83eMkqVXSaZvM17aVqtoOwLo1nOAipXeZ74',
      'type' => { 'primary' => 'special' },
      'category' => %w(Transfer Withdrawal ATM),
      'category_id' => '21012002',
      'score' => {
        'location' => { 'city' => 1, 'state' => 1 }, 'name' => 1 } }
  end
end
