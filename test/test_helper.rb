require 'minitest/autorun'
require 'minitest/around/unit'

STUB_API = !ENV['STUB_API'].nil?

if STUB_API
  require 'webmock/minitest'
  require 'vcr'

  VCR.configure do |config|
    config.cassette_library_dir = 'test/vcr_cassettes'
    config.hook_into :webmock
  end
end

require_relative '../lib/plaid'

# We support "all" and "none" here. "once" and "new_episodes" won't work due to
# need to hide auth params (the client will use real client_id and secret, but
# cassettes will hold stubbed values).
RECORD_MODE = (ENV['RECORD_MODE'] || 'none').to_sym

class PlaidTest < MiniTest::Test
  def create_client
    client_id = ENV['PLAID_RUBY_CLIENT_ID']
    secret = ENV['PLAID_RUBY_SECRET']
    public_key = ENV['PLAID_RUBY_PUBLIC_KEY']

    if STUB_API && RECORD_MODE == :none
      # In non-recording mode we use stubs for auth
      # (see also task :vcr_hide_credentials in Rakefile)
      client_id = 'PLAID_RUBY_CLIENT_ID'
      secret = 'PLAID_RUBY_SECRET'
      public_key = 'PLAID_RUBY_PUBLIC_KEY'
    end

    @client = Plaid::Client.new(env: :sandbox,
                                client_id: client_id,
                                secret: secret,
                                public_key: public_key)
  end

  def around(&block)
    create_client

    if STUB_API
      cassette = "#{self.class}_#{self.name}"
      VCR.use_cassette(cassette, record: RECORD_MODE, match_requests_on: [:method, :uri, :body]) do
        block.call
      end
    else
      block.call
    end
  end

  BAD_STRING = 'ABCDEFG1234567'.freeze

  BAD_ARRAY = ['ABCDEFG1234567'].freeze

  CREDENTIALS = { username: 'user_good',
                  password: 'pass_good' }.freeze

  MFA_DEVICE_CREDENTIALS = { username: 'user_good',
                             password: 'mfa_device' }.freeze

  MFA_SELECTIONS_CREDENTIALS = { username: 'user_good',
                                 password: 'mfa_selections' }.freeze

  MFA_QUESTIONS_CREDENTIALS = { username: 'user_good',
                                password: 'mfa_questions_1_1' }.freeze

  INVALID_CREDENTIALS = { username: 'user_bad',
                          password: 'pass_bad' }.freeze

  SANDBOX_INSTITUTION = 'ins_109508'.freeze

  SANDBOX_INSTITUTION_NAME = 'First Platypus Bank'.freeze

  SANDBOX_INSTITUTIONS = %w(ins_109508 ins_109509 ins_109510 ins_109511 ins_109512).freeze
end
