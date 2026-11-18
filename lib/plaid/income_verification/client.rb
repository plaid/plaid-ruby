# frozen_string_literal: true

module Plaid
  module IncomeVerification
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # `/income/verification/create` begins the income verification process by returning an `income_verification_id`.
      # You can then provide the `income_verification_id` to `/link/token/create` under the `income_verification`
      # parameter in order to create a Link instance that will prompt the user to go through the income verification
      # flow. Plaid will fire an `INCOME` webhook once the user completes the Payroll Income flow, or when the uploaded
      # documents in the Document Income flow have finished processing.
      #
      # @param request_options [Hash]
      # @param params [Plaid::IncomeVerification::Types::IncomeVerificationCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.income_verification.create(webhook: "webhook")
      #
      # @return [Plaid::Types::IncomeVerificationCreateResponse]
      def create(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "income/verification/create",
          body: Plaid::IncomeVerification::Types::IncomeVerificationCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::IncomeVerificationCreateResponse.load(response.body))
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

      # `/income/verification/paystubs/get` returns the information collected from the paystubs that were used to verify
      # an end user's income. It can be called once the status of the verification has been set to
      # `VERIFICATION_STATUS_PROCESSING_COMPLETE`, as reported by the `INCOME: verification_status` webhook. Attempting
      # to call the endpoint before verification has been completed will result in an error.
      #
      # This endpoint has been deprecated; new integrations should use `/credit/payroll_income/get` instead.
      #
      # @param request_options [Hash]
      # @param params [Plaid::IncomeVerification::Types::IncomeVerificationPaystubsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.income_verification.get_paystubs
      #
      # @return [Plaid::Types::IncomeVerificationPaystubsGetResponse]
      def get_paystubs(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "income/verification/paystubs/get",
          body: Plaid::IncomeVerification::Types::IncomeVerificationPaystubsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::IncomeVerificationPaystubsGetResponse.load(response.body))
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

      # `/income/verification/documents/download` provides the ability to download the source documents associated with
      # the verification.
      #
      # If Document Income was used, the documents will be those the user provided in Link. For Payroll Income, the most
      # recent files available for download from the payroll provider will be available from this endpoint.
      #
      # The response to `/income/verification/documents/download` is a ZIP file in binary data. If a `document_id` is
      # passed, a single document will be contained in this file.
      # If not, the response will contain all documents associated with the verification.
      #
      # The `request_id` is returned in the `Plaid-Request-ID` header.
      #
      # @param request_options [Hash]
      # @param params [Plaid::IncomeVerification::Types::IncomeVerificationDocumentsDownloadRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.income_verification.download_documents
      #
      # @return [String]
      def download_documents(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "income/verification/documents/download",
          body: Plaid::IncomeVerification::Types::IncomeVerificationDocumentsDownloadRequest.new(params).to_h,
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

      # `/income/verification/taxforms/get` returns the information collected from forms that were used to verify an end
      # user''s income. It can be called once the status of the verification has been set to
      # `VERIFICATION_STATUS_PROCESSING_COMPLETE`, as reported by the `INCOME: verification_status` webhook. Attempting
      # to call the endpoint before verification has been completed will result in an error.
      #
      # This endpoint has been deprecated; new integrations should use `/credit/payroll_income/get` instead.
      #
      # @param request_options [Hash]
      # @param params [Plaid::IncomeVerification::Types::IncomeVerificationTaxformsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.income_verification.get_taxforms
      #
      # @return [Plaid::Types::IncomeVerificationTaxformsGetResponse]
      def get_taxforms(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "income/verification/taxforms/get",
          body: Plaid::IncomeVerification::Types::IncomeVerificationTaxformsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::IncomeVerificationTaxformsGetResponse.load(response.body))
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

      # `/income/verification/precheck` is an optional endpoint that can be called before initializing a Link session
      # for income verification. It evaluates whether a given user is supportable by digital income verification and
      # returns a `precheck_id` that can be provided to `/link/token/create`. If the user is eligible for digital
      # verification, providing the `precheck_id` in this way will generate a Link UI optimized for the end user and
      # their specific employer. If the user cannot be confirmed as eligible, the `precheck_id` can still be provided to
      # `/link/token/create` and the user can still use the income verification flow, but they may be required to
      # manually upload a paystub to verify their income.
      #
      # While all request fields are optional, providing either `employer` or `transactions_access_tokens` data will
      # increase the chance of receiving a useful result.
      #
      # This endpoint has been deprecated; new integrations should use `/credit/payroll_income/precheck` instead.
      #
      # @param request_options [Hash]
      # @param params [Plaid::IncomeVerification::Types::IncomeVerificationPrecheckRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.income_verification.precheck
      #
      # @return [Plaid::Types::IncomeVerificationPrecheckResponse]
      def precheck(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "income/verification/precheck",
          body: Plaid::IncomeVerification::Types::IncomeVerificationPrecheckRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::IncomeVerificationPrecheckResponse.load(response.body))
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
