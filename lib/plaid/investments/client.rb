# frozen_string_literal: true

module Plaid
  module Investments
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/investments/holdings/get` endpoint allows developers to receive user-authorized stock position data for
      # `investment`-type accounts.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Investments::Types::InvestmentsHoldingsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.investments.get_holdings(access_token: "access_token")
      #
      # @return [Plaid::Types::InvestmentsHoldingsGetResponse]
      def get_holdings(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "investments/holdings/get",
          body: Plaid::Investments::Types::InvestmentsHoldingsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::InvestmentsHoldingsGetResponse.load(response.body))
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

      # The `/investments/transactions/get` endpoint allows developers to retrieve up to 24 months of user-authorized
      # transaction data for investment accounts.
      #
      # Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and
      # will not shift.
      #
      # Due to the potentially large number of investment transactions associated with an Item, results are paginated.
      # Manipulate the count and offset parameters in conjunction with the `total_investment_transactions` response body
      # field to fetch all available investment transactions.
      #
      # Note that Investments does not have a webhook to indicate when initial transaction data has loaded (unless you
      # use the `async_update` option). Instead, if transactions data is not ready when `/investments/transactions/get`
      # is first called, Plaid will wait for the data. For this reason, calling `/investments/transactions/get`
      # immediately after Link may take up to one to two minutes to return.
      #
      # Data returned by the asynchronous investments extraction flow (when `async_update` is set to true) may not be
      # immediately available to `/investments/transactions/get`. To be alerted when the data is ready to be fetched,
      # listen for the `HISTORICAL_UPDATE` webhook. If no investments history is ready when
      # `/investments/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error.
      #
      # Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::InvestmentTransaction` in the
      # `investment_transactions` field of every page, requesting pages as they are needed. Call `pages` on it to get
      # each page as a `Plaid::Types::InvestmentsTransactionsGetResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Investments::Types::InvestmentsTransactionsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.investments.get_transactions(
      #     access_token: "access_token",
      #     start_date: "2023-01-15",
      #     end_date: "2023-01-15"
      #   )
      #
      # @return [Plaid::Internal::OffsetItemIterator]
      def get_transactions(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::OffsetItemIterator.new(
          initial_page: Plaid::Internal::Types::Utils.normalize_keys(params[:options].to_h)[:offset],
          item_field: :investment_transactions,
          has_next_field: nil,
          step: true
        ) do |next_page|
          params[:options] = Plaid::Internal::Types::Utils.normalize_keys(params[:options].to_h).merge(offset: next_page)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "investments/transactions/get",
            body: Plaid::Investments::Types::InvestmentsTransactionsGetRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::InvestmentsTransactionsGetResponse.load(response.body))
            rescue ::JSON::ParserError
              raise Plaid::Errors::ResponseError.new(response.body, code: code, headers: response.to_hash)
            end
            [parsed_response, response]
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

      # `/investments/refresh` is an optional endpoint for users of the Investments product. It initiates an on-demand
      # extraction to fetch the newest investment holdings and transactions for an Item. This on-demand extraction takes
      # place in addition to the periodic extractions that automatically occur one or more times per day for any
      # Investments-enabled Item. If changes to investments are discovered after calling `/investments/refresh`, Plaid
      # will fire webhooks: [`HOLDINGS:
      # DEFAULT_UPDATE`](https://plaid.com/docs/api/products/investments/#holdings-default_update) if any new holdings
      # are detected, and [`INVESTMENTS_TRANSACTIONS:
      # DEFAULT_UPDATE`](https://plaid.com/docs/api/products/investments/#investments_transactions-default_update) if
      # any new investment transactions are detected. This webhook will typically not fire in the Sandbox environment,
      # due to the lack of dynamic investment transactions and holdings data. To test this webhook in Sandbox, call
      # `/sandbox/item/fire_webhook`. Updated holdings and investment transactions can be fetched by calling
      # `/investments/holdings/get` and `/investments/transactions/get`. Note that the `/investments/refresh` endpoint
      # is not supported by all institutions. If called on an Item from an institution that does not support this
      # functionality, it will return a `PRODUCTS_NOT_SUPPORTED` error.
      #
      # As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid
      # endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors,
      # you may find it necessary to adjust your timeout period when making requests.
      #
      # `/investments/refresh` is offered as an add-on to Investments and has a separate [fee
      # model](https://plaid.com/docs/account/billing/#per-request-flat-fee). To request access to this endpoint, submit
      # a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Investments::Types::InvestmentsRefreshRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.investments.refresh(access_token: "access_token")
      #
      # @return [Plaid::Types::InvestmentsRefreshResponse]
      def refresh(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "investments/refresh",
          body: Plaid::Investments::Types::InvestmentsRefreshRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::InvestmentsRefreshResponse.load(response.body))
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

      # The `/investments/auth/get` endpoint allows developers to receive user-authorized data to facilitate the
      # transfer of holdings
      #
      # @param request_options [Hash]
      # @param params [Plaid::Investments::Types::InvestmentsAuthGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.investments.get_auth(access_token: "access_token")
      #
      # @return [Plaid::Types::InvestmentsAuthGetResponse]
      def get_auth(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "investments/auth/get",
          body: Plaid::Investments::Types::InvestmentsAuthGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::InvestmentsAuthGetResponse.load(response.body))
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
