require 'minitest/autorun'

require_relative '../lib/plaid'

class PlaidTest < MiniTest::Test
  def create_client
    Plaid::Client.new(env: :sandbox,
                      client_id: ENV['PLAID_RUBY_CLIENT_ID'],
                      secret: ENV['PLAID_RUBY_SECRET'],
                      public_key: ENV['PLAID_RUBY_PUBLIC_KEY'])
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
