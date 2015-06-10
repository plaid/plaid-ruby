module Plaid
  class PlaidError < StandardError
    attr_reader :code
    
    def initialize(code, msg)
      super(msg)
      @code = code
    end
  end

  class BadRequest < PlaidError
  end

  class Unauthorized < PlaidError
  end

  class RequestFailed < PlaidError
  end

  class NotFound < PlaidError
  end

  class ServerError < PlaidError
  end
end
