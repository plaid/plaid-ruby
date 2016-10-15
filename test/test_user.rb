require 'test_helper'

# A module with tests and helpers for all products.
module ProductTests
  def setup
    full_test_credentials
  end

  def test_load
    user = Plaid::User.load(product, 't0k3n')

    assert_kind_of Plaid::User, user
    assert_equal product, user.product
    assert_equal 't0k3n', user.access_token
    refute user.mfa?
    assert_nil user.mfa_type
    assert_nil user.mfa

    assert_raises ArgumentError do
      Plaid::User.load(:bad_product, 't0k3n')
    end
  end

  def test_load_custom_client
    client = Plaid::Client.new
    user = Plaid::User.load(product, 't0k3n', client: client)

    assert_same client, user.client
  end

  def test_delete
    user = Plaid::User.load(product, 't0k3n')

    stub_api :delete, product,
             body: credentials,
             response: '{"message": "Successfully removed from system"}'

    assert_equal user, user.delete
    assert_predicate user, :frozen?
  end

  def test_balance
    user = Plaid::User.load(product, 't0k3n')

    stub_api :post, 'balance', body: credentials, response: :connect_add

    accs = user.balance
    assert_equal 1203.42, accs[0].available_balance
  end

  def test_for_product
    user = Plaid::User.load(product, 't0k3n')

    product2 = Plaid::PRODUCTS.reject { |p| p == product }.first

    another = user.for_product(product2)

    refute_same user, another
    assert_equal product2, another.product
    assert_equal 't0k3n', another.access_token
  end

  def test_for_product_with_custom_client
    client = Plaid::Client.new
    user = Plaid::User.load(product, 't0k3n', client: client)

    product2 = Plaid::PRODUCTS.reject { |p| p == product }.first

    another = user.for_product(product2)

    assert_same client, another.client
  end

  def test_upgrade
    user = Plaid::User.load(product, 't0k3n')

    body = credentials.merge(upgrade_to: 'connect')

    stub_api :post, 'upgrade', body: body, response: :connect_add

    another = user.upgrade(:connect)

    refute_same user, another
    assert_equal :connect, another.product

    check_user another
    check_accounts 4, another.accounts
  end

  def test_exchange_token
    body = credentials(access_token: false)
           .merge('public_token' => 'pu61i< T<>k3N')

    stub_api :post, 'exchange_token',
             body: body, response: '{"access_token": "3x<hang3d"}'

    user = Plaid::User.exchange_token('pu61i< T<>k3N',
                                      product: product)

    assert_kind_of Plaid::User, user
    assert_equal '3x<hang3d', user.access_token
    assert_equal product, user.product
    assert_nil user.stripe_bank_account_token
  end

  def test_exchange_token_with_account_id
    body = credentials(access_token: false)
           .merge('public_token' => 'pu61i< T<>k3N',
                  'account_id' => 'abcdef')

    stub_api :post, 'exchange_token',
             body: body, response: :exchange_token

    user = Plaid::User.exchange_token('pu61i< T<>k3N', 'abcdef',
                                      product: product)

    assert_kind_of Plaid::User, user
    assert_equal '3x<hang3d', user.access_token
    assert_equal product, user.product
    assert_equal user.stripe_bank_account_token, 'SBAT'
    assert_equal user.processor_token, 'some-processor-token'
  end

  def test_question_mfa
    # Initial create call
    stub_api :post, product, body: params_for_create, response: :mfa_questions,
                             status: 201

    user = Plaid::User.create(product, :wells, 'plaid_test', 'plaid_good')
    assert_nil user.accounts

    assert_predicate user, :mfa?
    assert_equal :questions, user.mfa_type
    assert_equal([{ question: 'What was the name of your first pet?' }],
                 user.mfa)

    # A call with wrong answer
    body = credentials.merge(mfa: 'wrong_answer')
    stub_api :post, "#{product}/step", body: body, response: :mfa_questions,
                                       status: 201

    user.mfa_step 'wrong_answer'

    assert_predicate user, :mfa?
    assert_equal :questions, user.mfa_type
    assert_equal([{ question: 'What was the name of your first pet?' }],
                 user.mfa)

    # A call with right answer
    body = credentials.merge(mfa: 'right_answer')
    stub_api :post, "#{product}/step", body: body,
                                       response: "#{product}_add".to_sym
    user.mfa_step 'right_answer'

    refute_predicate user, :mfa?
    assert_nil user.mfa_type
    assert_nil user.mfa
    refute_nil user.accounts
  end

  def test_code_mfa
    # Initial create call
    body = params_for_create.merge('options' => '{"list":true}')
    stub_api :post, product, body: body, response: :mfa_list,
                             status: 201

    user = Plaid::User.create(product, :wells, 'plaid_test', 'plaid_good',
                              options: { list: true })

    assert_predicate user, :mfa?
    assert_equal :list, user.mfa_type
    assert_equal([{ mask: 't..t@plaid.com', type: 'email' },
                  { mask: 'xxx-xxx-5309', type: 'phone' },
                  { mask: 'SafePass Card', type: 'card' }], user.mfa)

    # Request to send code
    body = credentials.merge(options: '{"send_method":{"type":"phone"}}')
    stub_api :post, "#{product}/step", body: body, response: :mfa_code_sent,
                                       status: 201

    user.mfa_step send_method: { type: 'phone' }
    assert_predicate user, :mfa?
    assert_equal :device, user.mfa_type
    assert_equal({ message: 'Code sent to xxx-xxx-5309' }, user.mfa)

    # Send right code
    body = credentials.merge(mfa: '777')
    stub_api :post, "#{product}/step", body: body,
                                       response: "#{product}_add".to_sym
    user.mfa_step '777'

    refute_predicate user, :mfa?
    assert_nil user.mfa_type
    assert_nil user.mfa
    refute_nil user.accounts
  end

  def test_patch_mfa
    user = Plaid::User.load(product, 't0k3n')

    stub_api :patch, product, response: :mfa_list, status: 201
    user.update('new_user', 'new_password')

    assert_predicate user, :mfa?
    assert_equal :list, user.mfa_type

    # Request to send code
    stub_api :patch, "#{product}/step", response: :mfa_code_sent, status: 201
    user.mfa_step send_method: { type: 'phone' }

    assert_predicate user, :mfa?
    assert_equal :device, user.mfa_type
    assert_equal({ message: 'Code sent to xxx-xxx-5309' }, user.mfa)

    # Send right code
    stub_api :patch, "#{product}/step", response: "#{product}_add".to_sym
    user.mfa_step '777'

    refute_predicate user, :mfa?
    assert_nil user.mfa_type
    assert_nil user.mfa
    refute_nil user.accounts
  end

  def exchange_token_with_custom_client
    client = custom_client
    body = {
      'client_id' => 'boo',
      'secret' => 'moo',
      'public_token' => 'pu61i< T<>k3N'
    }

    stub_api :post, 'exchange_token',
             body: body, response: '{"access_token": "3x<hang3d"}'

    user = Plaid::User.exchange_token('pu61i< T<>k3N',
                                      product: product,
                                      client: client)

    assert_same client, user.client
  end

  # update_webhook should raise ArgumentError for every product except Connect.
  # Here we test for this exception, and this method gets overriden in
  # PlaidConnectUserTest.
  def test_update_webhook
    user = Plaid::User.load(product, 't0k3n')

    assert_raises ArgumentError do
      user.update_webhook('http://example.org/hook')
    end
  end

  protected

  def credentials(access_token: true)
    { 'client_id' => 'test_id', 'secret' => 'test_secret' }.tap do |h|
      h['access_token'] = 't0k3n' if access_token
    end
  end

  def params_for_create
    credentials(access_token: false)
      .merge('password' => 'plaid_good', 'type' => 'wells',
             'username' => 'plaid_test')
  end

  def create_with_custom_client(response)
    client = custom_client

    body = {
      'client_id' => 'boo',
      'secret' => 'moo',
      'username' => 'plaid_test',
      'password' => 'plaid_good',
      'type' => 'wells'
    }

    stub_api :post, product.to_s, body: body, response: response
    user = Plaid::User.create(product, :wells, 'plaid_test', 'plaid_good',
                              client: client)

    assert_same client, user.client
  end

  def custom_client
    Plaid::Client.new(env: :tartan, client_id: 'boo', secret: 'moo')
  end

  def run_update(fixture_name)
    user = Plaid::User.load(product, 't0k3n')

    body = credentials.merge('password' => 'my_password', 'pin' => '9999',
                             'username' => 'my_user')

    stub_api :patch, product, body: body, response: fixture_name

    user.update('my_user', 'my_password', 9999)
  end

  def check_collection(expected_count, coll, klass)
    assert_equal expected_count, coll.size

    coll.each do |item|
      assert_instance_of klass, item

      yield item if block_given?
    end
  end

  def check_accounts(expected_count, accounts, &block)
    check_collection expected_count, accounts, Plaid::Account, &block
  end

  def check_transactions(expected_count, txs, &block)
    check_collection expected_count, txs, Plaid::Transaction, &block
  end

  def check_user(user)
    assert_instance_of Plaid::User, user
    refute_nil user.access_token
    refute_predicate user, :mfa?
    assert_nil user.mfa_type
    assert_nil user.mfa
  end
