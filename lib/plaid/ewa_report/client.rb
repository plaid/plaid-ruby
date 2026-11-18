# frozen_string_literal: true

module Plaid
  module EwaReport
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/beta/ewa_report/v1/get` endpoint provides an Earned Wage Access (EWA) score that quantifies the
      # delinquency risk associated with a given item. The score is derived from a combination of cashflow patterns and
      # network-based behavioral features.
      #
      # The response returns a list of EWA scores, where each score corresponds to a potential advance amount range.
      # These scores estimate the likelihood of repayment for advances within that range.
      #
      # Score range: 1-99
      #
      # Interpretation: Higher scores indicate a greater likelihood of repayment.
      #
      # This endpoint enables clients to assess repayment risk and make data-driven decisions when determining
      # eligibility or limits for earned wage advances.
      #
      # @param request_options [Hash]
      # @param params [Plaid::EwaReport::Types::BetaEwaReportV1GetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.ewa_report.get(access_token: "access-sandbox-71e02f71-0960-4a27-abd2-5631e04f2175")
      #
      # @return [Plaid::Types::BetaEwaReportV1GetResponse]
      def get(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beta/ewa_report/v1/get",
          body: Plaid::EwaReport::Types::BetaEwaReportV1GetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::BetaEwaReportV1GetResponse.load(response.body))
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
