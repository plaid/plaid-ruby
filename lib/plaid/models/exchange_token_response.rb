module Plaid
  class ExchangeTokenResponse
    attr_accessor :access_token

    def initialize(fields = {})
      @access_token = fields['access_token']
    end
  end
end
