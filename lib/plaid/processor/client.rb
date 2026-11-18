# frozen_string_literal: true

module Plaid
  module Processor
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/processor/auth/get` endpoint returns the bank account and bank identification number (such as the routing
      # number, for US accounts), for a checking, savings, or cash management account that''s associated with a given
      # `processor_token`. The endpoint also returns high-level account data and balances when available.
      #
      # Versioning note: API versions 2019-05-29 and earlier use a different schema for the `numbers` object returned by
      # this endpoint. For details, see [Plaid API
      # versioning](https://plaid.com/docs/api/versioning/#version-2020-09-14).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorAuthGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.get_auth(processor_token: "processor_token")
      #
      # @return [Plaid::Types::ProcessorAuthGetResponse]
      def get_auth(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/auth/get",
          body: Plaid::Processor::Types::ProcessorAuthGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorAuthGetResponse.load(response.body))
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

      # This endpoint returns the account associated with a given processor token.
      #
      # This endpoint retrieves cached information, rather than extracting fresh information from the institution. As a
      # result, the account balance returned may not be up-to-date; for real-time balance information, use
      # `/processor/balance/get` instead. Note that some information is nullable.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorAccountGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.get_account(processor_token: "processor_token")
      #
      # @return [Plaid::Types::ProcessorAccountGetResponse]
      def get_account(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/account/get",
          body: Plaid::Processor::Types::ProcessorAccountGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorAccountGetResponse.load(response.body))
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

      # This endpoint returns the stock position data of the account associated with a given processor token.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorInvestmentsHoldingsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.get_investment_holdings(processor_token: "processor_token")
      #
      # @return [Plaid::Types::ProcessorInvestmentsHoldingsGetResponse]
      def get_investment_holdings(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/investments/holdings/get",
          body: Plaid::Processor::Types::ProcessorInvestmentsHoldingsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorInvestmentsHoldingsGetResponse.load(response.body))
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

      # The `/processor/investments/auth/get` endpoint allows you to retrieve information about the account
      # authorized by a processor token, including account numbers, account owners, holdings, and data provenance
      # information.
      #
      # To receive Investments Auth webhooks for a processor token, set its webhook URL via the
      # [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate)
      # endpoint.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorInvestmentsAuthGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.get_investment_auth(processor_token: "processor_token")
      #
      # @return [Plaid::Types::ProcessorInvestmentsAuthGetResponse]
      def get_investment_auth(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/investments/auth/get",
          body: Plaid::Processor::Types::ProcessorInvestmentsAuthGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorInvestmentsAuthGetResponse.load(response.body))
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

      # The `/processor/investments/transactions/get` endpoint allows developers to retrieve up to 24 months of
      # user-authorized transaction data for the investment account associated with the processor token.
      #
      # Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and
      # will not shift.
      #
      # Due to the potentially large number of investment transactions associated with the account, results are
      # paginated. Manipulate the count and offset parameters in conjunction with the `total_investment_transactions`
      # response body field to fetch all available investment transactions.
      #
      # Note that Investments does not have a webhook to indicate when initial transaction data has loaded (unless you
      # use the `async_update` option). Instead, if transactions data is not ready when
      # `/processor/investments/transactions/get` is first called, Plaid will wait for the data. For this reason,
      # calling `/processor/investments/transactions/get` immediately after Link may take up to one to two minutes to
      # return.
      #
      # Data returned by the asynchronous investments extraction flow (when `async_update` is set to true) may not be
      # immediately available to `/processor/investments/transactions/get`. To be alerted when the data is ready to be
      # fetched, listen for the `HISTORICAL_UPDATE` webhook. If no investments history is ready when
      # `/processor/investments/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error.
      #
      # To receive Investments Transactions webhooks for a processor token, set its webhook URL via the
      # [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate)
      # endpoint.
      #
      # Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::InvestmentTransaction` in the
      # `investment_transactions` field of every page, requesting pages as they are needed. Call `pages` on it to get
      # each page as a `Plaid::Types::ProcessorInvestmentsTransactionsGetResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorInvestmentsTransactionsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.get_investment_transactions(
      #     processor_token: "processor_token",
      #     start_date: "2023-01-15",
      #     end_date: "2023-01-15"
      #   )
      #
      # @return [Plaid::Internal::OffsetItemIterator]
      def get_investment_transactions(request_options: {}, **params)
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
            path: "processor/investments/transactions/get",
            body: Plaid::Processor::Types::ProcessorInvestmentsTransactionsGetRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorInvestmentsTransactionsGetResponse.load(response.body))
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

      # The `/processor/transactions/get` endpoint allows developers to receive user-authorized transaction data for
      # credit, depository, and loan-type accounts (coverage may be limited). Transaction data is standardized across
      # financial institutions, and in many cases transactions are linked to a clean name, entity type, location, and
      # category. Similarly, account data is standardized and returned with a clean name, number, balance, and other
      # meta information where available.
      #
      # Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and
      # will not shift.  Transactions are not immutable and can also be removed altogether by the institution; a removed
      # transaction will no longer appear in `/processor/transactions/get`.  For more details, see [Pending and posted
      # transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).
      #
      # Due to the potentially large number of transactions associated with a processor token, results are paginated.
      # Manipulate the `count` and `offset` parameters in conjunction with the `total_transactions` response body field
      # to fetch all available transactions.
      #
      # Data returned by `/processor/transactions/get` will be the data available for the processor token as of the most
      # recent successful check for new transactions. Plaid typically checks for new data multiple times a day, but
      # these checks may occur less frequently, such as once a day, depending on the institution. To force Plaid to
      # check for new transactions, you can use the `/processor/transactions/refresh` endpoint.
      #
      # Note that data may not be immediately available to `/processor/transactions/get`. Plaid will begin to prepare
      # transactions data upon Item link, if Link was initialized with `transactions`, or upon the first call to
      # `/processor/transactions/get`, if it wasn't. If no transaction history is ready when
      # `/processor/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error.
      #
      # To receive Transactions webhooks for a processor token, set its webhook URL via the
      # [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate)
      # endpoint.
      #
      # Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::Transaction` in the
      # `transactions` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as
      # a `Plaid::Types::ProcessorTransactionsGetResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorTransactionsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.get_transactions(
      #     processor_token: "processor_token",
      #     start_date: "2023-01-15",
      #     end_date: "2023-01-15"
      #   )
      #
      # @return [Plaid::Internal::OffsetItemIterator]
      def get_transactions(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::OffsetItemIterator.new(
          initial_page: Plaid::Internal::Types::Utils.normalize_keys(params[:options].to_h)[:offset],
          item_field: :transactions,
          has_next_field: nil,
          step: true
        ) do |next_page|
          params[:options] = Plaid::Internal::Types::Utils.normalize_keys(params[:options].to_h).merge(offset: next_page)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "processor/transactions/get",
            body: Plaid::Processor::Types::ProcessorTransactionsGetRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorTransactionsGetResponse.load(response.body))
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

      #
      # The `/processor/transactions/sync` endpoint retrieves transactions associated with an Item and can fetch updates
      # using a cursor to track which updates have already been seen.
      #
      # For important instructions on integrating with `/processor/transactions/sync`, see the [Transactions integration
      # overview](https://plaid.com/docs/transactions/#integration-overview). If you are migrating from an existing
      # integration using `/processor/transactions/get`, see the [Transactions Sync migration
      # guide](https://plaid.com/docs/transactions/sync-migration/).
      #
      # This endpoint supports `credit`, `depository`, and `loan`-type accounts. For `investments` accounts, use
      # `/processor/investments/transactions/get` instead.
      #
      # When retrieving paginated updates, track both the `next_cursor` from the latest response and the original cursor
      # from the first call in which `has_more` was `true`; if a call to `/processor/transactions/sync` fails when
      # retrieving a paginated update (e.g. due to the
      # [`TRANSACTIONS_SYNC_MUTATION_DURING_PAGINATION`](https://plaid.com/docs/errors/transactions/#transactions_sync_mutation_during_pagination)
      # error), the entire pagination request loop must be restarted beginning with the cursor for the first page of the
      # update, rather than retrying only the single request that failed.
      #
      # If transactions data is not yet available for the Item, which can happen if the Item was not initialized with
      # transactions during the `/link/token/create` call or if `/processor/transactions/sync` was called within a few
      # seconds of Item creation, `/processor/transactions/sync` will return empty transactions arrays.
      #
      # Plaid typically checks for new transactions data between one and four times per day, depending on the
      # institution. To find out when transactions were last updated for an Item, use the [Item
      # Debugger](https://plaid.com/docs/account/activity/#troubleshooting-with-item-debugger) or call `/item/get`; the
      # `item.status.transactions.last_successful_update` field will show the timestamp of the most recent successful
      # update. To force Plaid to check for new transactions, use the `/processor/transactions/refresh` endpoint.
      #
      # To be alerted when new transactions are available, listen for the
      # [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#sync_updates_available) webhook.
      #
      # To receive Transactions webhooks for a processor token, set its webhook URL via the
      # [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate)
      # endpoint.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorTransactionsSyncRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.sync_transactions(processor_token: "processor_token")
      #
      # @return [Plaid::Types::ProcessorTransactionsSyncResponse]
      def sync_transactions(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/transactions/sync",
          body: Plaid::Processor::Types::ProcessorTransactionsSyncRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorTransactionsSyncResponse.load(response.body))
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

      # `/processor/transactions/refresh` is an optional endpoint for users of the Transactions product. It initiates an
      # on-demand extraction to fetch the newest transactions for a processor token. This on-demand extraction takes
      # place in addition to the periodic extractions that automatically occur one or more times per day for any
      # Transactions-enabled processor token. If changes to transactions are discovered after calling
      # `/processor/transactions/refresh`, Plaid will fire a webhook: for `/processor/transactions/sync` users,
      # [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#sync_updates_available) will be
      # fired if there are any transactions updated, added, or removed. For users of both `/processor/transactions/sync`
      # and `/processor/transactions/get`,
      # [`TRANSACTIONS_REMOVED`](https://plaid.com/docs/api/products/transactions/#transactions_removed) will be fired
      # if any removed transactions are detected, and
      # [`DEFAULT_UPDATE`](https://plaid.com/docs/api/products/transactions/#default_update) will be fired if any new
      # transactions are detected. New transactions can be fetched by calling `/processor/transactions/get` or
      # `/processor/transactions/sync`. Note that the `/processor/transactions/refresh` endpoint is not supported for
      # Capital One (`ins_128026`) non-depository accounts and will result in a `PRODUCTS_NOT_SUPPORTED` error if called
      # on an Item that contains only non-depository accounts from that institution.
      #
      # As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid
      # endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors,
      # you may find it necessary to adjust your timeout period when making requests.
      #
      # `/processor/transactions/refresh` is offered as an add-on to Transactions and has a separate [fee
      # model](https://plaid.com/docs/account/billing/#per-request-flat-fee). To request access to this endpoint, submit
      # a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorTransactionsRefreshRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.refresh_transactions(processor_token: "processor_token")
      #
      # @return [Plaid::Types::ProcessorTransactionsRefreshResponse]
      def refresh_transactions(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/transactions/refresh",
          body: Plaid::Processor::Types::ProcessorTransactionsRefreshRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorTransactionsRefreshResponse.load(response.body))
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

      # The `/processor/transactions/recurring/get` endpoint allows developers to receive a summary of the recurring
      # outflow and inflow streams (expenses and deposits) from a user's checking, savings or credit card accounts.
      # Additionally, Plaid provides key insights about each recurring stream including the category, merchant, last
      # amount, and more. Developers can use these insights to build tools and experiences that help their users better
      # manage cash flow, monitor subscriptions, reduce spend, and stay on track with bill payments.
      #
      # This endpoint is offered as an add-on to Transactions. To request access to this endpoint, submit a [product
      # access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.
      #
      # This endpoint can only be called on a processor token that has already been initialized with Transactions
      # (either during Link, by specifying it in `/link/token/create`; or after Link, by calling
      # `/processor/transactions/get` or `/processor/transactions/sync`). Once all historical transactions have been
      # fetched, call `/processor/transactions/recurring/get` to receive the Recurring Transactions streams and
      # subscribe to the
      # [`RECURRING_TRANSACTIONS_UPDATE`](https://plaid.com/docs/api/products/transactions/#recurring_transactions_update)
      # webhook. To know when historical transactions have been fetched, if you are using `/processor/transactions/sync`
      # listen for the
      # [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#SyncUpdatesAvailableWebhook-historical-update-complete)
      # webhook and check that the `historical_update_complete` field in the payload is `true`. If using
      # `/processor/transactions/get`, listen for the
      # [`HISTORICAL_UPDATE`](https://plaid.com/docs/api/products/transactions/#historical_update) webhook.
      #
      # After the initial call, you can call the `/processor/transactions/recurring/get` endpoint at any point in the
      # future to retrieve the latest summary of recurring streams. Listen to the
      # [`RECURRING_TRANSACTIONS_UPDATE`](https://plaid.com/docs/api/products/transactions/#recurring_transactions_update)
      # webhook to be notified when new updates are available.
      #
      # To receive Transactions webhooks for a processor token, set its webhook URL via the
      # [`/processor/token/webhook/update`](https://plaid.com/docs/api/processor-partners/#processortokenwebhookupdate)
      # endpoint.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorTransactionsRecurringGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.get_recurring_transactions(processor_token: "processor_token")
      #
      # @return [Plaid::Types::ProcessorTransactionsRecurringGetResponse]
      def get_recurring_transactions(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/transactions/recurring/get",
          body: Plaid::Processor::Types::ProcessorTransactionsRecurringGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorTransactionsRecurringGetResponse.load(response.body))
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

      # Use the `/processor/bank_transfer/create` endpoint to initiate a new bank transfer as a processor
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorBankTransferCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.create_bank_transfer(
      #     idempotency_key: "idempotency_key",
      #     processor_token: "processor_token",
      #     type: "debit",
      #     network: "ach",
      #     amount: "amount",
      #     iso_currency_code: "iso_currency_code",
      #     description: "description",
      #     user: {
      #       legal_name: "legal_name"
      #     }
      #   )
      #
      # @return [Plaid::Types::ProcessorBankTransferCreateResponse]
      def create_bank_transfer(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/bank_transfer/create",
          body: Plaid::Processor::Types::ProcessorBankTransferCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorBankTransferCreateResponse.load(response.body))
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

      # The `/processor/liabilities/get` endpoint returns various details about a loan or credit account. Liabilities
      # data is available primarily for US financial institutions, with some limited coverage of Canadian institutions.
      # Currently supported account types are account type `credit` with account subtype `credit card` or `paypal`, and
      # account type `loan` with account subtype `student` or `mortgage`.
      #
      # The types of information returned by Liabilities can include balances and due dates, loan terms, and account
      # details such as original loan amount and guarantor. Data is refreshed approximately once per day; the latest
      # data can be retrieved by calling `/processor/liabilities/get`.
      #
      # Note: This request may take some time to complete if `liabilities` was not specified as an initial product when
      # creating the processor token. This is because Plaid must communicate directly with the institution to retrieve
      # the additional data.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorLiabilitiesGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.get_liabilities(processor_token: "processor_token")
      #
      # @return [Plaid::Types::ProcessorLiabilitiesGetResponse]
      def get_liabilities(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/liabilities/get",
          body: Plaid::Processor::Types::ProcessorLiabilitiesGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorLiabilitiesGetResponse.load(response.body))
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

      # The `/processor/identity/get` endpoint allows you to retrieve various account holder information on file with
      # the financial institution, including names, emails, phone numbers, and addresses.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorIdentityGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.get_identity(processor_token: "processor_token")
      #
      # @return [Plaid::Types::ProcessorIdentityGetResponse]
      def get_identity(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/identity/get",
          body: Plaid::Processor::Types::ProcessorIdentityGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorIdentityGetResponse.load(response.body))
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

      # The `/processor/identity/match` endpoint generates a match score, which indicates how well the provided identity
      # data matches the identity information on file with the account holder's financial institution.
      #
      # Fields within the `balances` object will always be null when retrieved by `/processor/identity/match`. Instead,
      # use the `/processor/balance/get` endpoint to retrieve balance data.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorIdentityMatchRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.match_identity(processor_token: "processor_token")
      #
      # @return [Plaid::Types::ProcessorIdentityMatchResponse]
      def match_identity(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/identity/match",
          body: Plaid::Processor::Types::ProcessorIdentityMatchRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorIdentityMatchResponse.load(response.body))
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

      # The `/processor/balance/get` endpoint returns the real-time balance for the account associated with the
      # processor token. While other endpoints may return a balance object, only `/processor/balance/get` forces the
      # available and current balance fields to be refreshed rather than cached.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorBalanceGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.get_balance(processor_token: "processor_token")
      #
      # @return [Plaid::Types::ProcessorBalanceGetResponse]
      def get_balance(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/balance/get",
          body: Plaid::Processor::Types::ProcessorBalanceGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorBalanceGetResponse.load(response.body))
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

      # Used to create a token suitable for sending to one of Plaid's partners to enable integrations. To create a
      # Stripe bank account token (`btok_...`), use `/processor/stripe/bank_account_token/create`. If using multiple
      # processors, multiple different processor tokens can be created for a single access token. Once created, a
      # processor token for a given Item can be modified by calling `/processor/token/permissions/set`. To revoke the
      # processor's access, the entire Item must be deleted by calling `/item/remove`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorTokenCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.create_token(
      #     access_token: "access_token",
      #     account_id: "account_id",
      #     processor: "dwolla"
      #   )
      #
      # @return [Plaid::Types::ProcessorTokenCreateResponse]
      def create_token(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/token/create",
          body: Plaid::Processor::Types::ProcessorTokenCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorTokenCreateResponse.load(response.body))
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

      # Used to control a processor's access to products on the given processor token. By default, a processor will have
      # access to all available products on the corresponding item. To restrict access to a particular set of products,
      # call this endpoint with the desired products. To restore access to all available products, call this endpoint
      # with an empty list. This endpoint can be called multiple times as your needs and your processor's needs change.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorTokenPermissionsSetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.set_token_permissions(
      #     processor_token: "processor_token",
      #     products: ["assets"]
      #   )
      #
      # @return [Plaid::Types::ProcessorTokenPermissionsSetResponse]
      def set_token_permissions(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/token/permissions/set",
          body: Plaid::Processor::Types::ProcessorTokenPermissionsSetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorTokenPermissionsSetResponse.load(response.body))
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

      # Used to get a processor token's product permissions. The `products` field will be an empty list if the processor
      # can access all available products.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorTokenPermissionsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.get_token_permissions(processor_token: "processor_token")
      #
      # @return [Plaid::Types::ProcessorTokenPermissionsGetResponse]
      def get_token_permissions(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/token/permissions/get",
          body: Plaid::Processor::Types::ProcessorTokenPermissionsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorTokenPermissionsGetResponse.load(response.body))
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

      # This endpoint allows you, the processor, to update the webhook URL associated with a processor token. This
      # request triggers a `WEBHOOK_UPDATE_ACKNOWLEDGED` webhook to the newly specified webhook URL.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorTokenWebhookUpdateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.update_token_webhook(
      #     processor_token: "processor_token",
      #     webhook: nil
      #   )
      #
      # @return [Plaid::Types::ProcessorTokenWebhookUpdateResponse]
      def update_token_webhook(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/token/webhook/update",
          body: Plaid::Processor::Types::ProcessorTokenWebhookUpdateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorTokenWebhookUpdateResponse.load(response.body))
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

      #
      # Used to create a token suitable for sending to Stripe to enable Plaid-Stripe integrations. For a detailed guide
      # on integrating Stripe, see [Add Stripe to your app](https://plaid.com/docs/auth/partnerships/stripe/).
      #
      # Note that the Stripe bank account token is a one-time use token. To store bank account information for later
      # use, you can use a Stripe customer object and create an associated bank account from the token, or you can use a
      # Stripe Custom account and create an associated external bank account from the token. This bank account
      # information should work indefinitely, unless the user's bank account information changes or they revoke Plaid's
      # permissions to access their account. Stripe bank account information cannot be modified once the bank account
      # token has been created. If you ever need to change the bank account details used by Stripe for a specific
      # customer, have the user go through Link again and create a new bank account token from the new `access_token`.
      #
      # To revoke a bank account token, the entire underlying access token must be revoked using `/item/remove`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorStripeBankAccountTokenCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.create_stripe_bank_account_token(
      #     access_token: "access_token",
      #     account_id: "account_id"
      #   )
      #
      # @return [Plaid::Types::ProcessorStripeBankAccountTokenCreateResponse]
      def create_stripe_bank_account_token(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/stripe/bank_account_token/create",
          body: Plaid::Processor::Types::ProcessorStripeBankAccountTokenCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorStripeBankAccountTokenCreateResponse.load(response.body))
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

      # Used to create a token suitable for sending to Apex to enable Plaid-Apex integrations.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Processor::Types::ProcessorApexProcessorTokenCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.processor.create_apex_processor_token(
      #     access_token: "access_token",
      #     account_id: "account_id"
      #   )
      #
      # @return [Plaid::Types::ProcessorTokenCreateResponse]
      def create_apex_processor_token(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "processor/apex/processor_token/create",
          body: Plaid::Processor::Types::ProcessorApexProcessorTokenCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::ProcessorTokenCreateResponse.load(response.body))
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

      # @return [Plaid::Signal::Client]
      def signal
        @signal ||= Plaid::Processor::Signal::Client.new(client: @client)
      end
    end
  end
end
