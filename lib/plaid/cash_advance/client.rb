# frozen_string_literal: true

module Plaid
  module CashAdvance
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/beta/cash_advance/income_insights/v1/get` endpoint returns a user's top income streams across all of the
      # user's active Items, ranked by historical net monthly income and capped at three, along with the next payment
      # date and amount of the highest-ranked stream.
      #
      # Only USD income streams are returned. If some, but not all, of the user's Items could not be evaluated, the
      # response is based on the remaining Items.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CashAdvance::Types::BetaCashAdvanceIncomeInsightsV1GetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.cash_advance.get_income_insights(user_id: "usr_9nSp2KuZ2x4JDw")
      #
      # @return [Plaid::Types::BetaCashAdvanceIncomeInsightsV1GetResponse]
      def get_income_insights(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beta/cash_advance/income_insights/v1/get",
          body: Plaid::CashAdvance::Types::BetaCashAdvanceIncomeInsightsV1GetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::BetaCashAdvanceIncomeInsightsV1GetResponse.load(response.body))
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
