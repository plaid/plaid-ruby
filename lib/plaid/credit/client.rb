# frozen_string_literal: true

module Plaid
  module Credit
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/credit/audit_copy_token/update` endpoint updates an existing Audit Copy Token by adding the report tokens
      # in the `report_tokens` field to the `audit_copy_token`. If the Audit Copy Token already contains a report of a
      # certain type, it will be replaced with the token provided in the `report_tokens` field.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditAuditCopyTokenUpdateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.update_audit_copy_token(
      #     audit_copy_token: "audit_copy_token",
      #     report_tokens: ["report_tokens"]
      #   )
      #
      # @return [Plaid::Types::CreditAuditCopyTokenUpdateResponse]
      def update_audit_copy_token(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/audit_copy_token/update",
          body: Plaid::Credit::Types::CreditAuditCopyTokenUpdateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditAuditCopyTokenUpdateResponse.load(response.body))
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

      # This endpoint can be used for your end users after they complete the Link flow. This endpoint returns a list of
      # Link sessions that your user completed, where each session includes the results from the Link flow.
      #
      # These results include details about the Item that was created and some product related metadata (showing, for
      # example, whether the user finished the bank income verification step).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditSessionsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.get_sessions
      #
      # @return [Plaid::Types::CreditSessionsGetResponse]
      def get_sessions(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/sessions/get",
          body: Plaid::Credit::Types::CreditSessionsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditSessionsGetResponse.load(response.body))
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

      # Plaid can create an Audit Copy token of an Asset Report and/or Income Report to share with a participating
      # Government-Sponsored Enterprise (GSE) if you participate in Fannie Mae's Day 1 Certainty™ program or utilize
      # Freddie Mac's Loan Product Advisor® (LPA®) Asset and Income Modeler (AIM). An Audit Copy token contains the same
      # underlying data as the Asset Report and/or Income Report (result of `/credit/payroll_income/get`).
      #
      # Use the `/credit/audit_copy_token/create` endpoint to create an `audit_copy_token` and then pass that token to
      # the GSE who needs access.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditAuditCopyTokenCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.create_audit_copy_token(report_tokens: ["report_tokens"])
      #
      # @return [Plaid::Types::CreditAuditCopyTokenCreateResponse]
      def create_audit_copy_token(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/audit_copy_token/create",
          body: Plaid::Credit::Types::CreditAuditCopyTokenCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditAuditCopyTokenCreateResponse.load(response.body))
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

      # The `/credit/audit_copy_token/remove` endpoint allows you to remove an Audit Copy. Removing an Audit Copy
      # invalidates the `audit_copy_token` associated with it, meaning both you and any third parties holding the token
      # will no longer be able to use it to access Report data. Items associated with the Report data and other Audit
      # Copies of it are not affected and will remain accessible after removing the given Audit Copy.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditAuditCopyTokenRemoveRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.remove_audit_copy_token(audit_copy_token: "audit_copy_token")
      #
      # @return [Plaid::Types::CreditAuditCopyTokenRemoveResponse]
      def remove_audit_copy_token(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/audit_copy_token/remove",
          body: Plaid::Credit::Types::CreditAuditCopyTokenRemoveRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditAuditCopyTokenRemoveResponse.load(response.body))
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

      # The `/credit/asset_report/freddie_mac/get` endpoint retrieves the Asset Report in Freddie Mac's JSON format.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::AssetReportFreddieGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.get_asset_report_freddie_mac(audit_copy_token: "audit_copy_token")
      #
      # @return [Plaid::Types::AssetReportFreddieGetResponse]
      def get_asset_report_freddie_mac(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/asset_report/freddie_mac/get",
          body: Plaid::Credit::Types::AssetReportFreddieGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::AssetReportFreddieGetResponse.load(response.body))
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

      # The `/credit/freddie_mac/reports/get` endpoint retrieves the Verification of Assets and Verification of
      # Employment reports.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditFreddieMacReportsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.get_freddie_mac_reports(audit_copy_token: "audit_copy_token")
      #
      # @return [Plaid::Types::CreditFreddieMacReportsGetResponse]
      def get_freddie_mac_reports(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/freddie_mac/reports/get",
          body: Plaid::Credit::Types::CreditFreddieMacReportsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditFreddieMacReportsGetResponse.load(response.body))
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

      # `/beta/credit/v1/bank_employment/get` returns the employment report(s) derived from bank transaction data for a
      # specified user.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditBankEmploymentGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.get_bank_employment(user_token: "user_token")
      #
      # @return [Plaid::Types::CreditBankEmploymentGetResponse]
      def get_bank_employment(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beta/credit/v1/bank_employment/get",
          body: Plaid::Credit::Types::CreditBankEmploymentGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditBankEmploymentGetResponse.load(response.body))
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

      # `/credit/bank_income/get` returns the bank income report(s) for a specified user. A single report corresponds to
      # all institutions linked in a single Link session. To include multiple institutions in a single report, use
      # [Multi-Item Link](https://plaid.com/docs/link/multi-item-link). To return older reports, use the `options.count`
      # field.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditBankIncomeGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.get_bank_income
      #
      # @return [Plaid::Types::CreditBankIncomeGetResponse]
      def get_bank_income(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/bank_income/get",
          body: Plaid::Credit::Types::CreditBankIncomeGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditBankIncomeGetResponse.load(response.body))
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

      # `/credit/bank_income/pdf/get` returns the most recent bank income report for a specified user in PDF format.  A
      # single report corresponds to all institutions linked in a single Link session. To include multiple institutions
      # in a single report, use [Multi-Item Link](https://plaid.com/docs/link/multi-item-link).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditBankIncomePdfGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.get_bank_income_pdf
      #
      # @return [String]
      def get_bank_income_pdf(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/bank_income/pdf/get",
          body: Plaid::Credit::Types::CreditBankIncomePdfGetRequest.new(params).to_h,
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

      # `/credit/bank_income/refresh` is deprecated. The backend implementation was removed (returns an `Unimplemented`
      # error at runtime), and the endpoint is no longer part of the documented API surface. To refresh Bank Income data
      # for an existing user, send the user through Link's update mode so they can confirm their income sources. For a
      # fully backend refresh, migrate to CRA Income Insights and call `/cra/check_report/create`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditBankIncomeRefreshRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.refresh_bank_income(user_token: "user_token")
      #
      # @return [Plaid::Types::CreditBankIncomeRefreshResponse]
      def refresh_bank_income(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/bank_income/refresh",
          body: Plaid::Credit::Types::CreditBankIncomeRefreshRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditBankIncomeRefreshResponse.load(response.body))
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

      # `/credit/bank_income/webhook/update` is deprecated and no longer available; requests return an `INVALID_REQUEST`
      # error with code `NOT_FOUND`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditBankIncomeWebhookUpdateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.update_bank_income_webhook(
      #     user_token: "user_token",
      #     enable_webhooks: true
      #   )
      #
      # @return [Plaid::Types::CreditBankIncomeWebhookUpdateResponse]
      def update_bank_income_webhook(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/bank_income/webhook/update",
          body: Plaid::Credit::Types::CreditBankIncomeWebhookUpdateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditBankIncomeWebhookUpdateResponse.load(response.body))
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

      # `/credit/payroll_income/parsing_config/update` updates the parsing configuration for a document income
      # verification.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditPayrollIncomeParsingConfigUpdateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.update_payroll_income_parsing_config(parsing_config: ["ocr"])
      #
      # @return [Plaid::Types::CreditPayrollIncomeParsingConfigUpdateResponse]
      def update_payroll_income_parsing_config(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/payroll_income/parsing_config/update",
          body: Plaid::Credit::Types::CreditPayrollIncomeParsingConfigUpdateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditPayrollIncomeParsingConfigUpdateResponse.load(response.body))
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

      # `/credit/bank_statements/uploads/get` returns parsed data from bank statements uploaded by users as part of the
      # Document Income flow. If your account is not enabled for Document Parsing, contact your account manager to
      # request access.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditBankStatementsUploadsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.get_bank_statements_uploads
      #
      # @return [Plaid::Types::CreditBankStatementsUploadsGetResponse]
      def get_bank_statements_uploads(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/bank_statements/uploads/get",
          body: Plaid::Credit::Types::CreditBankStatementsUploadsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditBankStatementsUploadsGetResponse.load(response.body))
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

      # This endpoint gets payroll income information for a specific user, either as a result of the user connecting to
      # their payroll provider or uploading a pay related document.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditPayrollIncomeGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.get_payroll_income
      #
      # @return [Plaid::Types::CreditPayrollIncomeGetResponse]
      def get_payroll_income(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/payroll_income/get",
          body: Plaid::Credit::Types::CreditPayrollIncomeGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditPayrollIncomeGetResponse.load(response.body))
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

      # `/credit/payroll_income/risk_signals/get` can be used as part of the Document Income flow to assess a
      # user-uploaded document for signs of potential fraud or tampering. It returns a risk score for each uploaded
      # document that indicates the likelihood of the document being fraudulent, in addition to details on the
      # individual risk signals contributing to the score.
      #
      # To trigger risk signal generation for an Item, call `/link/token/create` with `parsing_config` set to include
      # `risk_signals`, or call `/credit/payroll_income/parsing_config/update`. Once risk signal generation has been
      # triggered, `/credit/payroll_income/risk_signals/get` can be called at any time after the
      # `INCOME_VERIFICATION_RISK_SIGNALS` webhook has been fired.
      #
      # `/credit/payroll_income/risk_signals/get` is offered as an add-on to Document Income and is billed separately.
      # To request access to this endpoint, submit a product access request or contact your Plaid account manager.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditPayrollIncomeRiskSignalsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.get_payroll_income_risk_signals
      #
      # @return [Plaid::Types::CreditPayrollIncomeRiskSignalsGetResponse]
      def get_payroll_income_risk_signals(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/payroll_income/risk_signals/get",
          body: Plaid::Credit::Types::CreditPayrollIncomeRiskSignalsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditPayrollIncomeRiskSignalsGetResponse.load(response.body))
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

      # `/credit/payroll_income/precheck` is an optional endpoint that can be called before initializing a Link session
      # for income verification. It evaluates whether a given user is supportable by digital income verification. If the
      # user is eligible for digital verification, that information will be associated with the user token, and in this
      # way will generate a Link UI optimized for the end user and their specific employer. If the user cannot be
      # confirmed as eligible, the user can still use the income verification flow, but they may be required to manually
      # upload a paystub to verify their income.
      #
      # While all request fields are optional, providing `employer` data will increase the chance of receiving a useful
      # result.
      #
      # When testing in Sandbox, you can control the results by providing special test values in the `access_tokens`
      # field. `access_good` and `access_bad` will result in `HIGH` and `LOW` confidence values, respectively. Any other
      # valid Sandbox access token will result in `UNKNOWN` confidence; other strings return an `INVALID_ACCESS_TOKEN`
      # error.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditPayrollIncomePrecheckRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.precheck_payroll_income
      #
      # @return [Plaid::Types::CreditPayrollIncomePrecheckResponse]
      def precheck_payroll_income(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/payroll_income/precheck",
          body: Plaid::Credit::Types::CreditPayrollIncomePrecheckRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditPayrollIncomePrecheckResponse.load(response.body))
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

      # `/credit/employment/get` returns a list of items with employment information from a user's payroll provider that
      # was verified by an end user.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditEmploymentGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.get_employment
      #
      # @return [Plaid::Types::CreditEmploymentGetResponse]
      def get_employment(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/employment/get",
          body: Plaid::Credit::Types::CreditEmploymentGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditEmploymentGetResponse.load(response.body))
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

      # `/credit/payroll_income/refresh` refreshes a given digital payroll income verification.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditPayrollIncomeRefreshRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.refresh_payroll_income
      #
      # @return [Plaid::Types::CreditPayrollIncomeRefreshResponse]
      def refresh_payroll_income(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/payroll_income/refresh",
          body: Plaid::Credit::Types::CreditPayrollIncomeRefreshRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditPayrollIncomeRefreshResponse.load(response.body))
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

      # Plaid can share an Asset Report directly with a participating third party on your behalf. The shared Asset
      # Report is the exact same Asset Report originally created in `/asset_report/create`.
      #
      # To grant a third party access to an Asset Report, use the `/credit/relay/create` endpoint to create a
      # `relay_token` and then pass that token to your third party. Each third party has its own `secondary_client_id`;
      # for example, `ce5bd328dcd34123456`. You'll need to create a separate `relay_token` for each third party that
      # needs access to the report on your behalf.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditRelayCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.create_relay(
      #     report_tokens: ["report_tokens"],
      #     secondary_client_id: "secondary_client_id"
      #   )
      #
      # @return [Plaid::Types::CreditRelayCreateResponse]
      def create_relay(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/relay/create",
          body: Plaid::Credit::Types::CreditRelayCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditRelayCreateResponse.load(response.body))
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

      # `/credit/relay/get` allows third parties to receive a report that was shared with them, using a `relay_token`
      # that was created by the report owner.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditRelayGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.get_relay(
      #     relay_token: "relay_token",
      #     report_type: "asset"
      #   )
      #
      # @return [Plaid::Types::AssetReportGetResponse]
      def get_relay(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/relay/get",
          body: Plaid::Credit::Types::CreditRelayGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::AssetReportGetResponse.load(response.body))
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

      # `/credit/relay/pdf/get` allows third parties to receive a PDF report that was shared with them, using a
      # `relay_token` that was created by the report owner.
      #
      # The `/credit/relay/pdf/get` endpoint retrieves the Asset Report in PDF format. Before calling
      # `/credit/relay/pdf/get`, you must first create the Asset Report using `/credit/relay/create` and then wait for
      # the [`PRODUCT_READY`](https://plaid.com/docs/api/products/assets/#product_ready) webhook to fire, indicating
      # that the Report is ready to be retrieved.
      #
      # The response to `/credit/relay/pdf/get` is the PDF binary data. The `request_id` is returned in the
      # `Plaid-Request-ID` header.
      #
      # [View a sample PDF Asset Report](https://plaid.com/documents/sample-asset-report.pdf).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditRelayPdfGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.get_relay_pdf(
      #     relay_token: "relay_token",
      #     report_type: "asset"
      #   )
      #
      # @return [String]
      def get_relay_pdf(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/relay/pdf/get",
          body: Plaid::Credit::Types::CreditRelayPdfGetRequest.new(params).to_h,
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

      # The `/credit/relay/refresh` endpoint allows third parties to refresh a report that was relayed to them, using a
      # `relay_token` that was created by the report owner. A new report will be created with the original report
      # parameters, but with the most recent data available based on the `days_requested` value of the original report.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditRelayRefreshRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.refresh_relay(
      #     relay_token: "relay_token",
      #     report_type: "asset"
      #   )
      #
      # @return [Plaid::Types::CreditRelayRefreshResponse]
      def refresh_relay(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/relay/refresh",
          body: Plaid::Credit::Types::CreditRelayRefreshRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditRelayRefreshResponse.load(response.body))
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

      # The `/credit/relay/remove` endpoint allows you to invalidate a `relay_token`. The third party holding the token
      # will no longer be able to access or refresh the reports which the `relay_token` gives access to. The original
      # report, associated Items, and other relay tokens that provide access to the same report are not affected and
      # will remain accessible after removing the given `relay_token`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Credit::Types::CreditRelayRemoveRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.credit.remove_relay(relay_token: "relay_token")
      #
      # @return [Plaid::Types::CreditRelayRemoveResponse]
      def remove_relay(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "credit/relay/remove",
          body: Plaid::Credit::Types::CreditRelayRemoveRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CreditRelayRemoveResponse.load(response.body))
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

      # @return [Plaid::Profile::Client]
      def profile
        @profile ||= Plaid::Credit::Profile::Client.new(client: @client)
      end
    end
  end
end
