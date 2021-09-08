require_relative "test_helper"

# Internal: The test for Plaid::Item.
class PlaidItemTest < PlaidTest # rubocop:disable Metrics/ClassLength
  def test_create
    create_item
    refute_empty(@item.item.to_hash)

    assert_equal(["transactions"], @item.item.billed_products)
    assert_equal(SANDBOX_INSTITUTION, @item.item.institution_id)
  end

  def test_create_invalid_institution
    begin
      create_item institution_id: BAD_STRING
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_INSTITUTION")
    end
  end

  def test_create_bad_initial_products
    begin
      create_item initial_products: BAD_STRING
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_FIELD")
    end
  end

  def test_create_with_options
    create_item(transactions_start_date: "2016-01-01",
                transactions_end_date: "2016-02-01",
                webhook: "https://plaid.com/webhook-test")

    refute_empty(item.item.to_hash)
    assert_equal("https://plaid.com/webhook-test", item.item.webhook)
  end

  def test_create_with_additional_options
    options = { transactions: { start_date: "2016-01-01",
                                end_date: "2016-02-01" },
                webhook: "https://plaid.com/webhook-test" }

    create_item(options: options)

    refute_empty(item.item.to_hash)
    assert_equal("https://plaid.com/webhook-test", item.item.webhook)
  end

  def test_create_with_options_date_objects
    create_item(transactions_start_date: Date.parse("2016-01-01"),
                transactions_end_date: Date.parse("2017-01-01"),
                webhook: "https://plaid.com/webhook-test")

    refute_empty(item.item.to_hash)
    assert_equal("https://plaid.com/webhook-test", item.item.webhook)
  end

  def test_create_with_invalid_options
    assert_raises(Plaid::ApiError) do
      create_item(transactions_start_date: BAD_STRING,
                  transactions_end_date: BAD_STRING,
                  webhook: BAD_STRING)
    end
  end

  def test_get
    create_item

    item_get_request = Plaid::ItemGetRequest.new
    item_get_request.access_token = access_token

    item = client.item_get(item_get_request)
    refute_empty(item.item.to_hash)
    assert_kind_of(Plaid::ItemGetResponse, item)
  end

  def test_get_valid_access_token
    item_get_request = Plaid::ItemGetRequest.new
    item_get_request.access_token = BAD_STRING

    begin
      item = client.item_get(item_get_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end

  def test_remove
    create_item

    item_remove_request = Plaid::ItemRemoveRequest.new
    item_remove_request.access_token = access_token

    remove_response = client.item_remove(item_remove_request)
    refute_empty(remove_response.to_hash)
    assert_kind_of(Plaid::ItemRemoveResponse, remove_response)

    # Don't remove it in teardown again
    @access_token = nil
  end

  def test_remove_invalid_access_token
    item_remove_request = Plaid::ItemRemoveRequest.new
    item_remove_request.access_token = BAD_STRING

    begin
      remove_response = client.item_remove(item_remove_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end

  def test_public_token_exchange_token
    create_item

    sandbox_public_token_create_request = Plaid::SandboxPublicTokenCreateRequest.new
    sandbox_public_token_create_request.institution_id = SANDBOX_INSTITUTION
    sandbox_public_token_create_request.initial_products = ["transactions"]

    public_token_response = client.sandbox_public_token_create(
      sandbox_public_token_create_request
    )

    refute_empty(public_token_response.public_token)

    item_public_token_exchange_request = Plaid::ItemPublicTokenExchangeRequest.new
    item_public_token_exchange_request.public_token = public_token_response.public_token

    exchange_token_response = client.item_public_token_exchange(
      item_public_token_exchange_request
    )
    refute_empty(exchange_token_response.access_token)
  end

  def test_exchange_token_invalid_public_token
    item_public_token_exchange_request = Plaid::ItemPublicTokenExchangeRequest.new
    item_public_token_exchange_request.public_token = BAD_STRING

    begin
      client.item_public_token_exchange(item_public_token_exchange_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_PUBLIC_TOKEN")
    end
  end

  def test_public_token_sandbox
    sandbox_public_token_create_request = Plaid::SandboxPublicTokenCreateRequest.new
    sandbox_public_token_create_request.institution_id = SANDBOX_INSTITUTION
    sandbox_public_token_create_request.initial_products = ["transactions"]

    public_token_response = client.sandbox_public_token_create(
      sandbox_public_token_create_request
    )
    refute_empty(public_token_response.public_token)
  end

  def test_fire_webhook_sandbox
    sandbox_public_token_create_request = Plaid::SandboxPublicTokenCreateRequest.new
    sandbox_public_token_create_request.institution_id = SANDBOX_INSTITUTION
    sandbox_public_token_create_request.initial_products = ["transactions"]
    sandbox_public_token_create_request.options = {
      webhook: "https://httpstat.us/200"
    }

    public_token_response = client.sandbox_public_token_create(
      sandbox_public_token_create_request
    )

    refute_empty(public_token_response.public_token)

    item_public_token_exchange_request = Plaid::ItemPublicTokenExchangeRequest.new
    item_public_token_exchange_request.public_token = public_token_response.public_token

    exchange_token_response = client.item_public_token_exchange(
      item_public_token_exchange_request
    )

    sandbox_item_fire_webhook_request = Plaid::SandboxItemFireWebhookRequest.new

    sandbox_item_fire_webhook_request.access_token = exchange_token_response.access_token
    sandbox_item_fire_webhook_request.webhook_code = "DEFAULT_UPDATE"

    fire_webhook_response = client.sandbox_item_fire_webhook(
      sandbox_item_fire_webhook_request
    )
    assert_equal true, fire_webhook_response.webhook_fired
  end

  def test_access_token_invalidate
    create_item

    item_access_token_invalidate_request = Plaid::ItemAccessTokenInvalidateRequest.new
    item_access_token_invalidate_request.access_token = access_token

    invalidate_response = client.item_access_token_invalidate(item_access_token_invalidate_request)
    refute_empty(invalidate_response.new_access_token)

    @access_token = invalidate_response.new_access_token
  end

  def test_access_token_invalidate_invalid_access_token
    item_access_token_invalidate_request = Plaid::ItemAccessTokenInvalidateRequest.new
    item_access_token_invalidate_request.access_token = BAD_STRING

    begin
      client.item_access_token_invalidate(item_access_token_invalidate_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end

  def test_webhook_update
    create_item

    item_webhook_update_request = Plaid::ItemWebhookUpdateRequest.new
    item_webhook_update_request.access_token = access_token
    item_webhook_update_request.webhook = "https://plaid.com/webhook-test"

    webhook_response = client.item_webhook_update(
      item_webhook_update_request
    )

    assert_equal "https://plaid.com/webhook-test",
                 webhook_response.item.webhook
  end

  def test_webhook_update_invalid_access_token
    item_webhook_update_request = Plaid::ItemWebhookUpdateRequest.new
    item_webhook_update_request.access_token = BAD_STRING
    item_webhook_update_request.webhook = "https://plaid.com/webhook-test"

    begin
      client.item_webhook_update(item_webhook_update_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_ACCESS_TOKEN")
    end
  end

  def test_webhook_update_invalid_webhook
    create_item

    item_webhook_update_request = Plaid::ItemWebhookUpdateRequest.new
    item_webhook_update_request.access_token = access_token
    item_webhook_update_request.webhook = BAD_STRING

    begin
      client.item_webhook_update(item_webhook_update_request)
    rescue Plaid::ApiError => e
      json_response = JSON.parse(e.response_body)
      assert_equal(json_response["error_code"], "INVALID_FIELD")
    end
  end

  def test_import_item
    item_import_request = Plaid::ItemImportRequest.new

    item_import_request.products = %w[identity auth]
    item_import_request.user_auth = {
      user_id: "user_good",
      auth_token: "pass_good",
    }

    import_response = client.item_import(
      item_import_request
    )
    refute_empty(import_response.access_token)
  end
end
