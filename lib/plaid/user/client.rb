# frozen_string_literal: true

module Plaid
  module User
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # `/user/transactions/refresh` is an optional endpoint that initiates an on-demand extraction to fetch the newest
      # transactions for a User using the Transactions bundle.
      # This bundle refreshes only the Transactions product data.
      # This endpoint is for clients who use the Transactions Insights bundle and want to proactively update all linked
      # Items under a user.
      # The refresh may succeed or fail on a per-Item basis. Use the `results` array in the response to understand the
      # outcome for each Item.
      #
      # This endpoint is distinct from `/transactions/refresh`, which triggers a refresh for a single Item. Use
      # `/user/transactions/refresh` to target all Items for a user instead.
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserTransactionsRefreshRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.user.refresh_transactions(user_id: "usr_8c3ZbDBYjaqUXZ")
      #
      # @return [Plaid::Types::UserTransactionsRefreshResponse]
      def refresh_transactions(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/transactions/refresh",
          body: Plaid::User::Types::UserTransactionsRefreshRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserTransactionsRefreshResponse.load(response.body))
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

      # `/user/financial_data/refresh` is an optional endpoint that initiates an on-demand extraction to fetch the
      # newest transactions for a User using the Financial Insights bundle.
      # This bundle refreshes the Transactions and Investments product data.
      # This endpoint is for clients who use the Financial Insights bundle and want to proactively update all linked
      # Items under a user.
      # The refresh may succeed or fail on a per-Item basis. Use the `results` array in the response to understand the
      # outcome for each Item.
      #
      # This endpoint is distinct from `/transactions/refresh`, which triggers a refresh for a single Item. Use
      # `/user/financial_data/refresh` to target all Items for a user instead.
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserFinancialDataRefreshRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.user.refresh_financial_data(user_id: "usr_8c3ZbDBYjaqUXZ")
      #
      # @return [Plaid::Types::UserFinancialDataRefreshResponse]
      def refresh_financial_data(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/financial_data/refresh",
          body: Plaid::User::Types::UserFinancialDataRefreshRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserFinancialDataRefreshResponse.load(response.body))
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

      # For Plaid products and flows that use the user object, `/user/create` provides you a single token to access all
      # data associated with the user. You must call this endpoint before calling `/link/token/create` if you are using
      # any of the following: Plaid Check, Income Verification, Multi-Item Link, or Plaid Protect (Identity). If you are
      # using Plaid Protect Link session scoring, you do not need to call `/user/create` first; Plaid will resolve or
      # create the user when `user.client_user_id` is provided in `/link/token/create`.
      # For customers who began using this endpoint on or after December 10, 2025, this endpoint takes a
      # `client_user_id` and an `identity` object and will return a `user_id`. For customers who began using it before
      # that date, the endpoint takes a `client_user_id` and a `consumer_report_user_identity` object and will return a
      # `user_token` and `user_id`. For more details, see [New User APIs](https://plaid.com/docs/api/users/user-apis).
      # In order to create a Plaid Check Consumer Report for a user, or to use Payment Initiation, Variable Recurring
      # Payments, or Virtual Accounts, the `identity` (new) or `consumer_report_user_identity` (legacy) object must be
      # present. If it is not provided during the `/user/create` call, it can be added later by calling `/user/update`.
      #
      #
      # When using Payment Initiation, Variable Recurring Payments, or Virtual Accounts, the `identity` object must
      # contain a `name` and either an email address or a phone number.
      #
      #
      # In order to generate a Plaid Check Consumer Report, the following `identity` fields, at minimum, are required
      # and must be non-empty: `name`, `date_of_birth`, `emails`, `phone_numbers`, and `addresses` (with at least one
      # email, phone number, and address designated as `primary`). Plaid Check Consumer Reports can only be created for
      # US-based users; the user's address country must be `US`. If creating a report for sharing with a GSE such as
      # Fannie or Freddie, the user's full SSN must be provided via the `id_numbers` field. Providing at least a partial
      # SSN is also strongly recommended for all use cases, since it improves the accuracy of matching user records
      # during compliance processes such as file disclosure, dispute, or security freeze requests.
      #
      #
      # When using Plaid Protect, it is highly recommended that you provide an `identity` object to better identify and
      # block fraud across your Link sessions.
      #
      #
      # Plaid will normalize identity fields before storing them and utilize the same identity across different
      # user-based products.
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Boolean, nil] :plaid_new_user_api_enabled
      #
      # @example
      #   client.user.create(client_user_id: "client_user_id")
      #
      # @return [Plaid::Types::UserCreateResponse]
      def create(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request_data = Plaid::User::Types::UserCreateRequest.new(params).to_h
        non_body_param_names = %w[Plaid-New-User-API-Enabled]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Plaid-New-User-API-Enabled"] = params[:plaid_new_user_api_enabled] unless params[:plaid_new_user_api_enabled].nil?

        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/create",
          headers: headers,
          body: body,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserCreateResponse.load(response.body))
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

      # Get user details using a `user_id`. This endpoint only supports users that were created on the new user API
      # flow, without a `user_token`. For more details, see [New User APIs](https://plaid.com/docs/api/users/user-apis).
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Boolean, nil] :plaid_new_user_api_enabled
      #
      # @example
      #   client.user.get(user_id: "user_id")
      #
      # @return [Plaid::Types::UserGetResponse]
      def get(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request_data = Plaid::User::Types::UserGetRequest.new(params).to_h
        non_body_param_names = %w[Plaid-New-User-API-Enabled]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Plaid-New-User-API-Enabled"] = params[:plaid_new_user_api_enabled] unless params[:plaid_new_user_api_enabled].nil?

        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/get",
          headers: headers,
          body: body,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserGetResponse.load(response.body))
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

      # This endpoint allows customers to explicitly purge identity/PII data provided to Plaid for a given user. This is
      # not exposed to customers by default, as it is meant for special scenarios or requests, but Plaid is obligated to
      # enable customers to delete PII provided to us.
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserIdentityRemoveRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Boolean, nil] :plaid_new_user_api_enabled
      #
      # @example
      #   client.user.remove_identity(user_id: "user_id")
      #
      # @return [Plaid::Types::UserIdentityRemoveResponse]
      def remove_identity(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request_data = Plaid::User::Types::UserIdentityRemoveRequest.new(params).to_h
        non_body_param_names = %w[Plaid-New-User-API-Enabled]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Plaid-New-User-API-Enabled"] = params[:plaid_new_user_api_enabled] unless params[:plaid_new_user_api_enabled].nil?

        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/identity/remove",
          headers: headers,
          body: body,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserIdentityRemoveResponse.load(response.body))
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

      # This endpoint updates user information for an existing `user_id` or `user_token`. If an existing `user_id` or
      # `user_token` is missing fields required for a given use case (e.g. creating a Consumer Report) use
      # `/user/update` to add values for those fields.
      #
      # Identity updates use merge semantics: provided fields overwrite existing ones; omitted fields remain unchanged.
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserUpdateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Boolean, nil] :plaid_new_user_api_enabled
      #
      # @example
      #   client.user.update
      #
      # @return [Plaid::Types::UserUpdateResponse]
      def update(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request_data = Plaid::User::Types::UserUpdateRequest.new(params).to_h
        non_body_param_names = %w[Plaid-New-User-API-Enabled]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Plaid-New-User-API-Enabled"] = params[:plaid_new_user_api_enabled] unless params[:plaid_new_user_api_enabled].nil?

        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/update",
          headers: headers,
          body: body,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserUpdateResponse.load(response.body))
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

      # `/user/remove` deletes a `user_id` or `user_token` and associated information, including any Items associated
      # with the user.
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserRemoveRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      # @option params [Boolean, nil] :plaid_new_user_api_enabled
      #
      # @example
      #   client.user.remove
      #
      # @return [Plaid::Types::UserRemoveResponse]
      def remove(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request_data = Plaid::User::Types::UserRemoveRequest.new(params).to_h
        non_body_param_names = %w[Plaid-New-User-API-Enabled]
        body = request_data.except(*non_body_param_names)

        headers = {}
        headers["Plaid-New-User-API-Enabled"] = params[:plaid_new_user_api_enabled] unless params[:plaid_new_user_api_enabled].nil?

        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/remove",
          headers: headers,
          body: body,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserRemoveResponse.load(response.body))
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

      # Terminates Financial Management, Plaid Protect, and Servicing products associated with a `user_id`. Use this
      # endpoint when offboarding a user or ending their subscriptions. Item access tokens are not required.
      #
      # For Financial Management products, including Transactions, Liabilities, and Investments, this endpoint removes
      # each associated Item that contains one of these products. Removal makes the Item inaccessible, initiates
      # deletion of its product data, and terminates its per-Item subscription billing. The entire Item is removed,
      # including access to any other products on that Item. To connect the accounts again, the user must complete Link
      # to create a new Item.
      #
      # If the user has at least one associated Item and every associated Item contains a Financial Management product,
      # this endpoint also removes the associated Plaid user. The removed `user_id` can no longer be used to access the
      # user.
      #
      # For Plaid Protect, this endpoint terminates Protect products. For Servicing, it cancels the subscription and
      # preserves CRA Items and historical data for future report requests.
      #
      # To learn how terminating products affects billing, see
      # [Billing](https://plaid.com/docs/account/billing/#subscription-fee).
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserProductsTerminateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.user.terminate_products(
      #     user_id: "usr_8c3ZbDBYjaqUXZ",
      #     reason_code: "CONSUMER_ACCOUNT_CLOSED",
      #     reason_note: "User closed account with client."
      #   )
      #
      # @return [Plaid::Types::UserProductsTerminateResponse]
      def terminate_products(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/products/terminate",
          body: Plaid::User::Types::UserProductsTerminateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserProductsTerminateResponse.load(response.body))
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

      # Retrieve the user's current Guaranteed ACH per-transaction limit and configured daily, weekly, and monthly
      # ceilings. Amounts are returned as decimal strings in dollars with two decimal places and an ISO currency code.
      # Access to this endpoint must be enabled for your client.
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserTransferLimitsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.user.get_transfer_limits(user_id: "user_id")
      #
      # @return [Plaid::Types::UserTransferLimitsGetResponse]
      def get_transfer_limits(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/transfer/limits/get",
          body: Plaid::User::Types::UserTransferLimitsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserTransferLimitsGetResponse.load(response.body))
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

      # Returns Items associated with a `user_id`, along with their corresponding statuses. Plaid associates an Item
      # with a User when it has been successfully connected within a Link session initialized with that `user_id`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserItemsGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.user.get_items
      #
      # @return [Plaid::Types::UserItemsGetResponse]
      def get_items(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/items/get",
          body: Plaid::User::Types::UserItemsGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserItemsGetResponse.load(response.body))
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

      # Associates Items with a `user_id`. If an Item is already associated with a different `user_id`, calling this
      # endpoint will disassociate it from that User and reassociate it with the target User instead. A single request
      # can associate up to 100 Items.
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserItemsAssociateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.user.associate_items(
      #     user_id: "user_id",
      #     item_ids: ["item_ids"]
      #   )
      #
      # @return [Plaid::Types::UserItemsAssociateResponse]
      def associate_items(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/items/associate",
          body: Plaid::User::Types::UserItemsAssociateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserItemsAssociateResponse.load(response.body))
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

      # Removes specific Items associated with a user. It is equivalent to calling `/item/remove` on each Item
      # individually, but supports use cases (such as Plaid Check) where access tokens are not available. All specified
      # Items must belong to the user or the entire operation fails. Similar to `/item/remove`, this deletes Item
      # product data and terminates billing on the Item's products. Once removed, Items cannot be reconnected without
      # going through Link again.
      # This endpoint is not intended to remove all data for a user, as it will only remove Items and no other data for
      # the user. If the user has any user-based recurring subscription products (Financial Management, Plaid Protect,
      # or CRA Servicing) and is deleting their account with your product, also call `/user/products/terminate` to end
      # those subscriptions; per-Item billing is already terminated by this endpoint. For a user initiated data deletion
      # request, see the [Consumer Service Center](https://plaid.com/check/consumer-service-center/) to revoke access to
      # data.
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserItemsRemoveRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.user.remove_items(item_ids: ["item_ids"])
      #
      # @return [Plaid::Types::UserItemsRemoveResponse]
      def remove_items(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/items/remove",
          body: Plaid::User::Types::UserItemsRemoveRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserItemsRemoveResponse.load(response.body))
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

      # This endpoint is used to create a third-party user token. This token can be shared with and used by a specified
      # third-party client to access data associated with the user through supported endpoints.
      #
      # Ensure you store the `third_party_user_token` along with the `user_token` and `third_party_client_id`, as it is
      # not possible to retrieve a previously created `third_party_user_token`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserThirdPartyTokenCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.user.create_third_party_token(third_party_client_id: "third_party_client_id")
      #
      # @return [Plaid::Types::UserThirdPartyTokenCreateResponse]
      def create_third_party_token(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/third_party_token/create",
          body: Plaid::User::Types::UserThirdPartyTokenCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserThirdPartyTokenCreateResponse.load(response.body))
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

      # This endpoint is used to delete a third-party user token. Once removed, the token can no longer be used to
      # access data associated with the user.
      #
      # Any subsequent calls to retrieve information using the same third-party user token will result in an error
      # stating the third-party user token does not exist.
      #
      # @param request_options [Hash]
      # @param params [Plaid::User::Types::UserThirdPartyTokenRemoveRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.user.remove_third_party_token(third_party_user_token: "third_party_user_token")
      #
      # @return [Plaid::Types::UserThirdPartyTokenRemoveResponse]
      def remove_third_party_token(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "user/third_party_token/remove",
          body: Plaid::User::Types::UserThirdPartyTokenRemoveRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::UserThirdPartyTokenRemoveResponse.load(response.body))
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

      # @return [Plaid::Account::Client]
      def account
        @account ||= Plaid::User::Account::Client.new(client: @client)
      end
    end
  end
end
