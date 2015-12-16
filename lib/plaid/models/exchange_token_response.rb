module Plaid
  class ExchangeTokenResponse
    attr_accessor :access_token
    attr_accessor :stripe_bank_account_token

    def initialize(fields = {})
      @access_token = fields['access_token']
      @stripe_bank_account_token = fields['stripe_bank_account_token']
    end
  end
end
