# frozen_string_literal: true

module Plaid
  module Transfer
    module Ledger
      class Client
        # @param client [Plaid::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use the `/transfer/ledger/get` endpoint to view a balance on the ledger held with Plaid.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Ledger::Types::TransferLedgerGetRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.ledger.get
        #
        # @return [Plaid::Types::TransferLedgerGetResponse]
        def get(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/ledger/get",
            body: Plaid::Transfer::Ledger::Types::TransferLedgerGetRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferLedgerGetResponse.load(response.body))
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

        # Use the `/transfer/ledger/distribute` endpoint to move available balance between ledgers, if you have
        # multiple. If you're a platform, you can move funds between one of your ledgers and one of your customer's
        # ledgers.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Ledger::Types::TransferLedgerDistributeRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.ledger.distribute(
        #     from_ledger_id: "from_ledger_id",
        #     to_ledger_id: "to_ledger_id",
        #     amount: "amount",
        #     idempotency_key: "idempotency_key"
        #   )
        #
        # @return [Plaid::Types::TransferLedgerDistributeResponse]
        def distribute(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/ledger/distribute",
            body: Plaid::Transfer::Ledger::Types::TransferLedgerDistributeRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferLedgerDistributeResponse.load(response.body))
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

        # Use the `/transfer/ledger/deposit` endpoint to deposit funds into Plaid Ledger.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Ledger::Types::TransferLedgerDepositRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.ledger.deposit(
        #     amount: "amount",
        #     idempotency_key: "idempotency_key",
        #     network: "ach"
        #   )
        #
        # @return [Plaid::Types::TransferLedgerDepositResponse]
        def deposit(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/ledger/deposit",
            body: Plaid::Transfer::Ledger::Types::TransferLedgerDepositRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferLedgerDepositResponse.load(response.body))
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

        # Use the `/transfer/ledger/withdraw` endpoint to withdraw funds from a Plaid Ledger balance.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Ledger::Types::TransferLedgerWithdrawRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.ledger.withdraw(
        #     amount: "amount",
        #     idempotency_key: "idempotency_key",
        #     network: "ach"
        #   )
        #
        # @return [Plaid::Types::TransferLedgerWithdrawResponse]
        def withdraw(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/ledger/withdraw",
            body: Plaid::Transfer::Ledger::Types::TransferLedgerWithdrawRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferLedgerWithdrawResponse.load(response.body))
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

        # Use the `/transfer/ledger/event/list` endpoint to get a list of ledger events for a specific ledger based on
        # specified filter criteria.
        #
        # Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::TransferLedgerEvent` in the
        # `ledger_events` field of every page, requesting pages as they are needed. Call `pages` on it to get each page
        # as a `Plaid::Types::TransferLedgerEventListResponse`, including its other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Ledger::Types::TransferLedgerEventListRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.ledger.list_events
        #
        # @return [Plaid::Internal::OffsetItemIterator]
        def list_events(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          Plaid::Internal::OffsetItemIterator.new(
            initial_page: params[:offset],
            item_field: :ledger_events,
            has_next_field: nil,
            step: true
          ) do |next_page|
            params[:offset] = next_page
            request = Plaid::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "transfer/ledger/event/list",
              body: Plaid::Transfer::Ledger::Types::TransferLedgerEventListRequest.new(params).to_h,
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
                parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::TransferLedgerEventListResponse.load(response.body))
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
      end
    end
  end
end
