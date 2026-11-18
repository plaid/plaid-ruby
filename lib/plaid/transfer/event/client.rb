# frozen_string_literal: true

module Plaid
  module Transfer
    module Event
      class Client
        # @param client [Plaid::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use the `/transfer/event/list` endpoint to get a list of transfer events based on specified filter criteria.
        #
        # Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::TransferEvent` in the
        # `transfer_events` field of every page, requesting pages as they are needed. Call `pages` on it to get each
        # page as a `Plaid::Types::TransferEventListResponse`, including its other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Event::Types::TransferEventListRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.event.list
        #
        # @return [Plaid::Internal::OffsetItemIterator]
        def list(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          Plaid::Internal::OffsetItemIterator.new(
            initial_page: params[:offset],
            item_field: :transfer_events,
            has_next_field: nil,
            step: true
          ) do |next_page|
            params[:offset] = next_page
            request = Plaid::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "transfer/event/list",
              body: Plaid::Transfer::Event::Types::TransferEventListRequest.new(params).to_h,
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
                parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::TransferEventListResponse.load(response.body))
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

        # `/transfer/event/sync` allows you to request up to the next 500 transfer events that happened after a specific
        # `event_id`. Use the `/transfer/event/sync` endpoint to guarantee you have seen all transfer events.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Event::Types::TransferEventSyncRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.event.sync(after_id: 1)
        #
        # @return [Plaid::Types::TransferEventSyncResponse]
        def sync(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/event/sync",
            body: Plaid::Transfer::Event::Types::TransferEventSyncRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferEventSyncResponse.load(response.body))
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
