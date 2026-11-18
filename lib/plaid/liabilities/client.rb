# frozen_string_literal: true

module Plaid
  module Liabilities
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/liabilities/get` endpoint returns various details about an Item with loan or credit accounts. Liabilities
      # data is available primarily for US financial institutions, with some limited coverage of Canadian institutions.
      # Supported account types are account type `credit` with account subtype `credit card` or `paypal`; and account
      # type `loan` with account subtype `auto`, `commercial`, `commercial line of credit`, `consumer`, `home equity`,
      # `home equity loan`, `line of credit`, `loan`, `mortgage`, or `student`. To limit accounts listed in Link to
      # types and subtypes supported by Liabilities, you can use the `account_filters` parameter when [creating a Link
      # token](https://plaid.com/docs/api/link/#linktokencreate).
      #
      # To receive the expanded loan subtype values, use plaid-go 10.1.0 or later, plaid-java 44.0.0 or later,
      # plaid-python 8.3.0 or later, or plaid-ruby 14.4.0 or later. Earlier client library versions may receive `loan`
      # instead of `home equity loan` and `line of credit` instead of `commercial line of credit`.
      #
      # The types of information returned by Liabilities can include balances and due dates, loan terms, and account
      # details such as original loan amount and guarantor. Data is refreshed approximately once per day; the latest
      # data can be retrieved by calling `/liabilities/get`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Liabilities::Types::LiabilitiesGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.liabilities.get(access_token: "access_token")
      #
      # @return [Plaid::Types::LiabilitiesGetResponse]
      def get(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "liabilities/get",
          body: Plaid::Liabilities::Types::LiabilitiesGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::LiabilitiesGetResponse.load(response.body))
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
