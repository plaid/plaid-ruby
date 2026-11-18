# frozen_string_literal: true

module Plaid
  module Transfer
    module Sweep
      class Client
        # @param client [Plaid::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # The `/transfer/sweep/get` endpoint fetches a sweep corresponding to the given `sweep_id`.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Sweep::Types::TransferSweepGetRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.sweep.get(sweep_id: "sweep_id")
        #
        # @return [Plaid::Types::TransferSweepGetResponse]
        def get(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/sweep/get",
            body: Plaid::Transfer::Sweep::Types::TransferSweepGetRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferSweepGetResponse.load(response.body))
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

        # The `/transfer/sweep/list` endpoint fetches sweeps matching the given filters.
        #
        # Returns a `Plaid::Internal::OffsetItemIterator` that yields each `Plaid::Types::TransferSweep` in the `sweeps`
        # field of every page, requesting pages as they are needed. Call `pages` on it to get each page as a
        # `Plaid::Types::TransferSweepListResponse`, including its other fields.
        #
        # No request is sent by this call. The first page is requested when you start iterating (or call
        # `load_first_page`), so an API error is raised by the loop (or by `load_first_page`), not by this call.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Sweep::Types::TransferSweepListRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.sweep.list
        #
        # @return [Plaid::Internal::OffsetItemIterator]
        def list(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          Plaid::Internal::OffsetItemIterator.new(
            initial_page: params[:offset],
            item_field: :sweeps,
            has_next_field: nil,
            step: true
          ) do |next_page|
            params[:offset] = next_page
            request = Plaid::Internal::JSON::Request.new(
              base_url: request_options[:base_url],
              method: "POST",
              path: "transfer/sweep/list",
              body: Plaid::Transfer::Sweep::Types::TransferSweepListRequest.new(params).to_h,
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
                parsed_response = (response.body.to_s.empty? ? nil : Plaid::Types::TransferSweepListResponse.load(response.body))
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