end

################################################################################

# Test User for Connect product.
class PlaidConnectUserTest < MiniTest::Test
  include TestHelpers
  include ProductTests

  def product
    :connect
  end

  def test_create_user_login_only
    body = params_for_create.merge('options' => '{"login_only":false}')

    stub_api :post, 'connect', body: body, response: :connect_add

    user = Plaid::User.create(:connect, :wells, 'plaid_test', 'plaid_good',
                              options: { login_only: false })

    check_user user
    check_accounts 4, user.accounts
  end

  def test_create_user_with_transactions
    body = credentials(access_token: false)
           .merge('password' => 'plaid_good', 'type' => 'wells',
                  'username' => 'plaid_test')

    stub_api :post, 'connect', body: body, response: :connect_add_trans

    user = Plaid::User.create(:connect, :wells, 'plaid_test', 'plaid_good')
    check_user user
    check_accounts 4, user.accounts
    check_transactions 16, user.initial_transactions
  end

  def test_create_with_custom_client
    create_with_custom_client :connect_add_trans
  end

  def test_transactions
    user = Plaid::User.load(:connect, 't0k3n')

    stub_api :post, 'connect/get',
             body: credentials.merge('options' => '{"pending":false}'),
             response: :connect_add_trans

    trans = user.transactions

    check_transactions 16, trans
    check_accounts 4, user.accounts
  end

  def test_transactions_arguments
    user = Plaid::User.load(:connect, 't0k3n')

    body = credentials.merge 'options' =>
      '{"pending":false,"account":"123456",'\
      '"gte":"2016-01-01","lte":"2016-04-29"}'

    stub_api :post, 'connect/get', body: body, response: '{}'

    user.transactions(account_id: '123456', start_date: Date.new(2016, 1, 1),
                      end_date: Date.new(2016, 4, 29))
  end

  def test_update
    user = run_update(:connect_add_trans)

    assert_equal 16, user.initial_transactions.size
    check_accounts 4, user.accounts
  end

  # Overrides the method from ProductTests.
  def test_update_webhook
    user = Plaid::User.load(:connect, 't0k3n')

    body = credentials.merge('options' =>
      '{"webhook":"http://example.org/hook"}')

    stub_api :patch, 'connect', body: body, response: :connect_add

    assert_same user, user.update_webhook('http://example.org/hook')
  end
