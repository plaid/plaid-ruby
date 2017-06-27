require 'json'
require 'net/http'
require 'uri'

require_relative 'version'

module Plaid
  class Middleware < ::Faraday::Response::Middleware
    # Internal: Headers used for correct request and SDK tracking.
    NETWORK_HEADERS = { 'User-Agent'   => "Plaid Ruby v#{Plaid::VERSION}",
                        'Content-Type' => 'application/json' }.freeze

    # Internal: Default read timeout for HTTP calls in seconds.
    NETWORK_TIMEOUT = 600

    def on_complete(env)
      return unless Faraday::Response::RaiseError::ClientErrorStatuses.include?(env[:status])
      raise Plaid::Error.error_from_type(env.body['error_type']).new(env.body['error_type'],
                                                                     env.body['error_code'],
                                                                     env.body['error_message'],
                                                                     env.body['display_message'],
                                                                     env.body['request_id'])
    end
  end
end
