require_relative 'test_helper'

# Internal: The test for Plaid::Item.
class PlaidItemTest < PlaidTest # rubocop:disable Metrics/ClassLength
  def test_create
    create_item
    refute_empty(item.item)

    assert_equal(['transactions'], @item.item.billed_products)
    assert_equal(SANDBOX_INSTITUTION, @item.item.institution_id)
    refute_includes(item, 'mfa_type')
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
                webhook: 'https://plaid.com/webhook-test')

    refute_empty(item.item)
    assert_equal('https://plaid.com/webhook-test', item.item.webhook)
  end

  def test_create_with_additional_options
    options = { transactions: { start_date: '2016-01-01',
                                end_date: '2016-02-01' },
                webhook: 'https://plaid.com/webhook-test' }

    create_item(options: options)

    refute_empty(item.item)
    assert_equal('https://plaid.com/webhook-test', item.item.webhook)
  end

  def test_create_with_options_date_objects
    create_item(transactions_start_date: Date.parse('2016-01-01'),
                transactions_end_date: Date.parse('2017-01-01'),
                webhook: 'https://plaid.com/webhook-test')

    refute_empty(item.item)
    assert_equal('https://plaid.com/webhook-test', item.item.webhook)
  end

  def test_create_with_invalid_options
    assert_raises(Plaid::InvalidRequestError) do
      create_item(transactions_start_date: BAD_STRING,
                  transactions_end_date: BAD_STRING,
                  webhook: BAD_STRING)
    end
  end

  def test_get
    create_item

    item = client.item.get(access_token)
    refute_empty(item.item)
    # TODO: undo skip item.status test as is non-deterministic
    # refute_empty(item.status)
  end

  def test_get_valid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.item.get(BAD_STRING)
    end
  end

  def test_remove
    create_item

    remove_response = client.item.remove(access_token)
    assert_equal(true, remove_response.removed)

    # Don't remove it in teardown again
    @access_token = nil
  end

  def test_remove_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.item.remove(BAD_STRING)
    end
  end

  def test_public_token_exchange_token
    create_item

    public_token_response = client.item.public_token.create(access_token)
    refute_empty(public_token_response.public_token)

    exchange_token_response = client.item.public_token.exchange(
      public_token_response.public_token
    )
    refute_empty(exchange_token_response.access_token)
  end

  def test_public_token_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.item.public_token.create(BAD_STRING)
    end
  end

  def test_add_token_create
    add_token_response = client.item.add_token.create(
      client_user_id: '123-fake-user-id'
    )
    refute_empty(add_token_response.add_token)
    refute_empty(add_token_response.expiration)
  end

  def test_add_token_create_with_user_fields
    add_token_response = client.item.add_token.create(
      client_user_id: '123-fake-user-id',
      legal_name: 'John Doe',
      phone_number: '+1 415 555 0123',
      phone_number_verified_time: '2020-01-01T00:00:00Z',
      email_address: 'example@plaid.com',
      email_address_verified_time: '2020-01-01T00:00:00Z'
    )
    refute_empty(add_token_response.add_token)
    refute_empty(add_token_response.expiration)
  end

  def test_exchange_token_invalid_public_token
    assert_raises(Plaid::InvalidInputError) do
      client.item.public_token.exchange(BAD_STRING)
    end
  end

  def test_public_token_sandbox
    public_token_response = client.sandbox.sandbox_public_token.create(
      institution_id: SANDBOX_INSTITUTION,
      initial_products: ['transactions']
    )
    refute_empty(public_token_response.public_token)
  end

  def test_fire_webhook_sandbox
    public_token_response = client.sandbox.sandbox_public_token.create(
      institution_id: SANDBOX_INSTITUTION,
      initial_products: ['transactions'],
      webhook: 'https://httpstat.us/200'
    )
    refute_empty(public_token_response.public_token)
    exchange_token_response = client.item.public_token.exchange(
      public_token_response.public_token
    )
    fire_webhook_response = client.sandbox.sandbox_item.fire_webhook(
      exchange_token_response.access_token,
      'DEFAULT_UPDATE'
    )
    assert_equal true, fire_webhook_response.webhook_fired
  end

  def test_access_token_invalidate
    create_item

    invalidate_response = client.item.access_token.invalidate(access_token)
    refute_empty(invalidate_response.new_access_token)

    @access_token = invalidate_response.new_access_token
  end

  def test_access_token_invalidate_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.item.access_token.invalidate(BAD_STRING)
    end
  end

  def test_webhook_update
    create_item

    webhook_response = client.item.webhook.update(
      access_token,
      'https://plaid.com/webhook-test'
    )

    assert_equal 'https://plaid.com/webhook-test',
                 webhook_response.item.webhook
  end

  def test_webhook_update_invalid_access_token
    assert_raises(Plaid::InvalidInputError) do
      client.item.webhook.update(BAD_STRING, 'https://plaid.com/webhook-test')
    end
  end

  def test_webhook_update_invalid_webhook
    create_item

    assert_raises(Plaid::InvalidRequestError) do
      client.item.webhook.update(access_token, BAD_STRING)
    end
  end

  def test_import_item
    import_response = client.item.import(
      %w[identity auth],
      {
        user_id: 'user_good',
        auth_token: 'pass_good'
      },
      {}
    )
    refute_empty(import_response.access_token)
  end
end
