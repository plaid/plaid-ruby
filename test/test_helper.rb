require "minitest/autorun"
require "minitest/around/unit"
require "json"

require_relative "../lib/plaid"

# Internal: Default read timeout for HTTP calls in seconds.
NETWORK_TIMEOUT = 600

class PlaidTest < MiniTest::Test
  attr_reader :client, :item, :access_token

  def create_client
    configuration = Plaid::Configuration.new
    configuration.server_index = Plaid::Configuration::Environment["sandbox"]
    configuration.timeout = NETWORK_TIMEOUT
    configuration.api_key["PLAID-CLIENT-ID"] = ENV["PLAID_RUBY_CLIENT_ID"]
    configuration.api_key["PLAID-SECRET"] = ENV["PLAID_RUBY_SECRET"]
    configuration.api_key["Plaid-Version"] = "2020-09-14"

    api_client = Plaid::ApiClient.new(
      configuration
    )

    @client = Plaid::PlaidApi.new(api_client)
    @client_id = ENV["PLAID_RUBY_CLIENT_ID"]
  end

  # Helper used to create a test item with given products
  def create_item(institution_id: SANDBOX_INSTITUTION,
                  initial_products: [:transactions],
                  transactions_start_date: nil,
                  transactions_end_date: nil,
                  webhook: nil,
                  options: nil)
    sandbox_public_token_create_request = Plaid::SandboxPublicTokenCreateRequest.new

    options_payload = {}
    options_payload[:webhook] = webhook unless webhook.nil?
    options_payload[:transactions] = {
      start_date: transactions_start_date.is_a?(String) ? transactions_start_date : transactions_start_date.to_date.strftime("%Y-%m-%d"),
      end_date: transactions_end_date.is_a?(String) ? transactions_end_date : transactions_end_date.to_date.strftime("%Y-%m-%d"),
    } unless transactions_start_date.nil? || transactions_end_date.nil?
    options_payload = options_payload.merge(options) unless options.nil?

    sandbox_public_token_create_request.options = options_payload
    sandbox_public_token_create_request.institution_id = institution_id
    sandbox_public_token_create_request.initial_products = initial_products

    begin
      public_token_response = @client.sandbox_public_token_create(sandbox_public_token_create_request)
    end

    # public_token must be present
    refute_empty(public_token_response.to_hash)

    public_token = public_token_response.public_token

    # exchange public_token for access_token
    item_public_token_exchange_request = Plaid::ItemPublicTokenExchangeRequest.new
    item_public_token_exchange_request.public_token = public_token

    exchange_token_response = client.item_public_token_exchange(item_public_token_exchange_request)

    @access_token = exchange_token_response.access_token
    refute_empty(@access_token)

    item_get_request = Plaid::ItemGetRequest.new
    item_get_request.access_token = @access_token

    @item = client.item_get(item_get_request)
    refute_empty(@item.to_hash)
  end

  # If create_item was used, remove the item
  def teardown
    if access_token
      item_remove_request = Plaid::ItemRemoveRequest.new
      item_remove_request.access_token = access_token

      begin
        @client.item_remove(item_remove_request)
      end
    end
  end

  # This method is called around every test method.
  def around
    create_client
    yield
  end

  BAD_STRING = "ABCDEFG1234567".freeze

  BAD_ARRAY = ["ABCDEFG1234567"].freeze

  SANDBOX_INSTITUTION = "ins_109508".freeze

  SANDBOX_INSTITUTION_NAME = "First Platypus Bank".freeze

  SANDBOX_INSTITUTIONS = %w[ins_109508 ins_109509 ins_109510
                            ins_109511 ins_109512].freeze

  # NOTE: Data is only generated over the past 2 years.  Ensure that the date
  # range used for transactions/get is within 2 years old or otherwise the tests will not work properly

  START_DATE = "2020-01-01".freeze
  END_DATE = "2021-01-01".freeze
end
