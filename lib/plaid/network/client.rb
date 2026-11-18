# frozen_string_literal: true

module Plaid
  module Network
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/network/status/get` endpoint can be used to check whether Plaid has a matching profile for the user.
      # This is useful for determining if a user is eligible for a streamlined experience, such as Layer. To access this
      # endpoint, contact your Plaid account manager.
      #
      # Note: it is strongly recommended to check for Layer eligibility in the frontend. `/network/status/get` should
      # only be used for checking Layer eligibility if a frontend check is not possible for your use case.
      # For instructions on performing a frontend eligibility check, see the [Layer
      # documentation](https://plaid.com/docs/layer/#integration-overview).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Network::Types::NetworkStatusGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.network.get_status(user: {
      #     phone_number: "phone_number"
      #   })
      #
      # @return [Plaid::Types::NetworkStatusGetResponse]
      def get_status(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "network/status/get",
          body: Plaid::Network::Types::NetworkStatusGetRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Plaid::Errors::TimeoutError
        end
        code = response.code.to_i
        if code.between?(200, 299)
          begin
            (response.body.to_s.empty? ? nil : Plaid::Types::NetworkStatusGetResponse.load(response.body))
          rescue ::JSON::ParserError
            raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
          end
        else
          error_class = Plaid::Errors::ResponseError.subclass_for_code(code)
          error_types = {
            400 => Plaid::Types::PlaidError,
            401 => Plaid::Types::PlaidError,
            429 => Plaid::Types::PlaidError,
            500 => Plaid::Types::PlaidError,
            (400..499) => Plaid::Types::PlaidError,
            (500..599) => Plaid::Types::PlaidError
          }
          error_body = Plaid::Errors::ResponseError.load_error_body(code, response.body, error_types)
          raise error_class.new(response.body, code: code, body: error_body, headers: response.to_hash)
        end
      end
    end
  end
end
