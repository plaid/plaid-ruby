require 'test_helper'

# The test for Plaid::Account.
class PlaidAccountTest < MiniTest::Test
  def test_initialization
    check_basic_data acc
  end

  def test_initialization_with_numbers
    a = acc_with_numbers
    check_basic_data a

    assert_equal({ routing: '021000021', account: '9900001702',
                   wireRouting: '021000021' }, a.numbers)
  end

  def test_initialization_with_risk
    a = Plaid::Account.new(account_data_with_risk)
    check_basic_data a

    assert_kind_of Plaid::Risk, a.risk
  end

  def test_string_representation
    s = '#<Plaid::Account id="QPO8Jo8vdDHMepg41PBwckXm4KdK1yUdmXOwK", ' \
        'type=:depository, name="Plaid Savings", institution=:chase>'

    assert_equal s, acc.to_s
    assert_equal s, acc.inspect
  end

  def test_merge_updates_data
    accounts = [acc]

    new_data = account_data(available_balance: 1000,
                            current_balance: 1200)
               .merge('risk' => { 'score' => 0.99 })

    new_accounts = [Plaid::Account.new(new_data)]

    Plaid::Account.merge(accounts, new_accounts)

    assert_equal 1, accounts.size
    assert_equal 1000, accounts[0].available_balance
    assert_equal 1200, accounts[0].current_balance

    assert_equal 0.99, accounts[0].risk.score
  end

  def test_merge_adds_new_account
    accounts = [acc]
    new_accounts = [Plaid::Account.new(account_data(id: '123456'))]

    Plaid::Account.merge(accounts, new_accounts)

    assert_equal 2, accounts.size
    assert_equal 'QPO8Jo8vdDHMepg41PBwckXm4KdK1yUdmXOwK', accounts[0].id
    assert_equal '123456', accounts[1].id
  end

  def test_merge_does_not_remove_information
    accounts = [acc_with_numbers]
    new_accounts = [acc]

    Plaid::Account.merge(accounts, new_accounts)

    assert_equal 1, accounts.size
    assert_equal '021000021', accounts[0].numbers[:routing]
  end

  private

  def acc
    @acc ||= Plaid::Account.new(account_data)
  end

  def acc_with_numbers
    @acc_with_numbers ||= Plaid::Account.new(account_data_with_numbers)
  end

  def account_data(available_balance: 1203.42, current_balance: 1274.93,
                   id: 'QPO8Jo8vdDHMepg41PBwckXm4KdK1yUdmXOwK')
    {
      '_id' => id,
      '_item' => 'KdDjmojBERUKx3JkDd9RuxA5EvejA4SENO4AA',
      '_user' => 'eJXpMzpR65FP4RYno6rzuA7OZjd9n3Hna0RYa',
      'balance' => { 'available' => available_balance,
                     'current' => current_balance },
      'institution_type' => 'chase',
      'meta' => { 'name' => 'Plaid Savings', 'number' => '9606' },
      'subtype' => 'savings',
      'type' => 'depository'
    }
  end

  def account_data_with_numbers
    account_data.merge('numbers' => {
                         'routing' => '021000021',
                         'account' => '9900001702',
                         'wireRouting' => '021000021' })
  end

  def account_data_with_risk
    account_data.merge('risk' =>
      { 'reason' => { 'zero_count' => 0.38,
                      'ratio_low_average' => 0.75,
                      'high_risk_class_txns' => 0.73,
                      'bank_transfers' => 0.4,
                      'benfords_law' => 0.65,
                      'transaction_amounts' => 0.78,
                      'additional_risk_class_txns' => 0.94,
                      'foreign_fees' => 0.96,
                      'fraction_bank_fees' => 0.64 },
        'score' => 0.79 })
  end

  def check_basic_data(a)
    assert_equal 'QPO8Jo8vdDHMepg41PBwckXm4KdK1yUdmXOwK', a.id
    assert_equal 'KdDjmojBERUKx3JkDd9RuxA5EvejA4SENO4AA', a.item_id
    assert_equal 1203.42, a.available_balance
    assert_equal 1274.93, a.current_balance
    assert_equal :chase, a.institution
    assert_equal 'Plaid Savings', a.name
    assert_equal({ 'name' => 'Plaid Savings', 'number' => '9606' }, a.meta)
    assert_equal :depository, a.type
    assert_equal 'savings', a.subtype
  end
end