end

################################################################################

# Test User for Auth product.
class PlaidAuthUserTest < MiniTest::Test
  include TestHelpers
  include ProductTests

  def product
    :auth
  end

  def test_create_user
    stub_api :post, 'auth', body: params_for_create, response: :auth_add

    user = Plaid::User.create(:auth, :wells, 'plaid_test', 'plaid_good')
    check_user user
    check_accounts 4, user.accounts do |acc|
      refute_nil acc.numbers
    end
  end

  def test_create_with_custom_client
    create_with_custom_client :auth_add
  end

  def test_auth
    stub_api(:post, 'auth/get', body: credentials, response: :auth_add)
      .then
      .to_raise(RuntimeError)

    a = auth_user.auth

    assert_equal 4, a.size
    refute_nil a[0].numbers

    assert_same a, auth_user.accounts

    # Should not make the request second time!
    a2 = auth_user.auth
    assert_same a, a2
  end

  def test_auth_forced_sync
    stub_api(:post, 'auth/get', body: credentials, response: :auth_add)
      .then
      .to_return(status: 200, body: fixture(:auth_add_2))

    auth_user.auth
    accs = auth_user.auth(sync: true)

    acc = accs.select { |a| a.id == 'pJPM4LMBNQFrOwp0jqEyTwyxJQrQbgU6kq37k' }
              .first
    refute_nil acc

    assert_equal 5000, acc.available_balance
    assert_equal 1000, acc.current_balance
  end

  def test_update
    user = run_update(:auth_add)

    check_accounts 4, user.accounts
  end

  private

  def auth_user
    @auth_user ||= Plaid::User.load(:auth, 't0k3n')
  end
