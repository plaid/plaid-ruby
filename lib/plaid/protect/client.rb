# frozen_string_literal: true

module Plaid
  module Protect
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Use this endpoint to get basic information about a user as it relates to their fraud profile with Protect.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Protect::Types::ProtectUserInsightsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.protect.get_user_insights
      #
      # @return [Plaid::Types::ProtectUserInsightsGetResponse]
      def get_user_insights(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "protect/user/insights/get",
          body: Plaid::Protect::Types::ProtectUserInsightsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProtectUserInsightsGetResponse.load(response.body))
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

      # Use this endpoint to create a Protect report to document fraud incidents, investigation outcomes, or other risk
      # events. This endpoint allows you to report various types of incidents including account takeovers, identity
      # fraud, unauthorized transactions, and other security events. The reported data helps improve fraud detection
      # models and provides valuable feedback to enhance the overall security of the Plaid network.
      #
      # Reports can be created for confirmed incidents that have been fully investigated, or for suspected incidents
      # that require further review. You can associate reports with specific users, sessions, or transactions to provide
      # comprehensive context about the incident. Each report must include `user_id`, `client_user_id`, or an
      # `incident_event` with at least one supported identifier: `link_session_id`, `idv_session_id`,
      # `protect_event_id`, `signal_client_transaction_id`, or `access_token`. Context fields such as
      # `internal_reference`, `time`, `amount`, and `bank_account` do not satisfy this identifier requirement.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Protect::Types::ProtectReportCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.protect.create_report(
      #     report_confidence: "CONFIRMED",
      #     report_type: "USER_ACCOUNT_TAKEOVER",
      #     report_source: "INTERNAL_REVIEW"
      #   )
      #
      # @return [Plaid::Types::ProtectReportCreateResponse]
      def create_report(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "protect/report/create",
          body: Plaid::Protect::Types::ProtectReportCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProtectReportCreateResponse.load(response.body))
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

      # Use this endpoint to record a cash-advance decision as feedback. A decision is a determination of whether to
      # approve a user's requested advance and on what terms.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Protect::Types::ProtectCashAdvanceDecisionCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.protect.create_cash_advance_decision(
      #     user: {},
      #     decision_time: "2024-01-15T09:30:00Z",
      #     decision: "APPROVED"
      #   )
      #
      # @return [Plaid::Types::ProtectCashAdvanceDecisionCreateResponse]
      def create_cash_advance_decision(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "protect/cash_advance/decision/create",
          body: Plaid::Protect::Types::ProtectCashAdvanceDecisionCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProtectCashAdvanceDecisionCreateResponse.load(response.body))
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

      # Use this endpoint to record a cash-advance repayment as feedback. A repayment is a record paying back all or
      # some of a previously-taken cash-advance.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Protect::Types::ProtectCashAdvanceRepaymentCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.protect.create_cash_advance_repayment(
      #     user: {},
      #     client_advance_id: "client_advance_id",
      #     status: "REPAID",
      #     repayment: {
      #       amount_due: {
      #         value: 1.1
      #       },
      #       due_date: "2023-01-15"
      #     }
      #   )
      #
      # @return [Plaid::Types::ProtectCashAdvanceRepaymentCreateResponse]
      def create_cash_advance_repayment(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "protect/cash_advance/repayment/create",
          body: Plaid::Protect::Types::ProtectCashAdvanceRepaymentCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProtectCashAdvanceRepaymentCreateResponse.load(response.body))
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

      # Upload a CSV file of cash advance decision or repayment feedback. Each row is equivalent to one call to
      # `/protect/cash_advance/decision/create` or `/protect/cash_advance/repayment/create`. Send the request as
      # `multipart/form-data` with `client_id` and `secret` in the `PLAID-CLIENT-ID` and `PLAID-SECRET` headers. The
      # file is accepted for asynchronous processing; the response contains a `request_id` and an `upload_id` that
      # identifies the upload.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Protect::Types::ProtectCashAdvanceFeedbackUploadRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.protect.upload_cash_advance_feedback(
      #     feedback_type: "DECISION",
      #     file: "file"
      #   )
      #
      # @return [Plaid::Types::ProtectCashAdvanceFeedbackUploadResponse]
      def upload_cash_advance_feedback(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "protect/cash_advance/feedback/upload",
          body: Plaid::Protect::Types::ProtectCashAdvanceFeedbackUploadRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProtectCashAdvanceFeedbackUploadResponse.load(response.body))
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

      # Compute a Protect Trust Index score for a user. The model selected determines what is scored and what additional
      # fields the response contains. For example, `ti-link-session-3-<client>` scores a completed Link session for
      # fraud risk; `cash-advance-ongoing-<client>-1.0` scores repayment risk for a cash advance, additionally
      # populating per-amount-bucket subscores. Cash-advance models require that the user have a Plaid Item with
      # Transactions enabled, or an Assets Report, before scoring.
      #
      # The endpoint returns HTTP 400 with `error_type` = `INVALID_REQUEST` and `error_code` = `FAILED_PRECONDITION`
      # when a required precondition is not met: for link-session models, when the Link session has not completed; for
      # cash-advance models, when the user has not successfully linked any Item. For device-session models, the endpoint
      # may return retryable `error_code` = `SESSION_NOT_READY` until the Protect SDK has delivered device data for the
      # session.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Protect::Types::ProtectComputeRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.protect.compute(
      #     model: "model",
      #     user: {}
      #   )
      #
      # @return [Plaid::Types::ProtectComputeResponse]
      def compute(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "protect/compute",
          body: Plaid::Protect::Types::ProtectComputeRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProtectComputeResponse.load(response.body))
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

      # Send a new event to enrich user data and optionally get a Trust Index score for the event.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Protect::Types::ProtectEventSendRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.protect.send_event(event: nil)
      #
      # @return [Plaid::Types::ProtectEventSendResponse]
      def send_event(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "protect/event/send",
          body: Plaid::Protect::Types::ProtectEventSendRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProtectEventSendResponse.load(response.body))
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

      # Get information about a user event including Trust Index score and fraud attributes.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Protect::Types::ProtectEventGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.protect.get_event(event_id: "event_id")
      #
      # @return [Plaid::Types::ProtectEventGetResponse]
      def get_event(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "protect/event/get",
          body: Plaid::Protect::Types::ProtectEventGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProtectEventGetResponse.load(response.body))
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
