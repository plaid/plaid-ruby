# frozen_string_literal: true

module Plaid
  module Transfer
    class Client
      # @param client [Plaid::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # The `/transfer/get` endpoint fetches information about the transfer corresponding to the given `transfer_id` or
      # `authorization_id`. One of `transfer_id` or `authorization_id` must be populated but not both.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transfer::Types::TransferGetRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transfer.get
      #
      # @return [Plaid::Types::TransferGetResponse]
      def get(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "transfer/get",
          body: Plaid::Transfer::Types::TransferGetRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransferGetResponse.load(response.body))
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

      # Use the `/transfer/create` endpoint to initiate a new transfer. This endpoint is retryable and idempotent; if a
      # transfer with the provided `authorization_id` has already been created, it will return the transfer details
      # without creating a new transfer. A transfer may still be created if a 500 error is returned; to detect this
      # scenario, use [Transfer events](https://plaid.com/docs/transfer/reconciling-transfers/).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transfer::Types::TransferCreateRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transfer.create(
      #     access_token: "access_token",
      #     account_id: "account_id",
      #     authorization_id: "authorization_id",
      #     description: "description"
      #   )
      #
      # @return [Plaid::Types::TransferCreateResponse]
      def create(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "transfer/create",
          body: Plaid::Transfer::Types::TransferCreateRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransferCreateResponse.load(response.body))
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

      # Use the `/transfer/list` endpoint to see a list of all your transfers and their statuses. Results are paginated;
      # use the `count` and `offset` query parameters to retrieve the desired transfers.
      #
      # Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::Transfer` in the `transfers`
      # field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
      # `Plaid::Types::TransferListResponse`, including its other fields.
      #
      # No request is sent by this call. The first page is requested when you start iterating (or call
      # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transfer::Types::TransferListRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transfer.list
      #
      # @return [Plaid::Internal::OffsetItemIterator]
      def list(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        Plaid::Internal::OffsetItemIterator.new(
          initial_page: params[:offset],
          item_field: :transfers,
          has_next_field: nil,
          step: true
        ) do |next_page|
          params[:offset] = next_page
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/list",
            body: Plaid::Transfer::Types::TransferListRequest.new(params).to_h,
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
              parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::TransferListResponse.load(response.body))
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

      # Use the `/transfer/cancel` endpoint to cancel a transfer.  A transfer is eligible for cancellation if the
      # `cancellable` property returned by `/transfer/get` is `true`.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transfer::Types::TransferCancelRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transfer.cancel(transfer_id: "transfer_id")
      #
      # @return [Plaid::Types::TransferCancelResponse]
      def cancel(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "transfer/cancel",
          body: Plaid::Transfer::Types::TransferCancelRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransferCancelResponse.load(response.body))
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

      # As an alternative to adding Items via Link, you can also use the `/transfer/migrate_account` endpoint to migrate
      # previously-verified account and routing numbers to Plaid Items. This endpoint is also required when adding an
      # Item for use with wire transfers; if you intend to create wire transfers on this account, you must provide
      # `wire_routing_number`. Note that Items created in this way are not compatible with endpoints for other products,
      # such as `/accounts/balance/get`, and can only be used with Transfer endpoints.  If you require access to other
      # endpoints, create the Item through Link instead.  Access to `/transfer/migrate_account` is not enabled by
      # default; to obtain access, contact your Plaid account manager or [support](https://dashboard.plaid.com/support).
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transfer::Types::TransferMigrateAccountRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transfer.migrate_account(
      #     account_number: "account_number",
      #     routing_number: "routing_number",
      #     account_type: "account_type"
      #   )
      #
      # @return [Plaid::Types::TransferMigrateAccountResponse]
      def migrate_account(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "transfer/migrate_account",
          body: Plaid::Transfer::Types::TransferMigrateAccountRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransferMigrateAccountResponse.load(response.body))
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

      # Use the `/transfer/return/recover` endpoint to notify Plaid that you have recovered some or all of the loss on a
      # returned guaranteed transfer.
      #
      # Recovery can be reported in full or in parts; the sum of recovered amounts across calls cannot exceed the
      # guaranteed amount of the original transfer.
      #
      # @param request_options [Hash]
      # @param params [Plaid::Transfer::Types::TransferReturnRecoverRequest]
      # @option request_options [String] :base_url
      # @option request_options [Hash{String => Object}] :additional_headers
      # @option request_options [Hash{String => Object}] :additional_query_parameters
      # @option request_options [Hash{String => Object}] :additional_body_parameters
      # @option request_options [Integer] :timeout_in_seconds
      #
      # @example
      #   client.transfer.recover_return(
      #     transfer_id: "transfer_id",
      #     amount: "amount",
      #     idempotency_key: "idempotency_key"
      #   )
      #
      # @return [Plaid::Types::TransferReturnRecoverResponse]
      def recover_return(request_options: {}, **params)
        params = Plaid::Internal::Types::Utils.normalize_keys(params)
        request = Plaid::Internal::JSON::Request.new(
          base_url: request_options[:base_url],
          method: "POST",
          path: "transfer/return/recover",
          body: Plaid::Transfer::Types::TransferReturnRecoverRequest.new(params).to_h,
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
            (response.body.to_s.empty? ? nil : Plaid::Types::TransferReturnRecoverResponse.load(response.body))
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

      # @return [Plaid::Recurring::Client]
      def recurring
        @recurring ||= Plaid::Transfer::Recurring::Client.new(client: @client)
      end

      # @return [Plaid::Authorization::Client]
      def authorization
        @authorization ||= Plaid::Transfer::Authorization::Client.new(client: @client)
      end

      # @return [Plaid::Balance::Client]
      def balance
        @balance ||= Plaid::Transfer::Balance::Client.new(client: @client)
      end

      # @return [Plaid::Capabilities::Client]
      def capabilities
        @capabilities ||= Plaid::Transfer::Capabilities::Client.new(client: @client)
      end

      # @return [Plaid::Configuration::Client]
      def configuration
        @configuration ||= Plaid::Transfer::Configuration::Client.new(client: @client)
      end

      # @return [Plaid::Ledger::Client]
      def ledger
        @ledger ||= Plaid::Transfer::Ledger::Client.new(client: @client)
      end

      # @return [Plaid::Originator::Client]
      def originator
        @originator ||= Plaid::Transfer::Originator::Client.new(client: @client)
      end

      # @return [Plaid::Metrics::Client]
      def metrics
        @metrics ||= Plaid::Transfer::Metrics::Client.new(client: @client)
      end

      # @return [Plaid::Event::Client]
      def event
        @event ||= Plaid::Transfer::Event::Client.new(client: @client)
      end

      # @return [Plaid::Sweep::Client]
      def sweep
        @sweep ||= Plaid::Transfer::Sweep::Client.new(client: @client)
      end

      # @return [Plaid::Intent::Client]
      def intent
        @intent ||= Plaid::Transfer::Intent::Client.new(client: @client)
      end

      # @return [Plaid::Repayment::Client]
      def repayment
        @repayment ||= Plaid::Transfer::Repayment::Client.new(client: @client)
      end

      # @return [Plaid::Platform::Client]
      def platform
        @platform ||= Plaid::Transfer::Platform::Client.new(client: @client)
      end

      # @return [Plaid::Questionnaire::Client]
      def questionnaire
        @questionnaire ||= Plaid::Transfer::Questionnaire::Client.new(client: @client)
      end

      # @return [Plaid::Diligence::Client]
      def diligence
        @diligence ||= Plaid::Transfer::Diligence::Client.new(client: @client)
      end

      # @return [Plaid::Refund::Client]
      def refund
        @refund ||= Plaid::Transfer::Refund::Client.new(client: @client)
      end
    end
  end
end
