require 'minitest/autorun'
require 'minitest/around/unit'

require_relative '../lib/plaid'

STUB_API = !ENV['STUB_API'].nil?

if STUB_API
  require 'vcr'

  VCR.configure do |config|
    config.cassette_library_dir = 'test/vcr_cassettes'
    config.hook_into :faraday
  end
end

# We support "all" and "none" here. "once" and "new_episodes" won't work due to
# need to hide auth params (the client will use real client_id and secret, but
# cassettes will hold stubbed values).
RECORD_MODE = (ENV['RECORD_MODE'] || 'none').to_sym

# Using strict models to catch any new fields returned by the API
Plaid.relaxed_models = false

class PlaidTest < MiniTest::Test
  attr_reader :client, :item, :access_token

  def create_client
    client_id = ENV['PLAID_RUBY_CLIENT_ID']
    secret = ENV['PLAID_RUBY_SECRET']

    if STUB_API && RECORD_MODE == :none
      # In non-recording mode we use stubs for auth
      # (see also task :vcr_hide_credentials in Rakefile)
      client_id = 'PLAID_RUBY_CLIENT_ID'
      secret = 'PLAID_RUBY_SECRET'
    end

    @client = Plaid::Client.new(env: :sandbox,
                                client_id: client_id,
                                secret: secret)
  end

  # Helper used to create a test item with given products
  def create_item(institution_id: SANDBOX_INSTITUTION,
                  initial_products: [:transactions],
                  transactions_start_date: nil,
                  transactions_end_date: nil,
                  webhook: nil,
                  options: nil)

    public_token_response = client.sandbox.sandbox_public_token.create(
      institution_id: institution_id,
      initial_products: initial_products,
      transactions_start_date: transactions_start_date,
      transactions_end_date: transactions_end_date,
      webhook: webhook,
      options: options
    )

    # public_token must be present
    refute_empty(public_token_response.public_token)

    # exchange public_token for access_token
    exchange_token_response = client.item.public_token.exchange(
      public_token_response.public_token
    )

    @access_token = exchange_token_response.access_token
    refute_empty(@access_token)

    @item = client.item.get(@access_token)
    refute_empty(@item)
  end

  def teardown
  end

  # This method is called around every test method.
  def around
    create_client

    if STUB_API
      cassette = "#{self.class}_#{name}"
      VCR.use_cassette(cassette, record: RECORD_MODE,
                                 match_requests_on: %i[method uri body]) do
        yield
      end
    else
      yield
    end
  end

  BAD_STRING = 'ABCDEFG1234567'.freeze

  BAD_ARRAY = ['ABCDEFG1234567'].freeze

  SANDBOX_INSTITUTION = 'ins_109508'.freeze

  SANDBOX_INSTITUTION_NAME = 'First Platypus Bank'.freeze

  SANDBOX_INSTITUTIONS = %w[ins_109508 ins_109509 ins_109510
                            ins_109511 ins_109512].freeze
end
