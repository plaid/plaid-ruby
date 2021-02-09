require 'json'
require 'net/http'
require 'uri'

require_relative 'version'

module Plaid
  # Internal: The Faraday middleware used to catch errors.
  class Middleware < ::Faraday::Response::Middleware
    # Internal: Headers used for correct request and SDK tracking.
    NETWORK_HEADERS = { 'User-Agent'    => "Plaid Ruby v#{Plaid::VERSION}",
                        'Content-Type'  => 'application/json',
                        'Plaid-Version' => Plaid::API_VERSION }.freeze

    # Internal: Default read timeout for HTTP calls in seconds.
    NETWORK_TIMEOUT = 600
    # Internal: Status codes recognized as client or server errors.
    ERROR_STATUSES = 400...600

    def on_complete(env)
      return unless ERROR_STATUSES.include?(env[:status])

      error_class = Plaid::Error.error_from_type(env.body['error_type'])

      raise error_class.new(env.body['error_type'],
                            env.body['error_code'],
                            env.body['error_message'],
                            env.body['display_message'],
                            env.body['request_id'])
    end
  end
end
