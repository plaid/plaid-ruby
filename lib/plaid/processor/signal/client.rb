# frozen_string_literal: true

module Plaid
  module Processor
    module Signal
      class Client
        # @param client [Plaid::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use `/processor/signal/evaluate` to evaluate a planned ACH transaction to get a return risk assessment and
        # additional risk signals.
        #
        # `/processor/signal/evaluate` uses Rulesets that are configured on the end customer's Dashboard and can be used
        # with either the Signal Transaction Scores product or the Balance product. Which product is used will be
        # determined by the `ruleset_key` that you provide. Note that only customer-configured rulesets work with this
        # endpoint; as a processor partner, you cannot create or configure your own rulesets. For more details, see
        # [Signal Rules](https://plaid.com/docs/signal/signal-rules/).
        #
        # Note: This request may have higher latency if Signal Transaction Scores is being added to an existing Item for
        # the first time, or when using a Balance-only ruleset. This is because Plaid must communicate directly with the
        # institution to request data.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Processor::Signal::Types::ProcessorSignalEvaluateRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.processor.signal.evaluate(
        #     processor_token: "processor_token",
        #     client_transaction_id: "client_transaction_id",
        #     amount: 1.1
        #   )
        #
        # @return [Plaid::Types::ProcessorSignalEvaluateResponse]
        def evaluate(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "processor/signal/evaluate",
            body: Plaid::Processor::Signal::Types::ProcessorSignalEvaluateRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorSignalEvaluateResponse.load(response.body))
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

        # After you call `/processor/signal/evaluate`, Plaid will normally infer the outcome from your Signal Rules.
        # However, if you are not using Signal Rules, if the Signal Rules outcome was `REVIEW`, or if you take a
        # different action than the one determined by the Signal Rules, you will need to call
        # `/processor/signal/decision/report`. This helps improve Signal Transaction Score accuracy for your account and
        # is necessary for proper functioning of the rule performance and rule tuning capabilities in the Dashboard. If
        # your effective decision changes after calling `/processor/signal/decision/report` (for example, you indicated
        # that you accepted a transaction, but later on, your payment processor rejected it, so it was never initiated),
        # call `/processor/signal/decision/report` again for the transaction to correct Plaid's records.
        #
        # If you are using Plaid Transfer as your payment processor, you also do not need to call
        # `/processor/signal/decision/report`, as Plaid can infer outcomes from your Transfer activity.
        #
        # If using a Balance-only ruleset, this endpoint will not impact scores (Balance does not use scores), but is
        # necessary to view accurate transaction outcomes and tune rule logic in the Dashboard.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Processor::Signal::Types::ProcessorSignalDecisionReportRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.processor.signal.report_decision(
        #     processor_token: "processor_token",
        #     client_transaction_id: "client_transaction_id",
        #     initiated: true
        #   )
        #
        # @return [Plaid::Types::ProcessorSignalDecisionReportResponse]
        def report_decision(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "processor/signal/decision/report",
            body: Plaid::Processor::Signal::Types::ProcessorSignalDecisionReportRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorSignalDecisionReportResponse.load(response.body))
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

        # Call the `/processor/signal/return/report` endpoint to report a returned transaction that was previously sent
        # to the `/processor/signal/evaluate` endpoint. Your feedback will be used by the model to incorporate the
        # latest risk trend in your portfolio.
        #
        # If you are using the [Plaid Transfer product](https://plaid.com/docs/transfer) to create transfers, it is not
        # necessary to use this endpoint, as Plaid already knows whether the transfer was returned.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Processor::Signal::Types::ProcessorSignalReturnReportRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.processor.signal.report_return(
        #     processor_token: "processor_token",
        #     client_transaction_id: "client_transaction_id",
        #     return_code: "return_code"
        #   )
        #
        # @return [Plaid::Types::ProcessorSignalReturnReportResponse]
        def report_return(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "processor/signal/return/report",
            body: Plaid::Processor::Signal::Types::ProcessorSignalReturnReportRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorSignalReturnReportResponse.load(response.body))
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

        # When a processor token is not initialized with `signal`, call `/processor/signal/prepare` to opt-in that
        # processor token to the data collection process, which will improve the accuracy of the Signal Transaction
        # Score.
        #
        # If this endpoint is called with a processor token that is already initialized with `signal`, it will return a
        # 200 response and will not modify the processor token.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Processor::Signal::Types::ProcessorSignalPrepareRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.processor.signal.prepare(processor_token: "processor_token")
        #
        # @return [Plaid::Types::ProcessorSignalPrepareResponse]
        def prepare(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "processor/signal/prepare",
            body: Plaid::Processor::Signal::Types::ProcessorSignalPrepareRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorSignalPrepareResponse.load(response.body))
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
end
