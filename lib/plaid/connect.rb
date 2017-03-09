require 'json'
require 'net/http'
require 'uri'

require_relative 'version'

module Plaid
  # Internal: A module encapsulating HTTP post requests
  module Connect
    # Internal: Headers used for correct request and SDK tracking.
    NETWORK_HEADERS = { 'User-Agent'   => "Plaid Ruby v#{Plaid::VERSION}",
                        'Content-Type' => 'application/json' }.freeze

    # Internal: Default read timeout for HTTP calls in seconds.
    NETWORK_TIMEOUT = 600

    # Internal: Run POST request on path with payload.
    #
    # path    - The path to send the request to.
    # payload - The hash with data.
    #
    # Returns the parsed JSON response body.
    def self.post(path, payload)
      uri = URI.parse(path)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      http.read_timeout = Plaid::Connect::NETWORK_TIMEOUT

      request = Net::HTTP::Post.new(uri.path, Plaid::Connect::NETWORK_HEADERS)
      request.body = JSON.generate(payload)

      Plaid::Connect.run http, request
    end

    # Internal: Run the request and process the response.
    #
    # http    - Object created by Net::HTTP.new
    # request - Object created by Net::HTTP::Post.new (for POST)
    #
    # Returns the parsed JSON body or raises an appropriate PlaidError
    def self.run(http, request)
      response = http.request(request)

      if response.body.nil? || response.body.empty?
        raise Plaid::PlaidError.new(0, 'Server error', 'Try to connect later')
      end

      # All responses are expected to have a JSON body, so we always parse,
      # not looking at the status code.
      body = JSON.parse(response.body)

      case response
      when Net::HTTPSuccess
        body
      else
        raise_error(body)
      end
    end

    # Internal: Raise an error with the class depending on reponse body.
    #
    # body - A parsed response body with error.
    #
    # Raises a PlaidError
    def self.raise_error(body)
      raise Plaid::Error.error_from_type(body['error_type']).new(body['error_type'],
                                                                 body['error_code'],
                                                                 body['error_message'],
                                                                 body['display_message'],
                                                                 body['request_id'])
    end
  end
end
