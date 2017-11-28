require_relative 'test_helper'

# Internal: The test for Plaid::Item.
class PlaidItemTest < PlaidTest
  def teardown
    if defined?(@access_token) && @access_token
      @client.item.remove(@access_token)
    end
  end

  def test_create
    create_item credentials: CREDENTIALS
    refute_empty(@item['item'])

    assert_equal(['transactions'], @item['item']['billed_products'])
    assert_equal(SANDBOX_INSTITUTION, @item['item']['institution_id'])
    refute_includes(@item, 'mfa_type')
  end

  def test_create_invalid_credentials
    assert_raises(Plaid::ItemError) do
      create_item credentials: INVALID_CREDENTIALS
    end
  end

  def test_create_bad_credentials
    assert_raises(Plaid::InvalidRequestError) do
      create_item credentials: BAD_STRING
    end
  end

  def test_create_invalid_institution
    assert_raises(Plaid::InvalidInputError) do
      create_item institution_id: BAD_STRING
    end
  end

  def test_create_invalid_initial_products
    assert_raises(Plaid::InvalidInputError) do
      create_item initial_products: BAD_ARRAY
    end
  end

  def test_create_bad_initial_products
    assert_raises(Plaid::InvalidRequestError) do
      create_item initial_products: BAD_STRING
    end
  end

  def test_create_with_options
    create_item(transactions_start_date: '2016-01-01',
                transactions_end_date: '2016-02-01',
                transactions_await_results: true,
                webhook: 'https://plaid.com/webhook-test')

    refute_empty(@item['item'])
    assert_equal('https://plaid.com/webhook-test', @item['item']['webhook'])
  end

  def test_create_with_additional_options
    options = { transactions: { start_date: '2016-01-01',
                                end_date: '2016-02-01',
                                await_results: true },
                webhook: 'https://plaid.com/webhook-test' }

    create_item(options: options)

    refute_empty(@item['item'])
    assert_equal('https://plaid.com/webhook-test', @item['item']['webhook'])
  end

  def test_create_with_options_date_objects
    create_item(transactions_start_date: Date.parse('2016-01-01'),
                transactions_end_date: DateTime.strptime('2017-01-01', '%Y-%m-%d'),
                transactions_await_results: true,
                webhook: 'https://plaid.com/webhook-test')

    refute_empty(@item['item'])
    assert_equal('https://plaid.com/webhook-test', @item['item']['webhook'])
  end

  def test_create_with_invalid_options
    assert_raises(Plaid::InvalidRequestError) do
      create_item(transactions_start_date: BAD_STRING,
                  transactions_end_date: BAD_STRING,
                  transactions_await_results: BAD_STRING,
                  webhook: BAD_STRING)
    end
  end

  def test_mfa_device
    create_item credentials: MFA_DEVICE_CREDENTIALS
    assert_equal('device_list', @item['mfa_type'])

    mfa_response = answer_mfa(@item)
    assert_equal('device', mfa_response['mfa_type'])

    mfa_response = answer_mfa(mfa_response)
    refute_empty(mfa_response['item'])
  end

  def test_mfa_selections
    create_item credentials: MFA_SELECTIONS_CREDENTIALS
    assert_equal('selections', @item['mfa_type'])

    mfa_response = answer_mfa(@item)
    refute_empty(mfa_response['item'])
  end

  def test_mfa_questions
    create_item credentials: MFA_QUESTIONS_CREDENTIALS
    assert_equal('questions', @item['mfa_type'])

    mfa_response = answer_mfa(@item)
    refute_empty(mfa_response['item'])
  end

  def test_credentials_update
    create_item
    @client.sandbox.sandbox_item.reset_login(@access_token)

    update_response = @client.item.credentials.update(@access_token, CREDENTIALS)
    refute_empty(update_response['item'])
  end

  def test_get
    create_item

    item = @client.item.get(@access_token)
    refute_empty(item['item'])
  end

  def test_get_valid_access_token
    create_item

    assert_raises(Plaid::InvalidInputError) do
      @client.item.get(BAD_STRING)
    end
  end

  def test_delete
    create_item

    delete_response = @client.item.delete(@access_token)
    assert_equal(true, delete_response['deleted'])

    # Don't delete it in teardown again
    @access_token = nil
  end

  def test_delete_invalid_access_token
    create_item

    assert_raises(Plaid::InvalidInputError) do
      @client.item.delete(BAD_STRING)
    end
  end

  def test_remove
    create_item

    remove_response = @client.item.remove(@access_token)
    assert_equal(true, remove_response['removed'])

    # Don't remove it in teardown again
    @access_token = nil
  end

  def test_remove_invalid_access_token
    create_item

    assert_raises(Plaid::InvalidInputError) do
      @client.item.remove(BAD_STRING)
    end
  end

  def test_public_token_exchange_token
    create_item

    public_token_response = @client.item.public_token.create(@access_token)
    refute_empty(public_token_response['public_token'])

    exchange_token_response = @client.item.public_token.exchange(
      public_token_response['public_token']
    )
    refute_empty(exchange_token_response['access_token'])
  end

  def test_public_token_invalid_access_token
    create_item

    assert_raises(Plaid::InvalidInputError) do
      @client.item.public_token.create(BAD_STRING)
    end
  end

  def test_exchange_token_invalid_public_token
    create_item

    assert_raises(Plaid::InvalidInputError) do
      @client.item.public_token.exchange(BAD_STRING)
    end
  end

  def test_access_token_invalidate
    create_item

    invalidate_response = @client.item.access_token.invalidate(@access_token)
    refute_empty(invalidate_response['new_access_token'])

    @access_token = invalidate_response['new_access_token']
  end

  def test_access_token_invalidate_invalid_access_token
    create_item

    assert_raises(Plaid::InvalidInputError) do
      @client.item.access_token.invalidate(BAD_STRING)
    end
  end

  def test_access_token_update_version_invalid_access_token
    create_item

    assert_raises(Plaid::InvalidRequestError) do
      @client.item.access_token.update_version(BAD_STRING)
    end
  end

  def test_webhook_update
    create_item

    webhook_response = @client.item.webhook.update(@access_token,
                                                  'https://plaid.com/webhook-test')
    assert_equal('https://plaid.com/webhook-test', webhook_response['item']['webhook'])
  end

  def test_webhook_update_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      @client.item.webhook.update(BAD_STRING, 'https://plaid.com/webhook-test')
    end
  end

  def test_webhook_update_invalid_webhook
    create_item

    assert_raises(Plaid::InvalidRequestError) do
      @client.item.webhook.update(@access_token, BAD_STRING)
    end
  end

  protected

  def create_item(credentials: CREDENTIALS,
                  institution_id: SANDBOX_INSTITUTION,
                  initial_products: [:transactions],
                  transactions_start_date: nil,
                  transactions_end_date: nil,
                  transactions_await_results: nil,
                  webhook: nil,
                  options: nil)

    @item = @client.item.create(credentials: credentials,
                                institution_id: institution_id,
                                initial_products: initial_products,
                                transactions_start_date: transactions_start_date,
                                transactions_end_date: transactions_end_date,
                                transactions_await_results: transactions_await_results,
                                webhook: webhook,
                                options: options)

    @access_token = @item['access_token']
    refute_empty(@access_token)
  end

  def answer_mfa(data)
    case data['mfa_type']
    when 'questions'
      answer_questions(data['questions'])
    when 'device_list'
      answer_device_list(data['device_list'])
    when 'selections'
      answer_selections(data['selections'])
    when 'device'
      answer_device(data['device'])
    end
  end

  def answer_questions(*)
    answers = ['answer_0_0']
    @client.item.mfa(@access_token, 'questions', answers)
  end

  def answer_device_list(device_list)
    device = device_list[0]['device_id']
    @client.item.mfa(@access_token, 'device_list', [device])
  end

  def answer_device(*)
    @client.item.mfa(@access_token, 'device', ['1234'])
  end

  def answer_selections(*)
    answers = %w(tomato ketchup)
    @client.item.mfa(@access_token, 'selections', answers)
  end
end
