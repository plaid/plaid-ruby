# frozen_string_literal: true

module Plaid
  module ConsumerReport
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Retrieves all existing CRB Bank Income and Base reports for the consumer in PDF format.
      #
      # Response is PDF binary data. The `request_id` is returned in the `Plaid-Request-ID` header.
      #
      # @param request_options [Hash]
      # @param params [Plaid::ConsumerReport::Types::ConsumerReportPdfGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.consumer_report.get_pdf(user_token: "user_token")
      #
      # @return [String]
      def get_pdf(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "consumer_report/pdf/get",
          body: Plaid::ConsumerReport::Types::ConsumerReportPdfGetRequest.new(params).to_h,
          request_options: request_options
        )
        begin
          response = @client.send(request)
        rescue Net::HTTPRequestTimeout
          raise Plaid::Errors::TimeoutError
        end
        code = response.code.to_i
        return response.body if code.between?(200, 299)

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
