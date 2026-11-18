# frozen_string_literal: true

module Plaid
  module Signal
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Use `/signal/evaluate` to evaluate a planned ACH transaction to get a return risk assessment and additional risk
      # signals.
      #
      # Before using `/signal/evaluate`, you must first [create a ruleset](https://plaid.com/docs/signal/signal-rules/)
      # in the Dashboard under [**Signal->Rules**](https://dashboard.plaid.com/signal/risk-profiles).
      #
      # `/signal/evaluate` can be used with either Signal Transaction Scores or the Balance product. Which product is
      # used will be determined by the `ruleset_key` that you provide. For more details, see [Signal
      # Rules](https://plaid.com/docs/signal/signal-rules/).
      #
      # Note: This request may have higher latency when using a Balance-only ruleset. This is because Plaid must
      # communicate directly with the institution to request data. Balance-only rulesets may have latency of up to 30
      # seconds or more; if you encounter errors, you may find it necessary to adjust your timeout period when making
      # requests.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Signal::Types::SignalEvaluateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.signal.evaluate(
      #     access_token: "access_token",
      #     account_id: "account_id",
      #     client_transaction_id: "client_transaction_id",
      #     amount: 1.1
      #   )
      #
      # @return [Plaid::Types::SignalEvaluateResponse]
      def evaluate(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "signal/evaluate",
          body: Plaid::Signal::Types::SignalEvaluateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SignalEvaluateResponse.load(response.body))
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

      # Use `/signal/schedule` to schedule a planned ACH transaction.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Signal::Types::SignalScheduleRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.signal.schedule(
      #     access_token: "access_token",
      #     account_id: "account_id",
      #     client_transaction_id: "client_transaction_id",
      #     amount: 1.1
      #   )
      #
      # @return [Plaid::Types::SignalScheduleResponse]
      def schedule(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "signal/schedule",
          body: Plaid::Signal::Types::SignalScheduleRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SignalScheduleResponse.load(response.body))
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

      # After you call `/signal/evaluate`, Plaid will normally infer the outcome from your Signal Rules. However, if you
      # are not using Signal Rules, if the Signal Rules outcome was `REVIEW`, or if you take a different action than the
      # one determined by the Signal Rules, you will need to call `/signal/decision/report`. This helps improve Signal
      # Transaction Score accuracy for your account and is necessary for proper functioning of the rule performance and
      # rule tuning capabilities in the Dashboard. If your effective decision changes after calling
      # `/signal/decision/report` (for example, you indicated that you accepted a transaction, but later on, your
      # payment processor rejected it, so it was never initiated), call `/signal/decision/report` again for the
      # transaction to correct Plaid's records.
      #
      # If you are using Plaid Transfer as your payment processor, you also do not need to call
      # `/signal/decision/report`, as Plaid can infer outcomes from your Transfer activity.
      #
      # If using a Balance-only ruleset, this endpoint will not impact scores (Balance does not use scores), but is
      # necessary to view accurate transaction outcomes and tune rule logic in the Dashboard.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Signal::Types::SignalDecisionReportRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.signal.report_decision(
      #     client_transaction_id: "client_transaction_id",
      #     initiated: true
      #   )
      #
      # @return [Plaid::Types::SignalDecisionReportResponse]
      def report_decision(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "signal/decision/report",
          body: Plaid::Signal::Types::SignalDecisionReportRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SignalDecisionReportResponse.load(response.body))
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

      # Call the `/signal/return/report` endpoint to report a returned transaction that was previously sent to the
      # `/signal/evaluate` endpoint. Your feedback will be used by the model to incorporate the latest risk trends into
      # your scores and tune rule logic. If using a Balance-only ruleset, this endpoint will not impact scores (as
      # Balance does not use scores), but is necessary to view accurate transaction outcomes and tune rule logic in the
      # Dashboard.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Signal::Types::SignalReturnReportRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.signal.report_return(
      #     client_transaction_id: "client_transaction_id",
      #     return_code: "return_code"
      #   )
      #
      # @return [Plaid::Types::SignalReturnReportResponse]
      def report_return(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "signal/return/report",
          body: Plaid::Signal::Types::SignalReturnReportRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SignalReturnReportResponse.load(response.body))
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

      # When an Item is not initialized with `signal`, call `/signal/prepare` to opt-in that Item to the data collection
      # process used to develop a Signal Transaction Score. This should be done on Items where `signal` was added in the
      # `additional_consented_products` array but not in the `products`, `optional_products`, or
      # `required_if_supported_products` array. If `/signal/prepare` is skipped on an Item that is not initialized with
      # `signal`, the initial call to `/signal/evaluate` on that Item will be less accurate, because Plaid will have
      # access to less data for computing the Signal Transaction Score.
      #
      # If your integration is purely Balance-only, this endpoint will have no effect, as Balance-only rulesets do not
      # calculate a Signal Transaction Score.
      #
      # If run on an Item that is already initialized with `signal`, this endpoint will return a 200 response and will
      # not modify the Item.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Signal::Types::SignalPrepareRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.signal.prepare(access_token: "access_token")
      #
      # @return [Plaid::Types::SignalPrepareResponse]
      def prepare(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "signal/prepare",
          body: Plaid::Signal::Types::SignalPrepareRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SignalPrepareResponse.load(response.body))
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
