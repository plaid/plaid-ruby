# frozen_string_literal: true

module Plaid
  module BankTransfer
    module Balance
      class Client
        # @param client [Plaid::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use the `/bank_transfer/balance/get` endpoint to see the available balance in your bank transfer account.
        # Debit transfers increase this balance once their status is posted. Credit transfers decrease this balance when
        # they are created.
        #
        # The transactable balance shows the amount in your account that you are able to use for transfers, and is
        # essentially your available balance minus your minimum balance.
        #
        # Note that this endpoint can only be used with FBO accounts, when using Bank Transfers in the Full Service
        # configuration. It cannot be used on your own account when using Bank Transfers in the BTS Platform
        # configuration.
        #
        # @param request_options [Hash]
        # @param params [Plaid::BankTransfer::Balance::Types::BankTransferBalanceGetRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.bank_transfer.balance.get
        #
        # @return [Plaid::Types::BankTransferBalanceGetResponse]
        def get(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "bank_transfer/balance/get",
            body: Plaid::BankTransfer::Balance::Types::BankTransferBalanceGetRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::BankTransferBalanceGetResponse.load(response.body))
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
