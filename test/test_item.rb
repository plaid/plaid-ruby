require_relative 'plaid_test'

# Internal: The test for Plaid::Item.
class PlaidItemTest < PlaidTest
  def test_create
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    refute_empty(item['access_token'])
    assert_equal(['transactions'], item['item']['billed_products'])
    assert_equal(SANDBOX_INSTITUTION, item['item']['institution_id'])
    refute_includes(item, 'mfa_type')

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_create_invalid_credentials
    client = create_client
    assert_raises(Plaid::ItemError) do
      client.item.create(credentials: INVALID_CREDENTIALS,
                         institution_id: SANDBOX_INSTITUTION,
                         initial_products: [:transactions])
    end
  end

  def test_create_bad_credentials
    client = create_client
    assert_raises(Plaid::InvalidRequestError) do
      client.item.create(credentials: BAD_STRING,
                         institution_id: SANDBOX_INSTITUTION,
                         initial_products: [:transactions])
    end
  end

  def test_create_invalid_institution
    client = create_client
    assert_raises(Plaid::InvalidInputError) do
      client.item.create(credentials: CREDENTIALS,
                         institution_id: BAD_STRING,
                         initial_products: [:transactions])
    end
  end

  def test_create_invalid_initial_products
    client = create_client
    assert_raises(Plaid::InvalidInputError) do
      client.item.create(credentials: CREDENTIALS,
                         institution_id: SANDBOX_INSTITUTION,
                         initial_products: BAD_ARRAY)
    end
  end

  def test_create_bad_initial_products
    client = create_client
    assert_raises(Plaid::InvalidRequestError) do
      client.item.create(credentials: CREDENTIALS,
                         institution_id: SANDBOX_INSTITUTION,
                         initial_products: BAD_STRING)
    end
  end

  def test_create_with_options
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions],
                              transactions_start_date: '2016-01-01',
                              transactions_end_date: '2016-02-01',
                              transactions_await_results: true,
                              webhook: 'https://plaid.com/webhook-test')

    refute_empty(item['access_token'])
    refute_empty(item['item'])
    assert_equal('https://plaid.com/webhook-test', item['item']['webhook'])

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_create_with_additional_options
    client = create_client
    options = { transactions: { start_date: '2016-01-01',
                                end_date: '2016-02-01',
                                await_results: true },
                webhook: 'https://plaid.com/webhook-test' }
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions],
                              options: options)

    refute_empty(item['access_token'])
    refute_empty(item['item'])
    assert_equal('https://plaid.com/webhook-test', item['item']['webhook'])

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_create_with_options_date_objects
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions],
                              transactions_start_date: Date.parse('2016-01-01'),
                              transactions_end_date: DateTime.strptime('2017-01-01', '%Y-%m-%d'),
                              transactions_await_results: true,
                              webhook: 'https://plaid.com/webhook-test')

    refute_empty(item['access_token'])
    refute_empty(item['item'])
    assert_equal('https://plaid.com/webhook-test', item['item']['webhook'])

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_create_with_invalid_options
    client = create_client
    assert_raises(Plaid::InvalidRequestError) do
      client.item.create(credentials: CREDENTIALS,
                         institution_id: SANDBOX_INSTITUTION,
                         initial_products: [:transactions],
                         transactions_start_date: BAD_STRING,
                         transactions_end_date: BAD_STRING,
                         transactions_await_results: BAD_STRING,
                         webhook: BAD_STRING)
    end
  end

  def answer_mfa(client, access_token, data)
    case data['mfa_type']
    when 'questions'
      answer_questions(client, access_token, data['questions'])
    when 'device_list'
      answer_device_list(client, access_token, data['device_list'])
    when 'selections'
      answer_selections(client, access_token, data['selections'])
    when 'device'
      answer_device(client, access_token, data['device'])
    end
  end

  def answer_questions(client, access_token, _questions)
    answers = ['answer_0_0']
    client.item.mfa(access_token, 'questions', answers)
  end

  def answer_device_list(client, access_token, device_list)
    device = device_list[0]['device_id']
    client.item.mfa(access_token, 'device_list', [device])
  end

  def answer_device(client, access_token, _device)
    client.item.mfa(access_token, 'device', ['1234'])
  end

  def answer_selections(client, access_token, _selections)
    answers = %w(tomato ketchup)
    client.item.mfa(access_token, 'selections', answers)
  end

  def test_mfa_device
    client = create_client
    item = client.item.create(credentials: MFA_DEVICE_CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])
    assert_equal('device_list', item['mfa_type'])

    mfa_response = answer_mfa(client, item['access_token'], item)
    assert_equal('device', mfa_response['mfa_type'])

    mfa_response = answer_mfa(client, item['access_token'], mfa_response)
    refute_empty(mfa_response['item'])

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_mfa_selections
    client = create_client
    item = client.item.create(credentials: MFA_SELECTIONS_CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])
    assert_equal('selections', item['mfa_type'])

    mfa_response = answer_mfa(client, item['access_token'], item)
    refute_empty(mfa_response['item'])

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_mfa_questions
    client = create_client
    item = client.item.create(credentials: MFA_QUESTIONS_CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])
    assert_equal('questions', item['mfa_type'])

    mfa_response = answer_mfa(client, item['access_token'], item)
    refute_empty(mfa_response['item'])

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_credentials_update
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    client.sandbox.sandbox_item.reset_login(item['access_token'])

    update_response = client.item.credentials.update(item['access_token'], CREDENTIALS)
    refute_empty(update_response['item'])

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_get
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    client.item.get(item['access_token'])
    refute_empty(item['item'])

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_get_valid_access_token
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    assert_raises(Plaid::InvalidInputError) do
      client.item.get(BAD_STRING)
    end

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_delete
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    access_token = item['access_token']
    delete_response = client.item.delete(access_token)
    assert_equal(true, delete_response['deleted'])
  end

  def test_delete_invalid_access_token
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    assert_raises(Plaid::InvalidInputError) do
      client.item.delete(BAD_STRING)
    end

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_public_token_exchange_token
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    public_token_response = client.item.public_token.create(item['access_token'])
    refute_empty(public_token_response['public_token'])

    exchange_token_response = client.item.public_token.exchange(
      public_token_response['public_token']
    )
    refute_empty(exchange_token_response['access_token'])

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_public_token__invalid_access_token
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    assert_raises(Plaid::InvalidInputError) do
      client.item.public_token.create(BAD_STRING)
    end

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_exchange_token_invalid_public_token
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    assert_raises(Plaid::InvalidInputError) do
      client.item.public_token.exchange(BAD_STRING)
    end

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_access_token_invalidate
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    invalidate_response = client.item.access_token.invalidate(item['access_token'])
    refute_empty(invalidate_response['new_access_token'])

    access_token = invalidate_response['new_access_token']
    client.item.delete(access_token)
  end

  def test_access_token_invalidate_invalid_access_token
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    assert_raises(Plaid::InvalidInputError) do
      client.item.access_token.invalidate(BAD_STRING)
    end

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_access_token_update_version_invalid_access_token
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    assert_raises(Plaid::InvalidRequestError) do
      client.item.access_token.update_version(BAD_STRING)
    end

    access_token = item['access_token']
    client.item.delete(access_token)
  end

  def test_webhook_update
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    webhook_response = client.item.webhook.update(item['access_token'],
                                                  'https://plaid.com/webhook-test')
    assert_equal('https://plaid.com/webhook-test', webhook_response['item']['webhook'])
  end

  def test_webhook_update_invalid_access_token
    client = create_client

    assert_raises(Plaid::InvalidInputError) do
      client.item.webhook.update(BAD_STRING, 'https://plaid.com/webhook-test')
    end
  end

  def test_webhook_update_invalid_webhook
    client = create_client
    item = client.item.create(credentials: CREDENTIALS,
                              institution_id: SANDBOX_INSTITUTION,
                              initial_products: [:transactions])

    assert_raises(Plaid::InvalidRequestError) do
      client.item.webhook.update(item['access_token'], BAD_STRING)
    end
  end
end
