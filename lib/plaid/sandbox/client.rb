# frozen_string_literal: true

module Plaid
  module Sandbox
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # Use the `/sandbox/transactions/create` endpoint to create new transactions for an existing Item. This endpoint
      # can be used to add up to 10 transactions to any Item at a time.
      #
      # This endpoint can be used with any Item created in the Sandbox environment. Added transactions persist across
      # subsequent calls to `/transactions/get` and `/transactions/sync`.
      #
      # Each transaction is added to the account named by its `account_id`. When `account_id` is omitted, the
      # transaction is added to the Item's checking account, or, for a custom Sandbox user, to the first depository
      # account listed in its `override_accounts`, or its first account if it has no depository account.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxTransactionsCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.create_transactions(
      #     access_token: "access_token",
      #     transactions: [{
      #       date_transacted: "2023-01-15",
      #       date_posted: "2023-01-15",
      #       amount: 1.1,
      #       description: "description"
      #     }]
      #   )
      #
      # @return [Plaid::Types::SandboxTransactionsCreateResponse]
      def create_transactions(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/transactions/create",
          body: Plaid::Sandbox::Types::SandboxTransactionsCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxTransactionsCreateResponse.load(response.body))
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

      # Use the `/sandbox/processor_token/create` endpoint to create a valid `processor_token` for an arbitrary
      # institution ID and test credentials. The created `processor_token` corresponds to a new Sandbox Item. You can
      # then use this `processor_token` with the `/processor/` API endpoints in Sandbox. You can also use
      # `/sandbox/processor_token/create` with the [`user_custom` test
      # username](https://plaid.com/docs/sandbox/user-custom) to generate a test account with custom data.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxProcessorTokenCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.create_processor_token(institution_id: "institution_id")
      #
      # @return [Plaid::Types::SandboxProcessorTokenCreateResponse]
      def create_processor_token(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/processor_token/create",
          body: Plaid::Sandbox::Types::SandboxProcessorTokenCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxProcessorTokenCreateResponse.load(response.body))
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

      # Use the `/sandbox/public_token/create` endpoint to create a valid `public_token`  for an arbitrary institution
      # ID, initial products, and test credentials. The created `public_token` maps to a new Sandbox Item. You can then
      # call `/item/public_token/exchange` to exchange the `public_token` for an `access_token` and perform all API
      # actions. `/sandbox/public_token/create` can also be used with the [`user_custom` test
      # username](https://plaid.com/docs/sandbox/user-custom) to generate a test account with custom data, or with
      # Plaid's [pre-populated Sandbox test accounts](https://plaid.com/docs/sandbox/test-credentials/).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxPublicTokenCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.create_public_token(
      #     institution_id: "institution_id",
      #     initial_products: ["assets"]
      #   )
      #
      # @return [Plaid::Types::SandboxPublicTokenCreateResponse]
      def create_public_token(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/public_token/create",
          body: Plaid::Sandbox::Types::SandboxPublicTokenCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxPublicTokenCreateResponse.load(response.body))
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

      # The `/sandbox/item/fire_webhook` endpoint is used to test that code correctly handles webhooks. This endpoint
      # can trigger the following webhooks:
      #
      # `DEFAULT_UPDATE`: Webhook to be fired for a given Sandbox Item simulating a default update event for the
      # respective product as specified with the `webhook_type` in the request body. Valid Sandbox `DEFAULT_UPDATE`
      # webhook types include: `AUTH`, `IDENTITY`, `TRANSACTIONS`, `INVESTMENTS_TRANSACTIONS`, `LIABILITIES`,
      # `HOLDINGS`. If the Item does not support the product, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.
      #
      # `NEW_ACCOUNTS_AVAILABLE`: Fired to indicate that a new account is available on the Item and you can launch
      # update mode to request access to it.
      #
      # `SMS_MICRODEPOSITS_VERIFICATION`: Fired when a given Same-Day Micro-deposit Item is verified via SMS
      # verification.
      #
      # `LOGIN_REPAIRED`: Fired when an Item recovers from the `ITEM_LOGIN_REQUIRED` without the user going through
      # update mode in your app.
      #
      # `PENDING_DISCONNECT`: Fired when an Item will stop working in the near future (e.g. due to a planned bank
      # migration) and must be sent through update mode to continue working.
      #
      # `CONSENT_UPDATED`: Fired when the user changes the consent duration at their institution and the Item's
      # `consent_expiration_time` changes. Sandbox Items have no stored consent expiration, so the payload's
      # `consent_expiration_time` is one year from the time the webhook is fired.
      #
      # `RECURRING_TRANSACTIONS_UPDATE`: Recurring Transactions webhook to be fired for a given Sandbox Item. If your
      # client is not enabled for Recurring Transactions, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.
      #
      # `SYNC_UPDATES_AVAILABLE`: Transactions webhook to be fired for a given Sandbox Item.  If your client is not
      # enabled for Transactions, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.
      #
      # `PRODUCT_READY`: Assets webhook to be fired when a given asset report has been successfully generated. If the
      # Item does not support Assets, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.
      #
      # `ERROR`: Assets webhook to be fired when asset report generation has failed. If the Item does not support
      # Assets, a `SANDBOX_PRODUCT_NOT_ENABLED` error will result.
      #
      # `USER_PERMISSION_REVOKED`: Indicates an end user has revoked the permission that they previously granted to
      # access an Item. May not always fire upon revocation, as some institutions' consent portals do not trigger this
      # webhook. Upon receiving this webhook, it is recommended to delete any stored data from Plaid associated with the
      # account or Item.
      #
      # `USER_ACCOUNT_REVOKED`: Fired when an end user has revoked access to their account on the Data Provider's
      # portal. This webhook is currently sent only for Chase, PNC, and Truist Items, but may be sent in the future for
      # other financial institutions. Upon receiving this webhook, it is recommended to delete any stored data from
      # Plaid associated with the account or Item.
      #
      # Note that this endpoint is provided for developer ease-of-use and is not required for testing webhooks; webhooks
      # will also fire in Sandbox under the same conditions that they would in Production (except for webhooks of type
      # `TRANSFER`).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxItemFireWebhookRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.fire_item_webhook(
      #     access_token: "access_token",
      #     webhook_code: "DEFAULT_UPDATE"
      #   )
      #
      # @return [Plaid::Types::SandboxItemFireWebhookResponse]
      def fire_item_webhook(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/item/fire_webhook",
          body: Plaid::Sandbox::Types::SandboxItemFireWebhookRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxItemFireWebhookResponse.load(response.body))
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

      # `/sandbox/user/fire_webhook` functions the same as `/sandbox/item/fire_webhook`, but fires webhooks associated
      # with a user rather than an Item. This endpoint can trigger the following webhooks:
      #
      # `USER_CHECK_REPORT_READY`: Fired when a Check Report is ready to be retrieved.
      #
      # `USER_CHECK_REPORT_FAILED`: Fired when a Check Report has failed to generate.
      #
      # `CHECK_REPORT_READY` / `CHECK_REPORT_FAILED`: The equivalents of the above for integrations that predate the
      # [New User APIs](https://plaid.com/docs/api/users/user-apis).
      #
      # Note that this endpoint is provided for developer ease-of-use and is not required for testing webhooks; webhooks
      # will also fire in Sandbox under the same conditions that they would in Production.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxUserFireWebhookRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.fire_user_webhook(
      #     webhook_type: "CHECK_REPORT",
      #     webhook_code: "USER_CHECK_REPORT_READY",
      #     webhook: "webhook"
      #   )
      #
      # @return [Plaid::Types::SandboxUserFireWebhookResponse]
      def fire_user_webhook(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/user/fire_webhook",
          body: Plaid::Sandbox::Types::SandboxUserFireWebhookRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxUserFireWebhookResponse.load(response.body))
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

      # `/sandbox/item/reset_login` forces an Item into an `ITEM_LOGIN_REQUIRED` state in order to simulate an Item
      # whose login is no longer valid. This makes it easy to test Link's [update
      # mode](https://plaid.com/docs/link/update-mode) flow in the Sandbox environment.  After calling
      # `/sandbox/item/reset_login`, you can then use Plaid Link update mode to restore the Item to a good state. An
      # `ITEM_LOGIN_REQUIRED` webhook will also be fired after a call to this endpoint, if one is associated with the
      # Item.
      # In the Sandbox, Items will transition to an `ITEM_LOGIN_REQUIRED` error state automatically after 30 days, even
      # if this endpoint is not called.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxItemResetLoginRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.reset_item_login(access_token: "access_token")
      #
      # @return [Plaid::Types::SandboxItemResetLoginResponse]
      def reset_item_login(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/item/reset_login",
          body: Plaid::Sandbox::Types::SandboxItemResetLoginRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxItemResetLoginResponse.load(response.body))
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

      # `/sandbox/item/application/seed` creates a test connected application on an existing Permissions Manager Item's
      # login. The seeded application will appear in subsequent calls to `/item/application/list`.
      #
      # The `access_token` must belong to a Permissions Manager Item created via `/item/import` in Sandbox. The
      # `application_id` identifies the application to seed as a connected app. To disconnect a seeded application, use
      # `/item/application/unlink`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxItemApplicationSeedRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.seed_item_application(
      #     access_token: "access_token",
      #     application_id: "application_id"
      #   )
      #
      # @return [Plaid::Types::SandboxItemApplicationSeedResponse]
      def seed_item_application(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/item/application/seed",
          body: Plaid::Sandbox::Types::SandboxItemApplicationSeedRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxItemApplicationSeedResponse.load(response.body))
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

      # `/sandbox/fdx/consent/seed` creates a test FDX consent grant (and a backing Item) for a data provider's customer
      # in Sandbox, so the FDX Consent API endpoints can be exercised end-to-end without a live data provider
      # connection.
      #
      # `customer_id` is the data provider's identifier for the end user and `application_id` identifies the data
      # recipient application the consent is granted to; both are required. Optionally provide `consent_id` (a UUIDv4)
      # to control the seeded grant's identifier; one is generated when omitted. The seeded grant is returned by
      # `/fdx/consents` and `/fdx/consents/{consentId}`, and can be revoked via `/fdx/consents/{consentId}/revocation`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxFdxConsentSeedRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.seed_fdx_consent(
      #     customer_id: "customer_id",
      #     application_id: "application_id"
      #   )
      #
      # @return [Plaid::Types::SandboxFdxConsentSeedResponse]
      def seed_fdx_consent(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/fdx/consent/seed",
          body: Plaid::Sandbox::Types::SandboxFdxConsentSeedRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxFdxConsentSeedResponse.load(response.body))
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

      # The `/sandbox/item/set_verification_status` endpoint can be used to change the verification status of an Item in
      # the Sandbox in order to simulate the Automated Micro-deposit flow.
      #
      # For more information on testing Automated Micro-deposits in Sandbox, see [Auth full coverage
      # testing](https://plaid.com/docs/auth/coverage/testing#).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxItemSetVerificationStatusRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.set_item_verification_status(
      #     access_token: "access_token",
      #     account_id: "account_id",
      #     verification_status: "automatically_verified"
      #   )
      #
      # @return [Plaid::Types::SandboxItemSetVerificationStatusResponse]
      def set_item_verification_status(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/item/set_verification_status",
          body: Plaid::Sandbox::Types::SandboxItemSetVerificationStatusRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxItemSetVerificationStatusResponse.load(response.body))
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

      # `/sandbox/user/reset_login` functions the same as `/sandbox/item/reset_login`, but will modify Items related to
      # a User. This endpoint forces each Item into an `ITEM_LOGIN_REQUIRED` state in order to simulate an Item whose
      # login is no longer valid. This makes it easy to test Link's [update
      # mode](https://plaid.com/docs/link/update-mode) flow in the Sandbox environment.  After calling
      # `/sandbox/user/reset_login`, you can then use Plaid Link update mode to restore Items associated with the User
      # to a good state. An `ITEM_LOGIN_REQUIRED` webhook will also be fired after a call to this endpoint, if one is
      # associated with the Item.
      # In the Sandbox, Items will transition to an `ITEM_LOGIN_REQUIRED` error state automatically after 30 days, even
      # if this endpoint is not called.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxUserResetLoginRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.reset_user_login
      #
      # @return [Plaid::Types::SandboxUserResetLoginResponse]
      def reset_user_login(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/user/reset_login",
          body: Plaid::Sandbox::Types::SandboxUserResetLoginRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxUserResetLoginResponse.load(response.body))
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

      # Use the `/sandbox/bank_transfer/simulate` endpoint to simulate a bank transfer event in the Sandbox environment.
      # Note that while an event will be simulated and will appear when using endpoints such as
      # `/bank_transfer/event/sync` or `/bank_transfer/event/list`, no transactions will actually take place and funds
      # will not move between accounts, even within the Sandbox.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxBankTransferSimulateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.simulate_bank_transfer(
      #     bank_transfer_id: "bank_transfer_id",
      #     event_type: "event_type"
      #   )
      #
      # @return [Plaid::Types::SandboxBankTransferSimulateResponse]
      def simulate_bank_transfer(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/bank_transfer/simulate",
          body: Plaid::Sandbox::Types::SandboxBankTransferSimulateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxBankTransferSimulateResponse.load(response.body))
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

      # Use the `/sandbox/transfer/sweep/simulate` endpoint to create a sweep and associated events in the Sandbox
      # environment. Upon calling this endpoint, all transfers with a sweep status of `swept` will become
      # `swept_settled`, all `posted` or `pending` transfers with a sweep status of `unswept` will become `swept`, and
      # all `returned` transfers with a sweep status of `swept` will become `return_swept`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxTransferSweepSimulateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.simulate_transfer_sweep
      #
      # @return [Plaid::Types::SandboxTransferSweepSimulateResponse]
      def simulate_transfer_sweep(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/transfer/sweep/simulate",
          body: Plaid::Sandbox::Types::SandboxTransferSweepSimulateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxTransferSweepSimulateResponse.load(response.body))
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

      # Use the `/sandbox/transfer/simulate` endpoint to simulate a transfer event in the Sandbox environment.  Note
      # that while an event will be simulated and will appear when using endpoints such as `/transfer/event/sync` or
      # `/transfer/event/list`, no transactions will actually take place and funds will not move between accounts, even
      # within the Sandbox.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxTransferSimulateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.simulate_transfer(
      #     transfer_id: "transfer_id",
      #     event_type: "event_type"
      #   )
      #
      # @return [Plaid::Types::SandboxTransferSimulateResponse]
      def simulate_transfer(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/transfer/simulate",
          body: Plaid::Sandbox::Types::SandboxTransferSimulateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxTransferSimulateResponse.load(response.body))
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

      # Use the `/sandbox/transfer/refund/simulate` endpoint to simulate a refund event in the Sandbox environment.
      # Note that while an event will be simulated and will appear when using endpoints such as `/transfer/event/sync`
      # or `/transfer/event/list`, no transactions will actually take place and funds will not move between accounts,
      # even within the Sandbox.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxTransferRefundSimulateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.simulate_transfer_refund(
      #     refund_id: "refund_id",
      #     event_type: "event_type"
      #   )
      #
      # @return [Plaid::Types::SandboxTransferRefundSimulateResponse]
      def simulate_transfer_refund(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/transfer/refund/simulate",
          body: Plaid::Sandbox::Types::SandboxTransferRefundSimulateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxTransferRefundSimulateResponse.load(response.body))
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

      # Use the `/sandbox/transfer/ledger/simulate_available` endpoint to simulate converting pending balance to
      # available balance for all originators in the Sandbox environment.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxTransferLedgerSimulateAvailableRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.simulate_transfer_ledger_available
      #
      # @return [Plaid::Types::SandboxTransferLedgerSimulateAvailableResponse]
      def simulate_transfer_ledger_available(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/transfer/ledger/simulate_available",
          body: Plaid::Sandbox::Types::SandboxTransferLedgerSimulateAvailableRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxTransferLedgerSimulateAvailableResponse.load(response.body))
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

      # Use the `/sandbox/transfer/ledger/deposit/simulate` endpoint to simulate a ledger deposit event in the Sandbox
      # environment.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxTransferLedgerDepositSimulateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.simulate_transfer_ledger_deposit(
      #     sweep_id: "sweep_id",
      #     event_type: "sweep.posted"
      #   )
      #
      # @return [Plaid::Types::SandboxTransferLedgerDepositSimulateResponse]
      def simulate_transfer_ledger_deposit(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/transfer/ledger/deposit/simulate",
          body: Plaid::Sandbox::Types::SandboxTransferLedgerDepositSimulateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxTransferLedgerDepositSimulateResponse.load(response.body))
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

      # Use the `/sandbox/transfer/ledger/withdraw/simulate` endpoint to simulate a ledger withdraw event in the Sandbox
      # environment.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxTransferLedgerWithdrawSimulateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.simulate_transfer_ledger_withdraw(
      #     sweep_id: "sweep_id",
      #     event_type: "sweep.posted"
      #   )
      #
      # @return [Plaid::Types::SandboxTransferLedgerWithdrawSimulateResponse]
      def simulate_transfer_ledger_withdraw(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/transfer/ledger/withdraw/simulate",
          body: Plaid::Sandbox::Types::SandboxTransferLedgerWithdrawSimulateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxTransferLedgerWithdrawSimulateResponse.load(response.body))
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

      # Use the `/sandbox/transfer/fire_webhook` endpoint to manually trigger a `TRANSFER_EVENTS_UPDATE` webhook in the
      # Sandbox environment.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxTransferFireWebhookRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.fire_transfer_webhook(webhook: "webhook")
      #
      # @return [Plaid::Types::SandboxTransferFireWebhookResponse]
      def fire_transfer_webhook(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/transfer/fire_webhook",
          body: Plaid::Sandbox::Types::SandboxTransferFireWebhookRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxTransferFireWebhookResponse.load(response.body))
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

      # Use the `/sandbox/transfer/test_clock/create` endpoint to create a `test_clock` in the Sandbox environment.
      #
      # A test clock object represents an independent timeline and has a `virtual_time` field indicating the current
      # timestamp of the timeline. Test clocks are used for testing recurring transfers in Sandbox.
      #
      # A test clock can be associated with up to 5 recurring transfers.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxTransferTestClockCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.create_transfer_test_clock
      #
      # @return [Plaid::Types::SandboxTransferTestClockCreateResponse]
      def create_transfer_test_clock(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/transfer/test_clock/create",
          body: Plaid::Sandbox::Types::SandboxTransferTestClockCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxTransferTestClockCreateResponse.load(response.body))
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

      # Use the `/sandbox/transfer/test_clock/advance` endpoint to advance a `test_clock` in the Sandbox environment.
      #
      # A test clock object represents an independent timeline and has a `virtual_time` field indicating the current
      # timestamp of the timeline. A test clock can be advanced by incrementing `virtual_time`, but may never go back to
      # a lower `virtual_time`.
      #
      # If a test clock is advanced, we will simulate the changes that ought to occur during the time that elapsed.
      #
      # For example, a client creates a weekly recurring transfer with a test clock set at t. When the client advances
      # the test clock by setting `virtual_time` = t + 15 days, 2 new originations should be created, along with the
      # webhook events.
      #
      # The advancement of the test clock from its current `virtual_time` should be limited such that there are no more
      # than 20 originations resulting from the advance operation on each `recurring_transfer` associated with the
      # `test_clock`.
      #
      # For example, if the recurring transfer associated with this test clock originates once every 4 weeks, you can
      # advance the `virtual_time` up to 80 weeks on each API call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxTransferTestClockAdvanceRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.advance_transfer_test_clock(
      #     test_clock_id: "test_clock_id",
      #     new_virtual_time: "2024-01-15T09:30:00Z"
      #   )
      #
      # @return [Plaid::Types::SandboxTransferTestClockAdvanceResponse]
      def advance_transfer_test_clock(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/transfer/test_clock/advance",
          body: Plaid::Sandbox::Types::SandboxTransferTestClockAdvanceRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxTransferTestClockAdvanceResponse.load(response.body))
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

      # Use the `/sandbox/transfer/test_clock/get` endpoint to get a `test_clock` in the Sandbox environment.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxTransferTestClockGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.get_transfer_test_clock(test_clock_id: "test_clock_id")
      #
      # @return [Plaid::Types::SandboxTransferTestClockGetResponse]
      def get_transfer_test_clock(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/transfer/test_clock/get",
          body: Plaid::Sandbox::Types::SandboxTransferTestClockGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxTransferTestClockGetResponse.load(response.body))
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

      # Use the `/sandbox/transfer/test_clock/list` endpoint to see a list of all your test clocks in the Sandbox
      # environment, by descending `virtual_time`. Results are paginated; use the `count` and `offset` query parameters
      # to retrieve the desired test clocks.
      #
      # Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::TransferTestClock` in the
      # `test_clocks` field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Plaid::Types::SandboxTransferTestClockListResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxTransferTestClockListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.list_transfer_test_clocks
      #
      # @return [Plaid::Internal::OffsetItemIterator]
      def list_transfer_test_clocks(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::OffsetItemIterator.new(
          initial_page: params[:offset],
          item_field: :test_clocks,
          has_next_field: nil,
          step: true
        ) do |next_page|
          params[:offset] = next_page
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "sandbox/transfer/test_clock/list",
            body: Plaid::Sandbox::Types::SandboxTransferTestClockListRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::SandboxTransferTestClockListResponse.load(response.body))
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

      # `/sandbox/payment_profile/reset_login` forces a Payment Profile into a state where the login is no longer valid.
      # This makes it easy to test update mode for Payment Profile in the Sandbox environment.
      #
      # After calling `/sandbox/payment_profile/reset_login`, calls to the `/transfer/authorization/create` with the
      # Payment Profile will result in a `decision_rationale` `PAYMENT_PROFILE_LOGIN_REQUIRED`. You can then use update
      # mode for Payment Profile to restore it into a good state.
      #
      # In order to invoke this endpoint, you must first [create a Payment
      # Profile](https://plaid.com/docs/transfer/add-to-app/#create-a-payment-profile-optional) and [go through the Link
      # flow](https://plaid.com/docs/transfer/add-to-app/#create-a-link-token).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxPaymentProfileResetLoginRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.reset_payment_profile_login(payment_profile_token: "payment_profile_token")
      #
      # @return [Plaid::Types::SandboxPaymentProfileResetLoginResponse]
      def reset_payment_profile_login(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/payment_profile/reset_login",
          body: Plaid::Sandbox::Types::SandboxPaymentProfileResetLoginRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxPaymentProfileResetLoginResponse.load(response.body))
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

      # Use the `/sandbox/payment/simulate` endpoint to simulate various payment events in the Sandbox environment. This
      # endpoint will trigger the corresponding payment status webhook.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxPaymentSimulateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.simulate_payment(
      #     payment_id: "payment_id",
      #     webhook: "webhook",
      #     status: "status"
      #   )
      #
      # @return [Plaid::Types::SandboxPaymentSimulateResponse]
      def simulate_payment(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/payment/simulate",
          body: Plaid::Sandbox::Types::SandboxPaymentSimulateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxPaymentSimulateResponse.load(response.body))
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

      # Use the `/sandbox/bank_transfer/fire_webhook` endpoint to manually trigger a Bank Transfers webhook in the
      # Sandbox environment.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxBankTransferFireWebhookRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.fire_bank_transfer_webhook(webhook: "webhook")
      #
      # @return [Plaid::Types::SandboxBankTransferFireWebhookResponse]
      def fire_bank_transfer_webhook(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/bank_transfer/fire_webhook",
          body: Plaid::Sandbox::Types::SandboxBankTransferFireWebhookRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxBankTransferFireWebhookResponse.load(response.body))
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

      # Use the `/sandbox/income/fire_webhook` endpoint to manually trigger a Payroll or Document Income webhook in the
      # Sandbox environment.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxIncomeFireWebhookRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.fire_income_webhook(
      #     item_id: "item_id",
      #     webhook: "webhook",
      #     webhook_code: "INCOME_VERIFICATION"
      #   )
      #
      # @return [Plaid::Types::SandboxIncomeFireWebhookResponse]
      def fire_income_webhook(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/income/fire_webhook",
          body: Plaid::Sandbox::Types::SandboxIncomeFireWebhookRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxIncomeFireWebhookResponse.load(response.body))
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

      # Use the `/sandbox/bank_income/fire_webhook` endpoint to manually trigger a Bank Income webhook in the Sandbox
      # environment.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxBankIncomeFireWebhookRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.fire_bank_income_webhook(
      #     webhook_code: "BANK_INCOME_REFRESH_UPDATE",
      #     webhook_fields: {
      #       user_id: "user_id"
      #     }
      #   )
      #
      # @return [Plaid::Types::SandboxBankIncomeFireWebhookResponse]
      def fire_bank_income_webhook(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/bank_income/fire_webhook",
          body: Plaid::Sandbox::Types::SandboxBankIncomeFireWebhookRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxBankIncomeFireWebhookResponse.load(response.body))
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

      # Use the `/sandbox/cra/cashflow_updates/update` endpoint to manually trigger an update for the legacy Cash Flow
      # Updates product in the Sandbox environment. To simulate a report generation for a CRA Servicing subscription,
      # use `/sandbox/cra/servicing/simulate`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxCraCashflowUpdatesUpdateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.update_cra_cashflow_updates
      #
      # @return [Plaid::Types::SandboxCraCashflowUpdatesUpdateResponse]
      def update_cra_cashflow_updates(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/cra/cashflow_updates/update",
          body: Plaid::Sandbox::Types::SandboxCraCashflowUpdatesUpdateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxCraCashflowUpdatesUpdateResponse.load(response.body))
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

      # Use the `/sandbox/cra/servicing/simulate` endpoint to synchronously seed a CRA Servicing report in the Sandbox
      # environment and return a `report_id` that can be fetched via `/cra/check_report/base_report/get` or
      # `/cra/check_report/income_insights/get`. This endpoint also fires a `CRA_REPORT_UPDATED` webhook, mirroring the
      # notification a live subscription would emit.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxCraServicingSimulateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.simulate_cra_servicing(subscription_id: "subscription_id")
      #
      # @return [Plaid::Types::SandboxCraServicingSimulateResponse]
      def simulate_cra_servicing(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/cra/servicing/simulate",
          body: Plaid::Sandbox::Types::SandboxCraServicingSimulateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxCraServicingSimulateResponse.load(response.body))
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

      # Save the selected accounts when connecting to the Platypus OAuth institution
      #
      # @param request_options [Hash]
      # @param params [Plaid::Sandbox::Types::SandboxOauthSelectAccountsRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.sandbox.select_oauth_accounts(
      #     oauth_state_id: "oauth_state_id",
      #     accounts: ["accounts"]
      #   )
      #
      # @return [Hash[String, Object]]
      def select_oauth_accounts(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "sandbox/oauth/select_accounts",
          body: Plaid::Sandbox::Types::SandboxOauthSelectAccountsRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::SandboxOauthSelectAccountsResponse.load(response.body))
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
