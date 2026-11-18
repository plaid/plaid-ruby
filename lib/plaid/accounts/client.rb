# frozen_string_literal: true

module Plaid
  module Accounts
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/accounts/get` endpoint can be used to retrieve a list of accounts associated with any linked Item. Plaid
      # will only return active bank accounts -- that is, accounts that are not closed and are capable of carrying a
      # balance.
      # To return new accounts that were created after the user linked their Item, you can listen for the
      # [`NEW_ACCOUNTS_AVAILABLE`](https://plaid.com/docs/api/items/#new_accounts_available) webhook and then use Link's
      # [update mode](https://plaid.com/docs/link/update-mode/) to request that the user share this new account with
      # you.
      #
      # `/accounts/get` is free to use and retrieves cached information, rather than extracting fresh information from
      # the institution. The balance returned will reflect the balance at the time of the last successful Item update.
      # If the Item is enabled for a regularly updating product, such as Transactions, Investments, or Liabilities, the
      # balance will typically update about once a day, as long as the Item is healthy. If the Item is enabled only for
      # products that do not frequently update, such as Auth or Identity, balance data may be much older.
      #
      # For real-time balance information, use the paid endpoints `/accounts/balance/get` or `/signal/evaluate` instead.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Accounts::Types::AccountsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.accounts.get(
      #     access_token: "string",
      #     options: {
      #       account_ids: ["string"]
      #     }
      #   )
      #
      # @return [Plaid::Types::AccountsGetResponse]
      def get(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "accounts/get",
          body: Plaid::Accounts::Types::AccountsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::AccountsGetResponse.load(response.body))
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

      # The `/accounts/balance/get` endpoint returns the real-time balance for each of an Item's accounts. While other
      # endpoints, such as `/accounts/get`, return a balance object,  `/accounts/balance/get` forces the available and
      # current balance fields to be refreshed rather than cached. This endpoint can be used for existing Items that
      # were added via any of Plaid's other products. This endpoint can be used as long as Link has been initialized
      # with any other product; `balance` itself is not a product that can be used to initialize Link. As this endpoint
      # triggers a synchronous request for fresh data, latency may be higher than for other Plaid endpoints (typically
      # less than 10 seconds, but occasionally up to 30 seconds or more); if you encounter errors, you may find it
      # necessary to adjust your timeout period when making requests.
      #
      # Note: If you are getting real-time balance for the purpose of assessing the return risk of a proposed ACH
      # transaction, it is recommended to use `/signal/evaluate` instead of `/accounts/balance/get`. `/signal/evaluate`
      # returns the same real-time balance information and also provides access to Signal Rules, which provides no-code
      # transaction business logic configuration, backtesting and recommendations for tuning your transaction acceptance
      # logic, and the ability to easily switch between Balance and Signal Transaction Scores as needed for
      # ultra-low-latency, ML-powered risk assessments. For more details, see the [Balance
      # documentation](https://plaid.com/docs/balance/#balance-integration-options).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Accounts::Types::AccountsBalanceGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.accounts.get_balance(
      #     access_token: "string",
      #     options: {
      #       account_ids: ["string"]
      #     }
      #   )
      #
      # @return [Plaid::Types::AccountsGetResponse]
      def get_balance(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "accounts/balance/get",
          body: Plaid::Accounts::Types::AccountsBalanceGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::AccountsGetResponse.load(response.body))
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
