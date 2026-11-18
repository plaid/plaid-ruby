# frozen_string_literal: true

module Plaid
  module AssetReport
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/asset_report/create` endpoint initiates the process of creating an Asset Report, which can then be
      # retrieved by passing the `asset_report_token` return value to the `/asset_report/get` or `/asset_report/pdf/get`
      # endpoints.
      #
      # The Asset Report takes some time to be created and is not available immediately after calling
      # `/asset_report/create`. The exact amount of time to create the report will vary depending on how many days of
      # history are requested and will typically range from a few seconds to about one minute. When the Asset Report is
      # ready to be retrieved using `/asset_report/get` or `/asset_report/pdf/get`, Plaid will fire a `PRODUCT_READY`
      # webhook. For full details of the webhook schema, see [Asset Report
      # webhooks](https://plaid.com/docs/api/products/assets/#webhooks).
      #
      # The `/asset_report/create` endpoint creates an Asset Report at a moment in time. Asset Reports are immutable. To
      # get an updated Asset Report, use the `/asset_report/refresh` endpoint.
      #
      # @param request_options [Hash]
      # @param params [Plaid::AssetReport::Types::AssetReportCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.asset_report.create(days_requested: 1)
      #
      # @return [Plaid::Types::AssetReportCreateResponse]
      def create(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "asset_report/create",
          body: Plaid::AssetReport::Types::AssetReportCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::AssetReportCreateResponse.load(response.body))
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

      # The `/asset_report/get` endpoint retrieves the Asset Report in JSON format. Before calling `/asset_report/get`,
      # you must first create the Asset Report using `/asset_report/create` (or filter an Asset Report using
      # `/asset_report/filter`) and then wait for the
      # [`PRODUCT_READY`](https://plaid.com/docs/api/products/assets/#product_ready) webhook to fire, indicating that
      # the Report is ready to be retrieved.
      #
      # By default, an Asset Report includes transaction descriptions as returned by the bank, as opposed to parsed and
      # categorized by Plaid. You can also receive cleaned and categorized transactions, as well as additional insights
      # like merchant name or location information. We call this an Asset Report with Insights. An Asset Report with
      # Insights provides transaction category, location, and merchant information in addition to the transaction
      # strings provided in a standard Asset Report. To retrieve an Asset Report with Insights, call the
      # `/asset_report/get` endpoint with `include_insights` set to `true`.
      #
      # For latency-sensitive applications, you can optionally call `/asset_report/create` with `options.add_ons` set to
      # `["fast_assets"]`. This will cause Plaid to create two versions of the Asset Report: one with only current and
      # available balance and identity information, and then later on the complete Asset Report. You will receive
      # separate webhooks for each version of the Asset Report.
      #
      # @param request_options [Hash]
      # @param params [Plaid::AssetReport::Types::AssetReportGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.asset_report.get
      #
      # @return [Plaid::Types::AssetReportGetResponse]
      def get(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "asset_report/get",
          body: Plaid::AssetReport::Types::AssetReportGetRequest.new(params).to_h,
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

      # The `/asset_report/pdf/get` endpoint retrieves the Asset Report in PDF format. Before calling
      # `/asset_report/pdf/get`, you must first create the Asset Report using `/asset_report/create` (or filter an Asset
      # Report using `/asset_report/filter`) and then wait for the
      # [`PRODUCT_READY`](https://plaid.com/docs/api/products/assets/#product_ready) webhook to fire, indicating that
      # the Report is ready to be retrieved.
      #
      # The response to `/asset_report/pdf/get` is the PDF binary data. The `request_id`  is returned in the
      # `Plaid-Request-ID` header.
      #
      # [View a sample PDF Asset Report](https://plaid.com/documents/sample-asset-report.pdf).
      #
      # @param request_options [Hash]
      # @param params [Plaid::AssetReport::Types::AssetReportPdfGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.asset_report.get_pdf(asset_report_token: "asset_report_token")
      #
      # @return [String]
      def get_pdf(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "asset_report/pdf/get",
          body: Plaid::AssetReport::Types::AssetReportPdfGetRequest.new(params).to_h,
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

      # An Asset Report is an immutable snapshot of a user's assets. In order to "refresh" an Asset Report you created
      # previously, you can use the `/asset_report/refresh` endpoint to create a new Asset Report based on the old one,
      # but with the most recent data available.
      #
      # The new Asset Report will contain the same Items as the original Report, as well as the same filters applied by
      # any call to `/asset_report/filter`. By default, the new Asset Report will also use the same parameters you
      # submitted with your original `/asset_report/create` request, but the original `days_requested` value and the
      # values of any parameters in the `options` object can be overridden with new values. To change these arguments,
      # simply supply new values for them in your request to `/asset_report/refresh`. Submit an empty string ("") for
      # any previously-populated fields you would like set as empty.
      #
      # Note: Asset Report refresh is not supported in Canada.
      #
      # @param request_options [Hash]
      # @param params [Plaid::AssetReport::Types::AssetReportRefreshRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.asset_report.refresh(asset_report_token: "asset_report_token")
      #
      # @return [Plaid::Types::AssetReportRefreshResponse]
      def refresh(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "asset_report/refresh",
          body: Plaid::AssetReport::Types::AssetReportRefreshRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::AssetReportRefreshResponse.load(response.body))
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

      # By default, an Asset Report will contain all of the accounts on a given Item. In some cases, you may not want
      # the Asset Report to contain all accounts. For example, you might have the end user choose which accounts are
      # relevant in Link using the Account Select view, which you can enable in the dashboard. Or, you might always
      # exclude certain account types or subtypes, which you can identify by using the `/accounts/get` endpoint. To
      # narrow an Asset Report to only a subset of accounts, use the `/asset_report/filter` endpoint.
      #
      # To exclude certain Accounts from an Asset Report, first use the `/asset_report/create` endpoint to create the
      # report, then send the `asset_report_token` along with a list of `account_ids` to exclude to the
      # `/asset_report/filter` endpoint, to create a new Asset Report which contains only a subset of the original Asset
      # Report's data.
      #
      # Because Asset Reports are immutable, calling `/asset_report/filter` does not alter the original Asset Report in
      # any way; rather, `/asset_report/filter` creates a new Asset Report with a new token and id. Asset Reports
      # created via `/asset_report/filter` do not contain new Asset data, and are not billed.
      #
      # Plaid will fire a [`PRODUCT_READY`](https://plaid.com/docs/api/products/assets/#product_ready) webhook once
      # generation of the filtered Asset Report has completed.
      #
      # @param request_options [Hash]
      # @param params [Plaid::AssetReport::Types::AssetReportFilterRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.asset_report.filter(
      #     asset_report_token: "asset_report_token",
      #     account_ids_to_exclude: ["account_ids_to_exclude"]
      #   )
      #
      # @return [Plaid::Types::AssetReportFilterResponse]
      def filter(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "asset_report/filter",
          body: Plaid::AssetReport::Types::AssetReportFilterRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::AssetReportFilterResponse.load(response.body))
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

      # The `/item/remove` endpoint allows you to invalidate an `access_token`, meaning you will not be able to create
      # new Asset Reports with it. Removing an Item does not affect any Asset Reports or Audit Copies you have already
      # created, which will remain accessible until you remove them specifically.
      #
      # The `/asset_report/remove` endpoint allows you to remove access to an Asset Report. Removing an Asset Report
      # invalidates its `asset_report_token`, meaning you will no longer be able to use it to access Report data or
      # create new Audit Copies. Removing an Asset Report does not affect the underlying Items, but does invalidate any
      # `audit_copy_tokens` associated with the Asset Report.
      #
      # @param request_options [Hash]
      # @param params [Plaid::AssetReport::Types::AssetReportRemoveRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.asset_report.remove(asset_report_token: "asset_report_token")
      #
      # @return [Plaid::Types::AssetReportRemoveResponse]
      def remove(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "asset_report/remove",
          body: Plaid::AssetReport::Types::AssetReportRemoveRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::AssetReportRemoveResponse.load(response.body))
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

      # Plaid can provide an Audit Copy of any Asset Report directly to a participating third party on your behalf. For
      # example, Plaid can supply an Audit Copy directly to the GSEs on your behalf if you participate in Fannie Mae's
      # Day 1 Certainty™ program or utilize Freddie Mac's Loan Product Advisor® (LPA®) Asset and Income Modeler (AIM).
      # An Audit Copy contains the same underlying data as the Asset Report.
      #
      # To grant access to an Audit Copy, use the `/asset_report/audit_copy/create` endpoint to create an
      # `audit_copy_token` and then pass that token to the third party who needs access. Each third party has its own
      # `auditor_id`, for example `fannie_mae`. You'll need to create a separate Audit Copy for each third party to whom
      # you want to grant access to the Report.
      #
      # @param request_options [Hash]
      # @param params [Plaid::AssetReport::Types::AssetReportAuditCopyCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.asset_report.create_audit_copy(asset_report_token: "asset_report_token")
      #
      # @return [Plaid::Types::AssetReportAuditCopyCreateResponse]
      def create_audit_copy(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "asset_report/audit_copy/create",
          body: Plaid::AssetReport::Types::AssetReportAuditCopyCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::AssetReportAuditCopyCreateResponse.load(response.body))
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

      # `/asset_report/audit_copy/get` allows auditors to get a copy of an Asset Report that was previously shared via
      # the `/asset_report/audit_copy/create` endpoint.  The caller of `/asset_report/audit_copy/create` must provide
      # the `audit_copy_token` to the auditor.  This token can then be used to call `/asset_report/audit_copy/get`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::AssetReport::Types::AssetReportAuditCopyGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.asset_report.get_audit_copy(audit_copy_token: "audit_copy_token")
      #
      # @return [Plaid::Types::AssetReportGetResponse]
      def get_audit_copy(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "asset_report/audit_copy/get",
          body: Plaid::AssetReport::Types::AssetReportAuditCopyGetRequest.new(params).to_h,
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

      # The `/asset_report/audit_copy/pdf/get` endpoint retrieves an Asset Report Audit Copy in PDF format. The caller
      # must provide the `audit_copy_token` that was shared via the `/asset_report/audit_copy/create` endpoint.
      #
      # The response to `/asset_report/audit_copy/pdf/get` is the PDF binary data. The `request_id` is returned in the
      # `Plaid-Request-ID` header.
      #
      # [View a sample PDF Asset Report](https://plaid.com/documents/sample-asset-report.pdf).
      #
      # @param request_options [Hash]
      # @param params [Plaid::AssetReport::Types::AssetReportAuditCopyPdfGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.asset_report.get_audit_copy_pdf(audit_copy_token: "audit_copy_token")
      #
      # @return [String]
      def get_audit_copy_pdf(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "asset_report/audit_copy/pdf/get",
          body: Plaid::AssetReport::Types::AssetReportAuditCopyPdfGetRequest.new(params).to_h,
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

      # The `/asset_report/audit_copy/remove` endpoint allows you to remove an Audit Copy. Removing an Audit Copy
      # invalidates the `audit_copy_token` associated with it, meaning both you and any third parties holding the token
      # will no longer be able to use it to access Report data. Items associated with the Asset Report, the Asset Report
      # itself and other Audit Copies of it are not affected and will remain accessible after removing the given Audit
      # Copy.
      #
      # @param request_options [Hash]
      # @param params [Plaid::AssetReport::Types::AssetReportAuditCopyRemoveRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.asset_report.remove_audit_copy(audit_copy_token: "audit_copy_token")
      #
      # @return [Plaid::Types::AssetReportAuditCopyRemoveResponse]
      def remove_audit_copy(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "asset_report/audit_copy/remove",
          body: Plaid::AssetReport::Types::AssetReportAuditCopyRemoveRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::AssetReportAuditCopyRemoveResponse.load(response.body))
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
