# frozen_string_literal: true

module Plaid
  module BankTransfer
    module Event
      class Client
        # @param client [Plaid::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use the `/bank_transfer/event/list` endpoint to get a list of Plaid-initiated ACH or bank transfer events
        # based on specified filter criteria. When using Auth with micro-deposit verification enabled, this endpoint can
        # be used to fetch status updates on ACH micro-deposits. For more details, see [micro-deposit
        # events](https://plaid.com/docs/auth/coverage/microdeposit-events/).
        #
        # Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::BankTransferEvent` in the
        # `bank_transfer_events` field of every page, requesting pages as they are needed. Call `pages` on it to get
        # each page as a `Plaid::Types::BankTransferEventListResponse`, including its other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
        #
        # @param request_options [Hash]
        # @param params [Plaid::BankTransfer::Event::Types::BankTransferEventListRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.bank_transfer.event.list
        #
        # @return [Plaid::Internal::OffsetItemIterator]
        def list(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          Plaid::Internal::OffsetItemIterator.new(
            initial_page: params[:offset],
            item_field: :bank_transfer_events,
            has_next_field: nil,
            step: true
          ) do |next_page|
            params[:offset] = next_page
            request = Plaid::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "bank_transfer/event/list",
              body: Plaid::BankTransfer::Event::Types::BankTransferEventListRequest.new(params).to_h,
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
                parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::BankTransferEventListResponse.load(response.body))
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

        # `/bank_transfer/event/sync` allows you to request up to the next 25 Plaid-initiated bank transfer events that
        # happened after a specific `event_id`. When using Auth with micro-deposit verification enabled, this endpoint
        # can be used to fetch status updates on ACH micro-deposits. For more details, see [micro-deposit
        # events](https://plaid.com/docs/auth/coverage/microdeposit-events/).
        #
        # @param request_options [Hash]
        # @param params [Plaid::BankTransfer::Event::Types::BankTransferEventSyncRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.bank_transfer.event.sync(after_id: 1)
        #
        # @return [Plaid::Types::BankTransferEventSyncResponse]
        def sync(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "bank_transfer/event/sync",
            body: Plaid::BankTransfer::Event::Types::BankTransferEventSyncRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::BankTransferEventSyncResponse.load(response.body))
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
end
