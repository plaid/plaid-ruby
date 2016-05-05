module Plaid
  # Public: Exception to throw when there are configuration problems
  class NotConfiguredError < StandardError; end

  # Internal: Base class for Plaid errors
  class PlaidError < StandardError
    attr_reader :code, :resolve

    # Internal: Initialize a error with proper attributes.
    #
    # code    - The Integer code (e.g. 1501).
    # message - The String message, describing the error.
    # resolve - The String description how to fix the error.
    def initialize(code, message, resolve)
      @code = code
      @resolve = resolve

      super "Code #{@code}: #{message}. #{resolve}"
    end
  end

  # Public: Exception which is thrown when Plaid API returns a 400 response.
  class BadRequestError    < PlaidError; end

  # Public: Exception which is thrown when Plaid API returns a 401 response.
  class UnauthorizedError  < PlaidError; end

  # Public: Exception which is thrown when Plaid API returns a 402 response.
  class RequestFailedError < PlaidError; end

  # Public: Exception which is thrown when Plaid API returns a 404 response.
  class NotFoundError      < PlaidError; end

  # Public: Exception which is thrown when Plaid API returns a response which
  # is neither 2xx, nor 4xx. Presumably 5xx.
  class ServerError        < PlaidError; end
end
