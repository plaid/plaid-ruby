# frozen_string_literal: true

module Plaid
  module Transactions
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Note: All new implementations are encouraged to use `/transactions/sync` rather than `/transactions/get`.
      # `/transactions/sync` provides the same functionality as `/transactions/get` and improves developer ease-of-use
      # for handling transactions updates.
      # The `/transactions/get` endpoint allows developers to receive user-authorized transaction data for credit,
      # depository, and loan-type accounts (coverage may be limited). For transaction history from investment accounts,
      # use the [Investments endpoint](https://plaid.com/docs/api/products/investments/) instead. Transaction data is
      # standardized across financial institutions, and in many cases transactions are linked to a clean name, entity
      # type, location, and category. Similarly, account data is standardized and returned with a clean name, number,
      # balance, and other meta information where available.
      # Transactions are returned in reverse-chronological order, and the sequence of transaction ordering is stable and
      # will not shift.  Transactions are not immutable and can also be removed altogether by the institution; a removed
      # transaction will no longer appear in `/transactions/get`.  For more details, see [Pending and posted
      # transactions](https://plaid.com/docs/transactions/transactions-data/#pending-and-posted-transactions).
      # Due to the potentially large number of transactions associated with an Item, results are paginated. Manipulate
      # the `count` and `offset` parameters in conjunction with the `total_transactions` response body field to fetch
      # all available transactions.
      # Data returned by `/transactions/get` will be the data available for the Item as of the most recent successful
      # check for new transactions. Plaid typically checks for new data multiple times a day, but these checks may occur
      # less frequently, such as once a day, depending on the institution. To find out when the Item was last updated,
      # use the [Item Debugger](https://plaid.com/docs/account/activity/#troubleshooting-with-item-debugger) or call
      # `/item/get`; the `item.status.transactions.last_successful_update` field will show the timestamp of the most
      # recent successful update. To force Plaid to check for new transactions, you can use the `/transactions/refresh`
      # endpoint.
      #
      #
      # Note that data may not be immediately available to `/transactions/get`. Plaid will begin to prepare transactions
      # data upon Item link, if Link was initialized with `transactions`, or upon the first call to `/transactions/get`,
      # if it wasn't. To be alerted when transaction data is ready to be fetched, listen for the
      # [`INITIAL_UPDATE`](https://plaid.com/docs/api/products/transactions/#initial_update) and
      # [`HISTORICAL_UPDATE`](https://plaid.com/docs/api/products/transactions/#historical_update) webhooks. If no
      # transaction history is ready when `/transactions/get` is called, it will return a `PRODUCT_NOT_READY` error.
      #
      # Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::Transaction` in the
      # `transactions` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as
      # a `Plaid::Types::TransactionsGetResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transactions::Types::TransactionsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transactions.get(
      #     access_token: "access_token",
      #     start_date: "2023-01-15",
      #     end_date: "2023-01-15"
      #   )
      #
      # @return [Plaid::Internal::OffsetItemIterator]
      def get(request_options: {}, **params)
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
            path: "transactions/get",
            body: Plaid::Transactions::Types::TransactionsGetRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::TransactionsGetResponse.load(response.body))
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

      # `/transactions/refresh` is an optional endpoint that initiates an on-demand extraction to fetch the newest
      # transactions for an Item. The on-demand extraction takes place in addition to the periodic extractions that
      # automatically occur one or more times per day for any Transactions-enabled Item. The Item must already have
      # Transactions added as a product in order to call `/transactions/refresh`.
      #
      # If changes to transactions are discovered after calling `/transactions/refresh`, Plaid will fire a webhook: for
      # `/transactions/sync` users,
      # [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#sync_updates_available) will be
      # fired if there are any transactions updated, added, or removed. For users of both `/transactions/sync` and
      # `/transactions/get`,
      # [`TRANSACTIONS_REMOVED`](https://plaid.com/docs/api/products/transactions/#transactions_removed) will be fired
      # if any removed transactions are detected, and
      # [`DEFAULT_UPDATE`](https://plaid.com/docs/api/products/transactions/#default_update) will be fired if any new
      # transactions are detected. New transactions can be fetched by calling `/transactions/get` or
      # `/transactions/sync`.
      #
      # Note that the `/transactions/refresh` endpoint is not supported for Capital One (`ins_128026`) non-depository
      # accounts and will result in a `PRODUCTS_NOT_SUPPORTED` error if called on an Item that contains only
      # non-depository accounts from that institution.
      #
      # As this endpoint triggers a synchronous request for fresh data, latency may be higher than for other Plaid
      # endpoints (typically less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors,
      # you may find it necessary to adjust your timeout period when making requests.
      #
      # `/transactions/refresh` is offered as an optional add-on to Transactions and has a separate [fee
      # model](https://plaid.com/docs/account/billing/#per-request-flat-fee). To request access to this endpoint, submit
      # a [product access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transactions::Types::TransactionsRefreshRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transactions.refresh(access_token: "access_token")
      #
      # @return [Plaid::Types::TransactionsRefreshResponse]
      def refresh(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "transactions/refresh",
          body: Plaid::Transactions::Types::TransactionsRefreshRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransactionsRefreshResponse.load(response.body))
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

      # The `/transactions/recurring/get` endpoint allows developers to receive a summary of the recurring outflow and
      # inflow streams (expenses and deposits) from a user's checking, savings or credit card accounts. Additionally,
      # Plaid provides key insights about each recurring stream including the category, merchant, last amount, and more.
      # Developers can use these insights to build tools and experiences that help their users better manage cash flow,
      # monitor subscriptions, reduce spend, and stay on track with bill payments.
      #
      # This endpoint is offered as an add-on to Transactions. To request access to this endpoint, submit a [product
      # access request](https://dashboard.plaid.com/team/products) or contact your Plaid account manager.
      #
      # This endpoint can only be called on an Item that has already been initialized with Transactions (either during
      # Link, by specifying it in `/link/token/create`; or after Link, by calling `/transactions/get` or
      # `/transactions/sync`).
      #
      # When using Recurring Transactions, for best results, make sure to use the
      # [`days_requested`](https://plaid.com/docs/api/link/#link-token-create-request-transactions-days-requested)
      # parameter to request at least 180 days of history when initializing Items with Transactions. Once all historical
      # transactions have been fetched, call `/transactions/recurring/get` to receive the Recurring Transactions streams
      # and subscribe to the
      # [`RECURRING_TRANSACTIONS_UPDATE`](https://plaid.com/docs/api/products/transactions/#recurring_transactions_update)
      # webhook. To know when historical transactions have been fetched, if you are using `/transactions/sync` listen
      # for the
      # [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#SyncUpdatesAvailableWebhook-historical-update-complete)
      # webhook and check that the `historical_update_complete` field in the payload is `true`. If using
      # `/transactions/get`, listen for the
      # [`HISTORICAL_UPDATE`](https://plaid.com/docs/api/products/transactions/#historical_update) webhook.
      #
      # After the initial call, you can call the `/transactions/recurring/get` endpoint at any point in the future to
      # retrieve the latest summary of recurring streams. Listen to the
      # [`RECURRING_TRANSACTIONS_UPDATE`](https://plaid.com/docs/api/products/transactions/#recurring_transactions_update)
      # webhook to be notified when new updates are available.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transactions::Types::TransactionsRecurringGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transactions.get_recurring(access_token: "access_token")
      #
      # @return [Plaid::Types::TransactionsRecurringGetResponse]
      def get_recurring(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "transactions/recurring/get",
          body: Plaid::Transactions::Types::TransactionsRecurringGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransactionsRecurringGetResponse.load(response.body))
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

      # The `/transactions/sync` endpoint retrieves transactions associated with an Item and can fetch updates using a
      # cursor to track which updates have already been seen.
      #
      # For important instructions on integrating with `/transactions/sync`, see the [Transactions integration
      # overview](https://plaid.com/docs/transactions/#integration-overview). If you are migrating from an existing
      # integration using `/transactions/get`, see the [Transactions Sync migration
      # guide](https://plaid.com/docs/transactions/sync-migration/).
      #
      # This endpoint supports `credit`, `depository`, and `loan`-type accounts. For `investments` accounts, use
      # `/investments/transactions/get` instead.
      #
      # When retrieving paginated updates, track both the `next_cursor` from the latest response and the original cursor
      # from the first call in which `has_more` was `true`; if a call to `/transactions/sync` fails when retrieving a
      # paginated update (e.g. due to the
      # [`TRANSACTIONS_SYNC_MUTATION_DURING_PAGINATION`](https://plaid.com/docs/errors/transactions/#transactions_sync_mutation_during_pagination)
      # error), the entire pagination request loop must be restarted beginning with the cursor for the first page of the
      # update, rather than retrying only the single request that failed.
      #
      # If transactions data is not yet available for the Item, which can happen if the Item was not initialized with
      # transactions during the `/link/token/create` call or if `/transactions/sync` was called within a few seconds of
      # Item creation, `/transactions/sync` will return empty transactions arrays.
      #
      # Plaid typically checks for new transactions data between one and four times per day, depending on the
      # institution. To find out when transactions were last updated for an Item, use the [Item
      # Debugger](https://plaid.com/docs/account/activity/#troubleshooting-with-item-debugger) or call `/item/get`; the
      # `item.status.transactions.last_successful_update` field will show the timestamp of the most recent successful
      # update. To force Plaid to check for new transactions, use the `/transactions/refresh` endpoint.
      #
      # To be alerted when new transactions are available, listen for the
      # [`SYNC_UPDATES_AVAILABLE`](https://plaid.com/docs/api/products/transactions/#sync_updates_available) webhook.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transactions::Types::TransactionsSyncRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transactions.sync(access_token: "access_token")
      #
      # @return [Plaid::Types::TransactionsSyncResponse]
      def sync(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "transactions/sync",
          body: Plaid::Transactions::Types::TransactionsSyncRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransactionsSyncResponse.load(response.body))
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

      # The `/transactions/enrich` endpoint enriches raw transaction data generated by your own banking products or
      # retrieved from other non-Plaid sources.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transactions::Types::TransactionsEnrichRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transactions.enrich(
      #     account_type: "account_type",
      #     transactions: [{
      #       id: "id",
      #       description: "description",
      #       amount: 1.1,
      #       direction: "INFLOW",
      #       iso_currency_code: "iso_currency_code"
      #     }]
      #   )
      #
      # @return [Plaid::Types::TransactionsEnrichResponse]
      def enrich(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "transactions/enrich",
          body: Plaid::Transactions::Types::TransactionsEnrichRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransactionsEnrichResponse.load(response.body))
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

      # The `/beta/transactions/rules/v1/create` endpoint creates transaction categorization rules.
      #
      # Rules will be applied on the Item's transactions returned in `/transactions/get` response.
      #
      # The product is currently in beta. To request access, contact transactions-feedback@plaid.com.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transactions::Types::TransactionsRulesCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transactions.create_rule(
      #     client_user_id: "your-client-user-id",
      #     pfc_primary_category: "FOOD_AND_DRINK",
      #     pfc_detailed_category: "FOOD_AND_DRINK_FAST_FOOD",
      #     rule_details: {
      #       field: "MERCHANT_NAME",
      #       type: "SUBSTRING_MATCH",
      #       query: "Burger Shack"
      #     }
      #   )
      #
      # @return [Plaid::Types::TransactionsRulesCreateResponse]
      def create_rule(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beta/transactions/rules/v1/create",
          body: Plaid::Transactions::Types::TransactionsRulesCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransactionsRulesCreateResponse.load(response.body))
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

      # The `/beta/transactions/rules/v1/list` returns a list of transaction rules created for the end user specified by
      # `client_user_id`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transactions::Types::TransactionsRulesListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transactions.list_rules(client_user_id: "your-client-user-id")
      #
      # @return [Plaid::Types::TransactionsRulesListResponse]
      def list_rules(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beta/transactions/rules/v1/list",
          body: Plaid::Transactions::Types::TransactionsRulesListRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransactionsRulesListResponse.load(response.body))
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

      # The `/beta/transactions/rules/v1/remove` endpoint is used to remove a transaction rule.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transactions::Types::TransactionsRulesRemoveRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transactions.remove_rule(
      #     client_user_id: "your-client-user-id",
      #     rule_id: "eVBnVMp7zdTJLkRNr33Rs6zr7KNJqBF"
      #   )
      #
      # @return [Plaid::Types::TransactionsRulesRemoveResponse]
      def remove_rule(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beta/transactions/rules/v1/remove",
          body: Plaid::Transactions::Types::TransactionsRulesRemoveRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransactionsRulesRemoveResponse.load(response.body))
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

      # The `/beta/transactions/user_insights/v1/get` gets user insights for clients who have enriched data with
      # `/transactions/enrich`.
      #
      # The product is currently in beta.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transactions::Types::TransactionsUserInsightsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transactions.get_user_insights(client_user_id: "client_user_id")
      #
      # @return [Plaid::Types::TransactionsUserInsightsGetResponse]
      def get_user_insights(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "beta/transactions/user_insights/v1/get",
          body: Plaid::Transactions::Types::TransactionsUserInsightsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransactionsUserInsightsGetResponse.load(response.body))
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
