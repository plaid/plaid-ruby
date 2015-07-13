module Plaid
  class PlaidError < StandardError
    attr_reader :code
    attr_reader :resolve
    
    def initialize(code, message, resolve)
      super(message)
      @code = code
      @resolve = resolve
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
