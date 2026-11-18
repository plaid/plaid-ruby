# frozen_string_literal: true

module Plaid
  module CheckReport
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # This endpoint allows you to retrieve the Income Insights report for your user. You should call this endpoint
      # after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link
      # session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the
      # user doesn't have sufficient data to generate the report, or the consumer report has expired, you will receive
      # an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.
      #
      # NOTE: The following schema was updated in April 2026 to reflect the response when the provided version is "II2".
      # Please see [this
      # document](https://docs.google.com/document/d/1kQkQ7FOgFaC4n-sUGUk74hoXZNY_L_nJeCuMe7Keip4/edit?tab=t.0#heading=h.rudamzinus2i)
      # for guidance on migrating to II2 if you are currently using the II1 version, and [this
      # section](https://docs.google.com/document/d/1kQkQ7FOgFaC4n-sUGUk74hoXZNY_L_nJeCuMe7Keip4/edit?tab=t.0#bookmark=id.tdcc2wpk0h60)
      # for an example II1 response along with its
      # [documentation](https://docs.google.com/document/d/1kQkQ7FOgFaC4n-sUGUk74hoXZNY_L_nJeCuMe7Keip4/edit?tab=t.36c85n2ircqk#heading=h.79dwr5c1iszl).
      #
      # @param request_options [Hash]
      # @param params [Plaid::CheckReport::Types::CraCheckReportIncomeInsightsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.check_report.get_income_insights
      #
      # @return [Plaid::Types::CraCheckReportIncomeInsightsGetResponse]
      def get_income_insights(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cra/check_report/income_insights/get",
          body: Plaid::CheckReport::Types::CraCheckReportIncomeInsightsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CraCheckReportIncomeInsightsGetResponse.load(response.body))
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

      # This endpoint allows you to retrieve the Base Report for your user, allowing you to receive comprehensive bank
      # account and cash flow data. You should call this endpoint after you've received a `CHECK_REPORT_READY` or a
      # `USER_CHECK_REPORT_READY` webhook, either after the Link session for the user or after calling
      # `/cra/check_report/create`. If the most recent consumer report for the user doesn't have sufficient data to
      # generate the base report, or the consumer report has expired, you will receive an error indicating that you
      # should create a new consumer report by calling `/cra/check_report/create`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CheckReport::Types::CraCheckReportBaseReportGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.check_report.get_base_report
      #
      # @return [Plaid::Types::CraCheckReportBaseReportGetResponse]
      def get_base_report(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cra/check_report/base_report/get",
          body: Plaid::CheckReport::Types::CraCheckReportBaseReportGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CraCheckReportBaseReportGetResponse.load(response.body))
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

      # `/cra/check_report/pdf/get` retrieves the most recent Consumer Report in PDF format. The most recent Base Report
      # for the user is always included. Use the `add_ons` field to also include the most recent Income Insights,
      # Partner Insights or LendScore report in the PDF.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CheckReport::Types::CraCheckReportPdfGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.check_report.get_pdf
      #
      # @return [String]
      def get_pdf(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cra/check_report/pdf/get",
          body: Plaid::CheckReport::Types::CraCheckReportPdfGetRequest.new(params).to_h,
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

      # Use `/cra/check_report/create` to refresh data in an existing report. A Consumer Report will last for 24 hours
      # before expiring; you should call any `/get` endpoints on the report before it expires. If a report expires, you
      # can call `/cra/check_report/create` again to re-generate it and refresh the data in the report. The report is
      # generated from all Items associated with the user, excluding [duplicate
      # Items](https://plaid.com/docs/check/add-to-app/#duplicate-items) and Items that cannot supply data.
      #
      # Each call to `/cra/check_report/create` creates a new, independent report. `/get` endpoints will retrieve the
      # most recently created report for the requested user.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CheckReport::Types::CraCheckReportCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.check_report.create(
      #     webhook: "webhook",
      #     days_requested: 1,
      #     consumer_report_permissible_purpose: "ACCOUNT_REVIEW_CREDIT"
      #   )
      #
      # @return [Plaid::Types::CraCheckReportCreateResponse]
      def create(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cra/check_report/create",
          body: Plaid::CheckReport::Types::CraCheckReportCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CraCheckReportCreateResponse.load(response.body))
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

      # This endpoint allows you to retrieve the Partner Insights report for your user. You should call this endpoint
      # after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link
      # session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the
      # user doesn't have sufficient data to generate the report, or the consumer report has expired, you will receive
      # an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CheckReport::Types::CraCheckReportPartnerInsightsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.check_report.get_partner_insights
      #
      # @return [Plaid::Types::CraCheckReportPartnerInsightsGetResponse]
      def get_partner_insights(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cra/check_report/partner_insights/get",
          body: Plaid::CheckReport::Types::CraCheckReportPartnerInsightsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CraCheckReportPartnerInsightsGetResponse.load(response.body))
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

      # This endpoint allows you to retrieve the Cashflow Insights report for your user. You should call this endpoint
      # after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link
      # session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the
      # user doesn't have sufficient data to generate the report, or the consumer report has expired, you will receive
      # an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CheckReport::Types::CraCheckReportCashflowInsightsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.check_report.get_cashflow_insights
      #
      # @return [Plaid::Types::CraCheckReportCashflowInsightsGetResponse]
      def get_cashflow_insights(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cra/check_report/cashflow_insights/get",
          body: Plaid::CheckReport::Types::CraCheckReportCashflowInsightsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CraCheckReportCashflowInsightsGetResponse.load(response.body))
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

      # This endpoint allows you to retrieve the LendScore report for your user. You should call this endpoint after
      # you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link session for
      # the user or after calling `/cra/check_report/create`. If the most recent consumer report for the user doesn't
      # have sufficient data to generate the report, or the consumer report has expired, you will receive an error
      # indicating that you should create a new consumer report by calling `/cra/check_report/create`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CheckReport::Types::CraCheckReportLendScoreGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.check_report.get_lend_score
      #
      # @return [Plaid::Types::CraCheckReportLendScoreGetResponse]
      def get_lend_score(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cra/check_report/lend_score/get",
          body: Plaid::CheckReport::Types::CraCheckReportLendScoreGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CraCheckReportLendScoreGetResponse.load(response.body))
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

      # This endpoint allows you to retrieve the Network Insights report for your user. You should call this endpoint
      # after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook, either after the Link
      # session for the user or after calling `/cra/check_report/create`. If the most recent consumer report for the
      # user doesn't have sufficient data to generate the report, or the consumer report has expired, you will receive
      # an error indicating that you should create a new consumer report by calling `/cra/check_report/create`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CheckReport::Types::CraCheckReportNetworkInsightsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.check_report.get_network_insights
      #
      # @return [Plaid::Types::CraCheckReportNetworkInsightsGetResponse]
      def get_network_insights(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cra/check_report/network_insights/get",
          body: Plaid::CheckReport::Types::CraCheckReportNetworkInsightsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CraCheckReportNetworkInsightsGetResponse.load(response.body))
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

      # This endpoint allows you to retrieve home lending reports for a user. To obtain a VoA or Employment Refresh
      # report, you need to make sure that `cra_base_report` is included in the `products` parameter when calling
      # `/link/token/create` or `/cra/check_report/create`.
      #
      # You should call this endpoint after you've received a `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY`
      # webhook, either after the Link session for the user or after calling `/cra/check_report/create`.
      #
      # If the most recent consumer report for the user doesn't have sufficient data to generate the report, or the
      # consumer report has expired, you will receive an error indicating that you should create a new consumer report
      # by calling `/cra/check_report/create`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CheckReport::Types::CraCheckReportVerificationGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.check_report.get_verification(reports_requested: ["VOA"])
      #
      # @return [Plaid::Types::CraCheckReportVerificationGetResponse]
      def get_verification(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cra/check_report/verification/get",
          body: Plaid::CheckReport::Types::CraCheckReportVerificationGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CraCheckReportVerificationGetResponse.load(response.body))
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

      # The `/cra/check_report/verification/pdf/get` endpoint retrieves the most recent Consumer Report in PDF format,
      # specifically formatted for Home Lending verification use cases. Before calling this endpoint, ensure that you've
      # created a VOA report through Link or the `/cra/check_report/create` endpoint, and have received a
      # `CHECK_REPORT_READY` or a `USER_CHECK_REPORT_READY` webhook.
      #
      # The response to `/cra/check_report/verification/pdf/get` is the PDF binary data. The `request_id`  is returned
      # in the `Plaid-Request-ID` header.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CheckReport::Types::CraCheckReportVerificationPdfGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.check_report.get_verification_pdf
      #
      # @return [String]
      def get_verification_pdf(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cra/check_report/verification/pdf/get",
          body: Plaid::CheckReport::Types::CraCheckReportVerificationPdfGetRequest.new(params).to_h,
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