end

################################################################################

# Test User for Info product.
class PlaidInfoUserTest < MiniTest::Test
  include TestHelpers
  include ProductTests

  def product
    :info
  end

  def test_create_user
    stub_api :post, 'info', body: params_for_create, response: :info_add

    user = Plaid::User.create(:info, :wells, 'plaid_test', 'plaid_good')
    check_user user
    check_accounts 4, user.accounts

    refute_nil user.info
    assert_kind_of Plaid::Info, user.info
    assert_equal ['Kelly Walters'], user.info.names
  end

  def test_create_with_custom_client
    create_with_custom_client :info_add
  end

  def test_info
    stub_info_get.then.to_raise(RuntimeError)

    i = info_user.info

    # Should not make the request second time!
    i2 = info_user.info
    assert_same i, i2
  end

  def test_info_forced_sync
    stub_info_get
      .then.to_return(status: 200, body: fixture(:info_add_2))

    i = info_user.info
    assert_equal ['Kelly Walters'], i.names

    i2 = info_user.info(sync: true)
    assert_equal ['Kelly Walters', 'Welly Kalters'], i2.names
  end

  def test_update
    user = run_update(:info_add)
    check_accounts 4, user.accounts
  end

  private

  def info_user
    @info_user ||= Plaid::User.load(:info, 't0k3n')
  end

  def stub_info_get
    stub_api :post, 'info/get', body: credentials, response: :info_add
  end
end

################################################################################

# Test User for Income product.
class PlaidIncomeUserTest < MiniTest::Test
  include TestHelpers
  include ProductTests

  def product
    :income
  end

  def test_create_user
    stub_api :post, 'income', body: params_for_create, response: :income_add

    user = Plaid::User.create(:income, :wells, 'plaid_test', 'plaid_good')
    check_user user
    check_accounts 4, user.accounts

    refute_nil user.income
    assert_kind_of Plaid::Income, user.income
    assert_equal 56_000, user.income.last_year_income
  end

  def test_create_with_custom_client
    create_with_custom_client :income_add
  end

  def test_income
    stub_income_get.then.to_raise(RuntimeError)

    i = income_user.income

    # Should not make the request second time!
    i2 = income_user.income
    assert_same i, i2
  end

  def test_income_forced_sync
    stub_income_get
      .then.to_return(status: 200, body: fixture(:income_add_2))

    i = income_user.income
    assert_equal 56_000, i.last_year_income

    i2 = income_user.income(sync: true)
    assert_equal 156_000, i2.last_year_income
  end

  def test_update
    user = run_update(:income_add)
    assert_kind_of Plaid::Income, user.income
  end

  private

  def income_user
    @income_user ||= Plaid::User.load(:income, 't0k3n')
  end

  def stub_income_get
    stub_api :post, 'income/get', body: credentials, response: :income_add
  end
end

################################################################################

# Test User for Risk product.
class PlaidRiskUserTest < MiniTest::Test
  include TestHelpers
  include ProductTests

  def product
    :risk
  end

  def test_create_user
    stub_api :post, 'risk', body: params_for_create, response: :risk_add

    user = Plaid::User.create(:risk, :wells, 'plaid_test', 'plaid_good')
    check_user user
    check_accounts 4, user.accounts

    assert_kind_of Plaid::Risk, user.accounts[0].risk
    assert_equal 0.79, user.accounts[0].risk.score
  end

  def test_create_with_custom_client
    create_with_custom_client :risk_add
  end

  def test_risk
    stub_risk_get.then.to_raise(RuntimeError)

    r = risk_user.risk

    # Should not make the request second time!
    r2 = risk_user.risk
    assert_same r, r2
  end

  def test_risk_forced_sync
    stub_risk_get
      .then.to_return(status: 200, body: fixture(:risk_add_2))

    r = risk_user.risk[0].risk
    assert_equal 0.79, r.score

    r2 = risk_user.risk(sync: true)[0].risk
    assert_equal 0.89, r2.score
  end

  def test_update
    user = run_update(:risk_add)
    check_accounts 4, user.accounts
  end

  private

  def risk_user
    @risk_user ||= Plaid::User.load(:risk, 't0k3n')
  end

  def stub_risk_get
    stub_api :post, 'risk/get', body: credentials, response: :risk_add
  end
end
