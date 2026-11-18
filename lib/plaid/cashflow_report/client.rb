# frozen_string_literal: true

module Plaid
  module CashflowReport
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # `/cashflow_report/refresh` is an endpoint that initiates an on-demand extraction to fetch the newest
      # transactions for an Item (given an `item_id`). The Item must already have Cashflow Report added as a product in
      # order to call `/cashflow_report/refresh`.
      #
      # After calling `/cashflow_report/refresh`, Plaid will fire a webhook `CASHFLOW_REPORT_READY` alerting clients
      # that new transactions data can then be ingested via `/cashflow_report/get` or the webhook will contain an error
      # code informing there was an error in refreshing transactions data.
      #
      # Note that the `/cashflow_report/refresh` endpoint is not supported for Capital One (`ins_128026`) non-depository
      # accounts and will result in a `PRODUCTS_NOT_SUPPORTED` error if called on an Item that contains only
      # non-depository accounts from that institution.
      #
      # As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid
      # endpoints (typically less than 10 seconds, but up to 30 seconds or more). If you encounter errors, you may find
      # it necessary to adjust your timeout period for requests.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CashflowReport::Types::CashflowReportRefreshRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.cashflow_report.refresh(
      #     access_token: "access_token",
      #     days_requested: 1
      #   )
      #
      # @return [Plaid::Types::CashflowReportRefreshResponse]
      def refresh(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cashflow_report/refresh",
          body: Plaid::CashflowReport::Types::CashflowReportRefreshRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CashflowReportRefreshResponse.load(response.body))
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

      # The `/cashflow_report/get` endpoint retrieves transactions data associated with an Item. Transactions data is
      # standardized across financial institutions.
      # Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and
      # will not shift. Transactions are not immutable and can also be removed altogether by the institution; a removed
      # transaction will no longer appear in `/cashflow_report/get`.  For more details, see [Pending and posted
      # transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).
      # Due to the potentially large number of transactions associated with an Item, results are paginated. Manipulate
      # the `count` and `cursor` parameters in conjunction with the `has_more` response body field to fetch all
      # available transactions.
      # Note that data isn't likely to be immediately available to `/cashflow_report/get`. Plaid will begin to prepare
      # transactions data upon Item link, if Link was initialized with `cashflow_report`, or if it wasn't, upon the
      # first call to `/cashflow_report/refresh`. To be alerted when transaction data is ready to be fetched, listen for
      # the `CASHFLOW_REPORT_READY` webhook.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CashflowReport::Types::CashflowReportGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.cashflow_report.get(
      #     access_token: "access_token",
      #     days_requested: 1
      #   )
      #
      # @return [Plaid::Types::CashflowReportGetResponse]
      def get(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cashflow_report/get",
          body: Plaid::CashflowReport::Types::CashflowReportGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CashflowReportGetResponse.load(response.body))
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

      # The `/cashflow_report/transactions/get` endpoint retrieves transactions data associated with an Item.
      # Transactions data is standardized across financial institutions.
      # Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and
      # will not shift. Transactions are not immutable and can also be removed altogether by the institution; a removed
      # transaction will no longer appear in `/cashflow_report/transactions/get`.  For more details, see [Pending and
      # posted transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).
      # Due to the potentially large number of transactions associated with an Item, results are paginated. Manipulate
      # the `count` and `cursor` parameters in conjunction with the `has_more` response body field to fetch all
      # available transactions.
      # Note that data isn't likely to be immediately available to `/cashflow_report/transactions/get`. Plaid will begin
      # to prepare transactions data upon Item link, if Link was initialized with `cashflow_report`, or if it wasn't,
      # upon the first call to `/cashflow_report/refresh`. To be alerted when transaction data is ready to be fetched,
      # listen for the `CASHFLOW_REPORT_READY` webhook.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CashflowReport::Types::CashflowReportTransactionsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.cashflow_report.get_transactions(access_token: "access_token")
      #
      # @return [Plaid::Types::CashflowReportTransactionsGetResponse]
      def get_transactions(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cashflow_report/transactions/get",
          body: Plaid::CashflowReport::Types::CashflowReportTransactionsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CashflowReportTransactionsGetResponse.load(response.body))
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

      # The `/cashflow_report/insights/get` endpoint retrieves insights data associated with an Item. Insights are only
      # calculated on credit and depository accounts.
      #
      # @param request_options [Hash]
      # @param params [Plaid::CashflowReport::Types::CashflowReportInsightsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.cashflow_report.get_insights(access_token: "access_token")
      #
      # @return [Plaid::Types::CashflowReportInsightsGetResponse]
      def get_insights(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "cashflow_report/insights/get",
          body: Plaid::CashflowReport::Types::CashflowReportInsightsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::CashflowReportInsightsGetResponse.load(response.body))
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
