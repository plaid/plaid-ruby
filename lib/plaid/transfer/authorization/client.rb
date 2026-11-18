# frozen_string_literal: true

module Plaid
  module Transfer
    module Authorization
      class Client
        # @param client [Plaid::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use the `/transfer/authorization/create` endpoint to authorize a transfer. This endpoint must be called prior
        # to calling `/transfer/create`. The transfer authorization will expire if not used after one hour. (You can
        # contact your account manager to change the default authorization lifetime.)
        #
        # There are four possible outcomes to calling this endpoint:
        #
        # - If the `authorization.decision` in the response is `declined`, the proposed transfer has failed the risk
        # check and you cannot proceed with the transfer.
        #
        # - If the `authorization.decision` is `user_action_required`, additional user input is needed, usually to fix a
        # broken bank connection, before Plaid can properly assess the risk. You need to launch Link in update mode to
        # complete the required user action. When calling `/link/token/create` to get a new Link token, instead of
        # providing `access_token` in the request, you should set
        # [`transfer.authorization_id`](https://plaid.com/docs/api/link/#link-token-create-request-transfer-authorization-id)
        # as the `authorization.id`. After the Link flow is completed, you may re-attempt the authorization.
        #
        # - If the `authorization.decision` is `approved`, and the `authorization.decision_rationale.code` is `null`,
        # the transfer has passed the risk check and you can proceed to call `/transfer/create`.
        #
        # - If the `authorization.decision` is `approved` and the `authorization.decision_rationale.code` is non-`null`,
        # the risk check could not be run: you may proceed with the transfer, but should perform your own risk
        # evaluation. For more details, see the response schema.
        #
        # In Plaid's Sandbox environment the decisions will be returned as follows:
        #
        # - To approve a transfer with `null` rationale code, make an authorization request with an `amount` less than
        # the available balance in the account.
        #
        # - To approve a transfer with the rationale code `MANUALLY_VERIFIED_ITEM`, create an Item in Link through the
        # [Same-Day Micro-deposits flow](https://plaid.com/docs/auth/coverage/testing/#testing-same-day-micro-deposits).
        #
        # - To get an authorization decision of `user_action_required`, [reset the login for an
        # Item](https://plaid.com/docs/sandbox/#item_login_required).
        #
        # - To decline a transfer with the rationale code `NSF`, the available balance on the account must be less than
        # the authorization `amount`. See [Create Sandbox test data](https://plaid.com/docs/sandbox/user-custom/) for
        # details on how to customize data in Sandbox.
        #
        # - To decline a transfer with the rationale code `RISK`, the available balance on the account must be exactly
        # $0. See [Create Sandbox test data](https://plaid.com/docs/sandbox/user-custom/) for details on how to
        # customize data in Sandbox.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Authorization::Types::TransferAuthorizationCreateRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.authorization.create(
        #     access_token: "access_token",
        #     account_id: "account_id",
        #     type: "debit",
        #     network: "ach",
        #     amount: "amount",
        #     user: {
        #       legal_name: "legal_name"
        #     }
        #   )
        #
        # @return [Plaid::Types::TransferAuthorizationCreateResponse]
        def create(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/authorization/create",
            body: Plaid::Transfer::Authorization::Types::TransferAuthorizationCreateRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferAuthorizationCreateResponse.load(response.body))
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

        # Use the `/transfer/authorization/cancel` endpoint to cancel a transfer authorization. A transfer authorization
        # is eligible for cancellation if it has not yet been used to create a transfer.
        #
        # @param request_options [Hash]
        # @param params [Plaid::Transfer::Authorization::Types::TransferAuthorizationCancelRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @example
        #   client.transfer.authorization.cancel(authorization_id: "authorization_id")
        #
        # @return [Plaid::Types::TransferAuthorizationCancelResponse]
        def cancel(request_options: {}, **params)
          params = Plaid::Internal::Types::Utils.normalize_keys(params)
          request = Plaid::Internal::JSON::Request.new(
            base_url: request_options[:base_url],
            method: "POST",
            path: "transfer/authorization/cancel",
            body: Plaid::Transfer::Authorization::Types::TransferAuthorizationCancelRequest.new(params).to_h,
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
              (response.body.to_s.empty? ? nil : Plaid::Types::TransferAuthorizationCancelResponse.load(response.body))
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
